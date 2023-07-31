# ETH-AVAX-MODule 4
# Degen Gaming ERC20 Token on Avalanche Network

## Overview

Welcome to the Degen Gaming ERC20 token project on the Avalanche network! This smart contract allows for the creation, transfer, redemption, and burning of Degen Gaming tokens. Players can earn these tokens as rewards for their participation in games and other activities within the Degen Gaming platform.

## Contract Details

- Contract Address: [Insert Contract Address Here]
- Network: Avalanche

## Functionality

### Minting New Tokens

Only the owner of the smart contract has the authority to mint new tokens. As the owner, you can create and distribute tokens to players as rewards for their contributions to Degen Gaming.

### Transferring Tokens

Players have the ability to transfer their Degen Gaming tokens to other participants within the platform. This functionality facilitates peer-to-peer token transactions and enables a seamless transfer of value between players.

### Redeeming Tokens

Players can redeem their Degen Gaming tokens for various in-game items available in the Degen Gaming store. This feature incentivizes players to earn and accumulate tokens, as they can utilize them to access exclusive in-game content.

### Checking Token Balance

At any time, players can easily check their Degen Gaming token balance. This transparency allows users to keep track of their token holdings and make informed decisions about their in-game activities.

### Burning Tokens

In the spirit of decentralization and user autonomy, anyone can burn their own Degen Gaming tokens that they no longer need or want. Burning tokens removes them from circulation and reduces the total supply of tokens, influencing the overall token economy.

## Getting Started

To interact with the Degen Gaming ERC20 token on the Avalanche network, you can utilize popular Ethereum wallets and tools that support the Avalanche network, such as Metamask with Avalanche Network configuration.

Please note that while using this smart contract, you should be cautious about the transactions you execute, as all actions are irreversible on the blockchain.

## Example Transactions

Below are some example transactions that showcase the functionality of the Degen Gaming ERC20 token:

## Minting Tokens

```
// Solidity function (onlyOwner modifier is assumed)
function mintTokens(address player, uint256 amount) public onlyOwner {
    // Mint 'amount' tokens and transfer them to 'player'
    _mint(player, amount);
}
```

## Transferring Tokens

```
// Solidity function
function transferTokens(address recipient, uint256 amount) public {
    // Transfer 'amount' tokens from the sender's balance to the recipient's balance
    _transfer(msg.sender, recipient, amount);
}
```

## Redeeming Tokens

```
// Solidity function
function redeemTokens(uint256 amount) public {
    // Implement redemption logic here
    // For example, unlocking in-game items or features
}
```

## Burning Tokens

```
// Solidity function
function burnTokens(uint256 amount) public {
    // Burn 'amount' tokens from the sender's balance
    _burn(msg.sender, amount);
}
```
## Author 
Aishwarya 

##License 
MIt 
