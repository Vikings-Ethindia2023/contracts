// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract HiveToken is ERC20, ERC20Permit {
    constructor() ERC20("HiveToken", "HTK") ERC20Permit("HiveToken") {}

    function purchaseTokens() public payable {
        if (msg.value > 0) {
            _mint(msg.sender, msg.value * 1000000);
        } else {
            revert("Insufficient Amount sent");
        }
    }
}
