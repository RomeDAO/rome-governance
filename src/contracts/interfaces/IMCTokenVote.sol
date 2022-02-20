pragma solidity 0.8.9;

interface IMCTokenVote {
    /* ========== EVENTS ========== */

    /// @notice An event emitted when a vote has been cast on a proposal
    event VoteCast(address voter, uint8 option, uint votes);

    /// @notice An event emitted when a proposal has been canceled
    event ProposalCanceled();

    /// @notice An event emitted when a proposal has been queued in the Timelock
    event ProposalQueued(uint eta);

    /// @notice An event emitted when a proposal has been executed in the Timelock
    event ProposalExecuted();


    /* ========== FUNCTIONS ========== */
    function castVote(uint8 option) public;    
    function start() public;
    function cancel() public;
    function execute() public;

    /* ========== VIEW ========== */
    function state() public view;
}