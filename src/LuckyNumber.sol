// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import "@bisonai/orakl-contracts/src/v0.1/VRFConsumerBase.sol";
import "@bisonai/orakl-contracts/src/v0.1/interfaces/IVRFCoordinator.sol";

contract VRFConsumer is VRFConsumerBase {
    IVRFCoordinator COORDINATOR;

    constructor(address coordinator) VRFConsumerBase(coordinator) {
        COORDINATOR = IVRFCoordinator(coordinator);
    }
}

contract LuckyNumber {
    constructor(address dataFeed, uint16 startingNumber) {
        number = startingNumber;
        dataFeed = dataFeed;
    }

    function requestRandomWords(
        bytes32 keyHash,
        uint32 callbackGasLimit,
        uint32 numWords,
        address refundRecipient
    ) public payable onlyOwner returns (uint256 requestId) {
        requestId = COORDINATOR.requestRandomWords{value: msg.value}(
            keyHash,
            callbackGasLimit,
            numWords,
            refundRecipient
        );
    }
}
