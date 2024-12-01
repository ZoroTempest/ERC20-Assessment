// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Structure to represent a food item
    struct FoodItem {
        uint256 foodId;
        string foodName;
        uint256 foodCost;
    }

    FoodItem[] public availableFood; // List of available food items

    // Mapping to store owned food items for each address
    mapping(address => FoodItem[]) private ownedFoodItems;

    constructor() ERC20("FoodToken", "FTK") Ownable(msg.sender) {
        // Initialize some food items with different prices
        availableFood.push(FoodItem(1, "Banana Cake", 10));
        availableFood.push(FoodItem(2, "Liemposilog", 25));
        availableFood.push(FoodItem(3, "Croffles", 30));
        availableFood.push(FoodItem(4, "Iced Latte", 15));
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0; // No fractional tokens
    }

    function getTokenBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint256 amount) public {
        require(
            balanceOf(msg.sender) >= amount,
            "Insufficient token balance to burn"
        );
        _burn(msg.sender, amount);
    }

    function transferTokens(address recipient, uint256 amount) external {
        require(
            balanceOf(msg.sender) >= amount,
            "Transfer failed: insufficient balance"
        );
        approve(msg.sender, amount);
        transferFrom(msg.sender, recipient, amount);
    }

    // Redeem tokens for a specific food item
    function redeemFood(uint256 foodId) external {
        require(foodId > 0 && foodId <= availableFood.length, "Invalid food ID");
        FoodItem memory food = availableFood[foodId - 1]; // Adjust index (1-based ID)

        require(
            balanceOf(msg.sender) >= food.foodCost,
            "Insufficient balance to redeem food"
        );

        _burn(msg.sender, food.foodCost);

        // Add the food item to the user's owned food items
        ownedFoodItems[msg.sender].push(food);

        // Emit an event for the food redemption
        emit FoodRedeemed(
            msg.sender,
            food.foodId,
            food.foodName,
            food.foodCost
        );
    }

    // Fetch all available food items
    function getAvailableFood() external view returns (FoodItem[] memory) {
        return availableFood;
    }

    // Fetch owned food items for the caller
    function getOwnedFoodItems() external view returns (FoodItem[] memory) {
        return ownedFoodItems[msg.sender];
    }

    // Event to log food redemption
    event FoodRedeemed(
        address indexed redeemer,
        uint256 foodId,
        string foodName,
        uint256 foodCost
    );
}
