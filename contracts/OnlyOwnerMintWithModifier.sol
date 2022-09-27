// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMintWithModifier is ERC721 {

    /**
     * @dev 
     * - このコントラクトをデプロイしたアドレス用変数 owner
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMintWithModifier", "OWNERMINTMOD") {
        owner = _msgSender();   /// コンストラクトをデプロイしたアドレス
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけに制御するmodifier
     */
    modifier onlyOwner {
        require(owner == _msgSender(), "Caller is not the owner.");
        _;  /// returnする意味
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがミント可能 onlyOwner
     * - ntfMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner {
        _safeMint(_msgSender(), tokenId);
    }   
}
