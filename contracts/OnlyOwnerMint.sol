// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMint is ERC721 {

    /**
     * @dev 
     * - このコントラクトをデプロイしたアドレス用変数 owner
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMint", "OWNERMINT") {
        owner = _msgSender();   /// コンストラクトをデプロイしたアドレス
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがミント可能
     * - ntfMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public {
        require(owner == _msgSender(), "Caller is not the owner.");
        _safeMint(_msgSender(), tokenId);
    }   
}