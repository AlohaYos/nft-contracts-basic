// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";

contract OZOnlyOwnerMint is ERC721, Ownable {

    constructor() ERC721("OZOnlyOwnerMint", "OZOWNERMINT") {}

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがミント可能 onlyOwner
     * - ntfMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner {
        _safeMint(_msgSender(), tokenId);
    }   
}
