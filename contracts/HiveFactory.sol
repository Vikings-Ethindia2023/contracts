pragma solidity ^0.8.0;

import "./HiveProject.sol";

contract HiveFactory {
    address public hiveTokenAddress;
    address public owner;
    address[] public projects;

    constructor() {
        owner = msg.sender;
        hiveTokenAddress = address(new HiveToken());
    }

    function CreateHiveProject(
        uint256 payoutAmount,
        uint256 investmentAmount,
        string memory metadata
    ) public {
        HiveProject k = new HiveProject(
            owner,
            hiveTokenAddress,
            payoutAmount,
            investmentAmount,
            metadata
        );
        projects.push(address(k));
    }
}
