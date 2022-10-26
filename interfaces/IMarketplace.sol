//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./INFTContract.sol";

interface IMarketplace {

    event CreateAsk(
        address indexed nft,
        uint256 indexed tokenID,
        uint256 price,
        address indexed to
    );
    event CancelAsk(address indexed nft, uint256 indexed tokenID);
    event AcceptAsk(
        address indexed nft,
        uint256 indexed tokenID,
        uint256 price,
        address indexed to
    );

    event CreateBid(
        address indexed nft,
        uint256 indexed tokenID,
        uint256 price
    );
    event CancelBid(address indexed nft, uint256 indexed tokenID);
    event AcceptBid(
        address indexed nft,
        uint256 indexed tokenID,
        uint256 price
    );

    struct Ask {
        bool exists;
        address seller;
        uint256 price;
        address to;
    }

    struct Bid {
        bool exists;
        address buyer;
        uint256 price;
    }

    function createAsk(
        INFTContract[] calldata nft,
        uint256[] calldata tokenID,
        uint256[] calldata price,
        address[] calldata to
    ) external;

    function createBid(
        INFTContract[] calldata nft,
        uint256[] calldata tokenID,
        uint256[] calldata price
    ) external payable;

    function cancelAsk(INFTContract[] calldata nft, uint256[] calldata tokenID)
        external;

    function cancelBid(INFTContract[] calldata nft, uint256[] calldata tokenID)
        external;

    function acceptAsk(INFTContract[] calldata nft, uint256[] calldata tokenID)
        external
        payable;

    function acceptBid(INFTContract[] calldata nft, uint256[] calldata tokenID)
        external;

    function withdraw() external;
}
