pragma solidity 0.8.9;

interface IRomeGovernanceFactory {
    /* ========== EVENTS ========== */

    event ProposalCreated(
        address _proposer, 
        address _token, 
        uint _quorumPercent, 
        uint _votingDelay, 
        uint _endBlock, 
        string[] _options
    );

    /* ========== FUNCTIONS ========== */
    function propose(
        address _token,
        uint _quorumPercent,
        uint _votingDelay,
        uint _endBlock,
        string[] _options
    )
}