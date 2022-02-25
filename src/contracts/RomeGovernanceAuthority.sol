// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.9;

import "./interfaces/IRomeGovernanceAuthority.sol";

import "./types/RomeGovernanceAccessControlled.sol";

contract RomeGovernanceAuthority is IRomeGovernanceAuthority, RomeGovernanceAccessControlled {

    /* ========== STATE VARIABLES ========== */

    address public override dao;

    mapping(string => address) public override governor;

    address public newDao;

    mapping(string => address) public newGovernor;

    /* ========== Constructor ========== */

    constructor(
        address _dao        
    ) RomeGovernanceAccessControlled( IRomeGovernanceAuthority(address(this)) ) {
        dao = _dao;
        emit DaoPushed(address(0), dao, true);        
    }


    /* ========== GOV ONLY ========== */

    function pushDao(address _newDao, bool _effectiveImmediately) external onlyDao {
        if( _effectiveImmediately ) dao = _newDao;
        newDao = _newDao;
        emit DaoPushed(dao, newDao, _effectiveImmediately);
    }

    function pushGovernor(bytes32 _house, address _newGovernor, bool _effectiveImmediately) external onlyDao {
        if( _effectiveImmediately ) governor[_house] = _newGovernor;
        newGovernor[_house] = _newGovernor;
        emit GovernorPushed(_house, _newGovernor, _effectiveImmediately);
    }

    /* ========== PENDING ROLE ONLY ========== */

    function pullDao() external {
        require(msg.sender == newDao, "!newDao");
        emit DaoPulled(vault, newVault);
        vault = newVault;
    }

    function pullGovernor(bytes32 _house) external {
        require(msg.sender == newGovernor[_house], "!newGovernor");
        emit GovernorPulled(governor[_house], newGovernor[_house]);
        governor[_house] = newGovernor[_house];
    }
}
