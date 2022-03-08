// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.11;

interface IConscription {
    // Character Profile
    struct Profile {
        bytes32 name; // name of the user character attached to wallet
        bytes32 house; // Id of the house (in the array)
        uint256 classId; // classId for the user (position in the classes array)
        uint256 gons; // gons debt to user. Non zero when profile is activated
    }

    function profile(address) external view returns(Profile calldata); 

    function lockupAmount() external view returns(uint256); 
}
