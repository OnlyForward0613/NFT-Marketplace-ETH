// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract E1155 is ERC1155 {
    uint256 private tokenId;

    constructor() ERC1155("lfg://rumble.kongs/{id}.json") {}

    function faucet() external {
        tokenId++;
        _mint(msg.sender, tokenId, 10, "");
    }

    function totalSupply() external view returns (uint256) {
        return tokenId;
    }
}
