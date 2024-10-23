// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

//contract address = "0x390Fab8E846cB541011F81afAaC07d58f05890f6"

contract LandRegistry {
    struct Land {
        uint256 id;
        address owner;
        string location;
        uint256 area;
        uint256 price;
        bool isForSale;
    }

    mapping(uint256 => Land) public lands;
    uint256 public landCount;

    event LandRegistered(uint256 id, address owner, string location, uint256 area, uint256 price);
    event LandForSale(uint256 id, uint256 price);
    event LandSold(uint256 id, address newOwner, uint256 price);

    function registerLand(string memory _location, uint256 _area, uint256 _price) public {
        landCount++;
        lands[landCount] = Land(landCount, msg.sender, _location, _area, _price, false);
        emit LandRegistered(landCount, msg.sender, _location, _area, _price);
    }

    function putLandForSale(uint256 _id, uint256 _price) public {
        require(lands[_id].owner == msg.sender, "Only the owner can put the land for sale");
        lands[_id].isForSale = true;
        lands[_id].price = _price;
        emit LandForSale(_id, _price);
    }

    function buyLand(uint256 _id) public payable {
        require(lands[_id].isForSale, "Land is not for sale");
        require(msg.value >= lands[_id].price, "Insufficient funds");

        address payable previousOwner = payable(lands[_id].owner);
        previousOwner.transfer(msg.value);

        lands[_id].owner = msg.sender;
        lands[_id].isForSale = false;
        emit LandSold(_id, msg.sender, msg.value);
    }

    function getLand(uint256 _id) public view returns (Land memory) {
        return lands[_id];
    }
}
