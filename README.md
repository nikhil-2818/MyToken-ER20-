# CoderCoin Token

## Overview

This repository contains the Solidity smart contract code for the CoderCoin (CDC) token. CoderCoin is an ERC20-compliant token deployed on the Ethereum blockchain.The MyToken contract is declared. It inherits from the ERC20 contract imported from OpenZeppelin. This means MyToken inherits all the functionality of the ERC20 token standard and can extend or override it as needed.

## Contract Details

### Variables

- `owner` (private, address): Stores the address of the contract owner.
- `supplyTotal`= Stores the total number of token.
### Functions

1. `Constructor`: It takes two arguments `initialSupply`, `owner_`
- initialSupply (uint256): The initial total supply of CoderCoin tokens.
- owner_ (address): The address of the initial contract owner.
- Sets the token name ("CoderCoin") and symbol ("CDC").
- Mints the initial supply of tokens to the owner address.
2. `mintCoin`(address to, uint256 amount): This function can mint a new token but only contract owner can mint the token.
-Modifier: onlyOwner - restricts access to the contract owner.
- to (address): The address to receive the minted tokens.
- amount (uint256): The number of tokens to mint.
3. `burnCoin`(uint256 amount): this function allows you to burn token
- amount (uint256): The number of tokens to burn.
4. `transferCoin`(address to, uint256 amount): This function allows you transfer token to other address.
- Standard ERC20 function for transferring tokens between accounts.
- to (address): The address receiving the tokens.
- amount (uint256): The number of tokens to transfer.

## Usage
to uses this contract or exectue you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., OwnToken.sol). Copy and paste the following code into the file:

```solidity
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


```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "Compile OwnToken.sol" button.

Once the code is compiled, Select "Injected provider" as the environment (assuming you have a wallet like MetaMask connected to Remix) and then you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "OwnToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can use the deployed contract interface to call the mint, burn, transfer and other ERC20 Standart main functions.In this you can tranfer token from your own wallet to other address.You can enter addresses and values to test the functionality. After entering data, click on "transact" button to execute the function and mint token and similarly burn , tranfer and do testing. 

## Contact
For any questions or suggestions, feel free to open an issue or contact the repository owner.

Mail - nikhil.mkbn@gmail.com
