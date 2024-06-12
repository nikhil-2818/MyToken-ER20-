// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 standard library from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address owner;
    uint256 supplyTotal = 0;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(uint256 initialSupply) ERC20("CoderCoin", "CDC") {
        owner = msg.sender;
        _mint(owner, initialSupply);
        supplyTotal += initialSupply;
    }

    function CDCIHave() public view returns (uint256){
        return balanceOf(msg.sender);
    }

    function mintCoin(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        supplyTotal += amount;
    }

    function burnCoin(uint256 amount) public {
        _burn(msg.sender, amount);
        supplyTotal -= amount;
    }

    function transferCoin(address to, uint256 amount) public{
        _transfer(msg.sender, to, amount);
    }
}
