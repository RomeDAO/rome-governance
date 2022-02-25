pragma solidity 0.8.9;

interface IRomeGovernanceAuthority {
    /* ========== EVENTS ========== */
    event DaoPushed(address indexed _from, address indexed _to, bool _effectiveImmediately);
    event DaoPulled(address indexed _from, address indexed _to);
    event GovernorPushed(bytes32 _house, address indexed _to, bool _effectiveImmediately);
    event GovernorPulled(bytes32 _house, address indexed _from, address indexed _to);
    event GovernorRenounced(bytes32 _house, address indexed _governor);

    /* ========== FUNCTIONS ========== */
    function pushDao(address _dao, bool _effectiveImmediately) external;
    function pullDao(address _dao) external;
    function pushGovernor(bytes32 _house, address _governor, bool _effectiveImmediately) external;
    function pullGovernor(bytes32 _house, address _governor) external;

    /* ========== VIEW ========== */
    function dao() external view returns (address);
    function governor(bytes32 _house) external view returns (address);
}