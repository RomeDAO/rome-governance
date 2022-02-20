pragma solidity 0.8.9;

interface IRomeGovernanceAuthority {
    /* ========== EVENTS ========== */
    event GovernorPushed(bytes32 _house, address indexed from, address indexed to, bool _effectiveImmediately);
    event GovernorPulled(bytes32 _house, address indexed from, address indexed to);

    /* ========== FUNCTIONS ========== */
    function pushGovernor(bytes32 _house, address _governor, bool _effectiveImmediately) external;
    function pullGovernor(bytes32 _house, address _governor) external;

    /* ========== VIEW ========== */
    function governor(bytes32 _house) external view returns (address);
}