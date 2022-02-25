// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.9;

import "../interfaces/IRomeGonernanceAuthority.sol";

abstract contract RomeGovernanceAccessControlled {

    /* ========== EVENTS ========== */

    event AuthorityUpdated(IRomeGonernanceAuthority indexed _authority);

    string UNAUTHORIZED = "UNAUTHORIZED"; // save gas

    /* ========== STATE VARIABLES ========== */

    IRomeGonernanceAuthority public authority;

    /* ========== Constructor ========== */

    constructor(IRomeAuthority _authority) {
        authority = _authority;
        emit AuthorityUpdated(_authority);
    }
    

    /* ========== MODIFIERS ========== */
    
    modifier onlyDao() {
        require(msg.sender == authority.dao(), UNAUTHORIZED);
        _;
    }

    modifier onlyGovernor(bytes _house) {
        require(msg.sender == authority.governor(_house), UNAUTHORIZED);
        _;
    }
    
    /* ========== GOV ONLY ========== */
    
    function setAuthority(IRomeAuthority _newAuthority) external onlyDAO {
        authority = _newAuthority;
        emit AuthorityUpdated(_newAuthority);
    }
}
