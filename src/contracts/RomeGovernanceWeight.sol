// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.11;

import "./interfaces/IRomeAuthority.sol";
import "./interfaces/IsROME.sol";
import "./interfaces/IConscription.sol";
import "./types/RomeAccessControlled.sol";

contract RomeGovernanceWeight is RomeAccessControlled {
    /* ========== STATE VARIABLES ========== */

    IsROME sROME;
    IConscription conscription;

    /* ========== CONSTRUCTOR ========== */

    constructor(        
        address _sROME,
        address _conscription,
        address _authority        
    ) RomeAccessControlled( IRomeAuthority(_authority) ) {
        sROME = IsROME(_sROME);
        conscription = IConscription(_conscription);
    }

    /* ========== FUNCTIONS ========== */

    function getGovernanceWeight(string calldata house, address voter) external view returns(uint) {
        if (bytes32(bytes(house)) != conscription.profile(voter).house) {
            return 0;
        } else {
            return sROME.balanceOf(voter) + sROME.balanceForGons(conscription.profile(voter).gons);            
        }        
    }

    /* ========== MANAGEMENT ========== */

    function setConscription(address _conscription) external onlyGovernor {
        conscription = IConscription(_conscription);
    }

    function setSROME(address _sROME) external onlyGovernor {
        sROME = IsROME(_sROME);
    }
}
