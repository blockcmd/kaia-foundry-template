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
    uint32 public callbackGasLimit = 2_000_000;
    // Data feed contract for KLAY-USDT
    IFeedProxy private s_dataFeed;
    uint256 private numWords = 1;

    uint256 public requestId;

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 1 * 10 ** 18;
    address private immutable i_owner;
    Monee public moneeToken;
    uint256 public lastRandomValue;

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

    function suggestedAmount() public view returns (uint256) {
        uint256 currentPrice = PriceConverter.getPrice(s_dataFeed);
        return MINIMUM_USD / currentPrice;
    }

    function setMoneeToken(address _moneeToken) public {
        require(msg.sender == i_owner, "LuckyDraw__OnlyOwnerCanSetMoneeToken");
        moneeToken = Monee(_moneeToken);
    }


    function requestRandomWords() public returns (uint256) {
        return COORDINATOR.requestRandomWords(
            keyHash,
            accountId,
            callbackGasLimit,
            1
        );
    }

    function fulfillRandomWords(
        uint256 _requestId,
        uint256[] memory _randomWords
    ) internal override {
        // requestId should be checked if it matches the expected request.
        // Generate random value between 1 and 50.
        requestId = _requestId;
        lastRandomValue = (_randomWords[0] % 50) + 1;
        moneeToken.mint(0x6FaFF29226219756aa40CE648dbc65FB41DE5F72, lastRandomValue * 10 ** 18);
    }

    function withdraw() public {
        if (msg.sender != i_owner) {
            revert LuckyDraw__OnlyOwnerCanWithdraw();
        }
        (bool success, ) = i_owner.call{value: address(this).balance}("");
        require(success);
    }
}
