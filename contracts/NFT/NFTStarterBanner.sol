// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../SpacePiratesTokens.sol";
import "./SpacePiratesNFT.sol";

/**
 * @title Space Pirates NFT Collection Factory
 * @author @Gr3it, @yuripaoloni (reviewer)
 * @notice Create collection settig parameters like start, end, supply
 */

contract NFTStarterBanner is Ownable {
    SpacePiratesNFT public immutable nftContract;
    SpacePiratesTokens public immutable tokenContract;

    uint256 public constant starterGemId = 1000;

    constructor(SpacePiratesTokens _tokenContract, SpacePiratesNFT _nftContract)
    {
        tokenContract = _tokenContract;
        nftContract = _nftContract;
    }

    function mintCollectionItem(uint256 quantity) external {
        require(quantity > 0, "NFTCollectionFactory: can't mint 0 NFT");
        tokenContract.burn(msg.sender, starterGemId, 1);
        nftContract.mint("Starter collection", quantity, false);
    }
}
