// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.11;

interface IsROME {    
    function balanceOf(address account) external view returns (uint256);
    function balanceForGons(uint gons) external view returns (uint);
}
