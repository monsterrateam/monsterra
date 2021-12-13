// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MSTRToken is  ERC20Burnable {
    uint private constant HARD_CAP = 100_000_000e18; // 100m token

    /**
     * @dev Constructor function of MSTR Token
     * @dev set name, symbol and decimal of token
     * @dev mint totalSupply (cap) to admin address
     */
    constructor () ERC20("MSTR Token", "MSTR"){
        _mint(msg.sender, HARD_CAP);
    }
    

}