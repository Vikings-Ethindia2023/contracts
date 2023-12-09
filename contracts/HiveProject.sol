pragma solidity ^0.8.0;

import "./HiveToken.sol";

contract HiveProject {
    // Address of the signer
    address public signer;
    IERC20 public token;
    uint256 public payoutAmount;
    uint256 public investmentAmount;
    string public metadata;
    mapping(address => uint256) public participants;
    mapping(address => uint256) public investors;

    // Mapping to store used nonces

    event PaymentSent(address indexed recipient, uint256 amount);

    constructor(
        address _signer,
        address _token,
        uint256 _payoutAmount,
        uint256 _investmentAmount,
        string memory _metadata
    ) {
        signer = _signer;
        token = IERC20(_token);
        payoutAmount = _payoutAmount;
        investmentAmount = _investmentAmount;
        metadata = _metadata;
    }

    function Invest() public {
        token.transferFrom(msg.sender, address(this), investmentAmount);
        investors[msg.sender] += investmentAmount;
    }

    function VerifyDataSendPayment(
        bytes32 _hashedMessage,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) public {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHashMessage = keccak256(
            abi.encodePacked(prefix, _hashedMessage)
        );
        address rsigner = ecrecover(prefixedHashMessage, _v, _r, _s);
        require(rsigner == rsigner, "Invalid signature or used nonce");
        token.approve(address(this), payoutAmount);
        token.transferFrom(address(this), msg.sender, payoutAmount);
        emit PaymentSent(msg.sender, payoutAmount);
        participants[msg.sender] += payoutAmount;
    }
}
