// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 standard library from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private owner;

    constructor(uint256 initialSupply, address owner_) ERC20("CoderCoin", "CDC") {
        owner = owner_;
        _mint(owner, initialSupply);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override(ERC20) returns(bool) {
        _transfer(from, to, amount);
        return true;
    }
}
