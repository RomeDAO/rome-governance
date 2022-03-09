// https://kndrck.co/posts/hevm_seth_cheatsheet/
// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.11;

/* ========== FORGE DEPENDENDCIES ========== */
import "../../lib/ds-test/src/test.sol";
import "./utils/Vm.sol";

import {RomeGovernanceWeight} from "../contracts/RomeGovernanceWeight.sol";
import {RomeAuthority} from "../contracts/RomeAuthority.sol";
import "../contracts/interfaces/IRomeAuthority.sol";
import "../contracts/interfaces/IsROME.sol";
import "../contracts/interfaces/IConscription.sol";
import "./utils/console.sol";

contract RomeGovernanceWeightTest is DSTest {
    Vm internal constant vm = Vm(HEVM_ADDRESS);
    RomeAuthority romeAuthority;
    RomeGovernanceWeight romeGovernanceWeight;
    IsROME sROME;
    IConscription conscription;
    address voter;

    function setUp() public virtual {
        emit log("|==================== SET UP ====================|");  
        romeAuthority = new RomeAuthority(
            address(this),
            address(2),
            address(3),
            address(4)
        );        
        sROME = IsROME(0x89F52002E544585b42F8c7Cf557609CA4c8ce12A);
        conscription = IConscription(0x3718bC4389cC4d960CeDF9ff68e96c731BC8f685);

        romeGovernanceWeight = new RomeGovernanceWeight(
            address(sROME),
            address(conscription),
            address(romeAuthority)
        );

        voter = address(0); //input a romie address here
    }

    function testRomeGovernanceWeight() public {                
        uint sRomeBalance = sROME.balanceOf(0xd7d9bce78aCeAd3EB9199097C0dB6F03A1f3082A);
        emit log_named_uint("<|sRomeBalance|> ==", sRomeBalance);
        
        uint houseWeight = romeGovernanceWeight.getGovernanceWeight(
            "SEMPRONIA",
            voter
        );                
        emit log_named_uint("<|house weight|> ==", houseWeight);
        require(houseWeight != 0);

        uint romeWeight = romeGovernanceWeight.getGovernanceWeight(
            "ROME",
            voter
        );
        emit log_named_uint("<|rome weight|> ==", romeWeight);
        require(romeWeight != 0);

        uint diffHouseWeight = romeGovernanceWeight.getGovernanceWeight(
            "KEK",
            voter
        );
        emit log_named_uint("<|different house weight|> ==", diffHouseWeight);
        require(diffHouseWeight == 0);
    }

    /* ========== HELPERS ========== */
}