// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {IFeedProxy} from "@bisonai/orakl-contracts/v0.2/src/interfaces/IFeedProxy.sol";
import {VRFConsumerBase} from "@bisonai/orakl-contracts/v0.1/src/VRFConsumerBase.sol";
import {IVRFCoordinator} from "@bisonai/orakl-contracts/v0.1/src/interfaces/IVRFCoordinator.sol";
import {PriceConverter} from "./PriceConverter.sol";
import {Monee} from "./MoneeToken.sol";

error LuckyDraw__InsufficientAmount();
error LuckyDraw__OnlyOwnerCanWithdraw();
error LuckyDraw_RequestNotFound();

contract LuckyDraw is VRFConsumerBase {
    // VRF Coordinator
    IVRFCoordinator COORDINATOR;
    // Account ID to use for VRF requests
    uint64 private accountId;
    // Key Hash to use for VRF requests
    bytes32 public keyHash;
    // Gas limit to use for VRF requests
    uint32 public callbackGasLimit = 300_000;
    // Data feed contract for KLAY-USDT
    IFeedProxy private s_dataFeed;

    uint256 public requestId;

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 1 * 10 ** 18;
    address private immutable i_owner;
    Monee private moneeToken;
    uint256 public lastRandomValue;
    event RequestSent(uint256 requestId, uint32 numWords);
    event RequestFulfilled(uint256 requestId, uint256[] randomWords);

    struct RequestStatus {
        bool fulfilled; // whether the request has been successfully fulfilled
        bool exists; // whether a requestId exists
        uint256[] randomWords;
    }
    mapping(uint256 => RequestStatus) public s_requests;

    constructor(
        address _dataFeed,
        address _coordinator,
        bytes32 _keyHash,
        uint64 _accountId
    ) VRFConsumerBase(_coordinator) {
        s_dataFeed = IFeedProxy(_dataFeed);
        COORDINATOR = IVRFCoordinator(_coordinator);
        accountId = _accountId;
        keyHash = _keyHash;
        i_owner = msg.sender;
    }

    function draw() public payable returns (uint256){
        if (msg.value.getConversionRate(s_dataFeed) < MINIMUM_USD) {
            revert LuckyDraw__InsufficientAmount();
        }
        requestId = requestRandomWords(keyHash, accountId, callbackGasLimit, 1);
        return requestId;
    }

    function suggestedAmount() public view returns (uint256) {
        uint256 currentPrice = PriceConverter.getPrice(s_dataFeed);
        return MINIMUM_USD / currentPrice;
    }

    function requestRandomWords(
        bytes32 _keyHash,
        uint64 _accountId,
        uint32 _callbackGasLimit,
        uint32 _numWords
    ) public returns (uint256 _requestId) {
        _requestId = COORDINATOR.requestRandomWords(
            _keyHash,
            _accountId,
            _callbackGasLimit,
            _numWords
        );
    }

    function fulfillRandomWords(
        uint256 _requestId,
        uint256[] memory _randomWords
    ) internal override {
        // requestId should be checked if it matches the expected request.
        // Generate random value between 1 and 50.
        if (_requestId != requestId) {
            revert LuckyDraw_RequestNotFound();
        }
        lastRandomValue = (_randomWords[0] % 50) + 1;
        moneeToken.mint(0x6FaFF29226219756aa40CE648dbc65FB41DE5F72, lastRandomValue);
    }

    function withdraw() public {
        if (msg.sender != i_owner) {
            revert LuckyDraw__OnlyOwnerCanWithdraw();
        }
        (bool success, ) = i_owner.call{value: address(this).balance}("");
        require(success);
    }
}
