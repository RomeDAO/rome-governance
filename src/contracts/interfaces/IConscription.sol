// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.11;

interface IConscription {
    function profiles(address) external view returns(bytes32, bytes32, uint256, uint256); 

    function lockupAmount() external view returns(uint256); 
}
