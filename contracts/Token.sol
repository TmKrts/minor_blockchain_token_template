// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    // Wei
    constructor(uint256 initialSupply) public ERC20("1012test", "10t") {
        _mint(msg.sender, initialSupply);
    }
}
