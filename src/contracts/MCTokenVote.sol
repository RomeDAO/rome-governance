pragma solidity 0.8.9;

import "./libraries/SafeERC20.sol";

contract TokenVote {
    using SafeMath for uint256;
    using SafeMath for uint8;
    
    /// @notice An event emitted when a vote has been cast on a proposal
    event VoteCast(address voter, uint8 option, uint votes);

    /// @notice An event emitted when a proposal has been canceled
    event ProposalCanceled();

    /// @notice An event emitted when a proposal has been queued in the Timelock
    event ProposalQueued(uint eta);

    /// @notice An event emitted when a proposal has been executed in the Timelock
    event ProposalExecuted();

    /// @notice Possible states that a proposal may be in
    enum ProposalState {
        Pending,
        Active,
        Canceled,        
        Queued,
        Expired,
        Executed
    }

    /// @notice Ballot receipt record for a voter
    struct Receipt {
        uint8 option;
        uint votes;
        bool hasVoted;
    }

    address public proposer;
    address public token;
    uint public quorumPercent;        
    uint public createdBlock;
    uint public votingDelay;
    uint public startBlock;
    uint public endBlock;
    bool public canceled;
    bool public executed;

    string[] public options;
    mapping (address => Receipt) public receipts    

    constructor( 
        address _proposer, 
        address _token, 
        uint _quorumPercent, 
        uint _votingDelay, 
        uint _endBlock, 
        string[] _options
    ) {
        require(_endBlock > block.number && _endBlock > block.number.add(_votingDelay));
        require(_quorumPercent > 1000);
        require(_options.length < 20);

        proposer = _proposer;
        createdBlock = block.number;
        votingDelay = _votingDelay;
        endBlock = _endBlock;
        quorumPercent = _quorumPercent;        
        options = _options;
    }
}