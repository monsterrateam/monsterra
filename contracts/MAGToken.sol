// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MAGToken is ERC20, Ownable {

    mapping (address => bool ) public minter;

    address[] private minterList;
    
    constructor() ERC20("MAG Token", "MAG") {
        //add owner to minterList
        addMinter(msg.sender);
    }

    modifier onlyMinter() {
        require(minter[msg.sender], "Only-minter");
        _;
    }

    function mint(address to, uint256 amount) public onlyMinter{
        _mint(to, amount);
    }

    function burn(uint256 amount) public virtual {
        _burn(msg.sender, amount);
    }

    function addMinter(address _minterAddr) public onlyOwner{
        require(!minter[_minterAddr], "Is minter");
        minterList.push(_minterAddr);
        minter[_minterAddr] = true;
    }

    function removeMinter(address _minterAddr) public onlyOwner{
        require(minter[_minterAddr], "Not minter");
        minter[_minterAddr] = false;
        
        uint256 i = 0;
        address _minter;
        while (i < minterList.length) {
            _minter = minterList[i];
            if (!minter[_minter]) {
                minterList[i] = minterList[minterList.length - 1];
                delete minterList[minterList.length - 1];
                minterList.pop();
            } else {
                i++;
            }
        }
    }

    function getMinters() public view returns (address[] memory){
        return minterList;
    }
    
}