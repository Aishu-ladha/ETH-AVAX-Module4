
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract DEGENToken is ERC20, Ownable, Pausable {
    mapping(address => bool) private _redeemers;
    mapping(uint256 => Item) private _storeItems;
    uint256 private _totalItems;

    struct Item {
        string name;
        uint256 price;
    }

    event ItemAdded(uint256 itemId, string name, uint256 price);
    event Redeemed(address indexed user, uint256 itemId, string itemName, uint256 itemPrice);

    constructor() ERC20("Degen", "DGEN") {
        _mint(msg.sender, 0);
    }

    function addStoreItem(string memory name, uint256 price) public onlyOwner whenNotPaused {
        _totalItems++;
        _storeItems[_totalItems] = Item(name, price);
        emit ItemAdded(_totalItems, name, price);
    }
     function mintDGENToken(address to, uint256 amount) public onlyOwner whenNotPaused {
        _mint(to, amount);
    }
    function burnDGENToken(uint256 amount) public whenNotPaused {
        _burn(msg.sender, amount);
    }

    function toggleRedeemer(address user) public onlyOwner {
        _redeemers[user] = !_redeemers[user];
    }
     function isRedeemer(address user) public view returns (bool) {
        return _redeemers[user];
    }

    function redeemItem(uint256 itemId) public whenNotPaused {
        require(_redeemers[msg.sender], "Not allowed to redeem");
        require(itemId <= _totalItems && itemId > 0, "Invalid item ID");
        Item storage item = _storeItems[itemId];
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");
        
        _transfer(msg.sender, owner(), item.price);
        _burn(msg.sender ,item.price);
        emit Redeemed(msg.sender, itemId, item.name, item.price);
    }

    

    function getItemInfo(uint256 itemId) public view returns (string memory, uint256) {
        require(itemId <= _totalItems && itemId > 0, "Invalid item ID");
        Item memory item = _storeItems[itemId];
        return (item.name, item.price);
    }

    function getAllItems() public view returns (string[] memory, uint256[] memory) {
        string[] memory names = new string[](_totalItems);
        uint256[] memory prices = new uint256[](_totalItems);

        for (uint256 i = 1; i <= _totalItems; i++) {
            Item memory item = _storeItems[i];
            names[i - 1] = item.name;
            prices[i - 1] = item.price;
        }

        return (names, prices);
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    

    function transferDGEN(address to, uint256 amount) public whenNotPaused returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}

