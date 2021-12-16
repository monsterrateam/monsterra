// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MAGToken is ERC20, Ownable {

    mapping (address => bool ) public whiteList;
    
    constructor() ERC20("MAG Token", "MAG") {
        //Whitelist owner
        whiteList[msg.sender] = true;
    }

    modifier onlyWhiteList() {
        require(whiteList[msg.sender], "Only-whitelist-minter");
        _;
    }

    function adminWhiteList(address _whitelistAddr, bool _whiteList) onlyOwner public {
        whiteList[_whitelistAddr] = _whiteList;
    }
  
    function mint(address to, uint256 amount) public onlyWhiteList{
        _mint(to, amount);
    }

    function burn(uint256 amount) public virtual {
        _burn(msg.sender, amount);
    }
    
}