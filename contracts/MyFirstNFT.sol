//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

// Importing the OpenZepellin library models

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyFirstNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyFirstNFT", "MFNFT") {}

    function mintToken(
        address to,
        string memory uri
    ) public payable virtual returns (uint256) {
        require(msg.value >= 10, "Not enough ETH sent; check price!");

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(to, newItemId);
        _setTokenURI(newItemId, uri);

        return newItemId;
    }
}
