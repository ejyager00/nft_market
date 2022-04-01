contract Auction {

    uint256 public endTime; // Timestamp of the end of the auction (in seconds)
    uint256 public startTime; // The block timestamp which marks the start of the auction
    uint maxBid; // The maximum bid
    address maxBidder; // The address of the maximum bidder
    address creator; // The address of the auction creator
    Bid[] public bids; // The bids made by the bidders
    uint tokenId; // The id of the token
    bool isCancelled; // If the the auction is cancelled
    bool isDirectBuy; // True if the auction ended due to direct buy
    uint minIncrement; // The minimum increment for the bid
    uint directBuyPrice; // The price for a direct buy
    uint startPrice; // The starting price for the auction
    IERC721 _nft; // The NFT token

    constructor(address _creator,uint _endTime,uint _minIncrement,uint _directBuyPrice, uint _startPrice,address _nftAddress,uint _tokenId){
        creator = _creator; // The address of the auction creator
        endTime = block.timestamp +  _endTime; // The timestamp which marks the end of the auction (now + 30 days = 30 days from now)
        startBlock = block.timestamp; // The timestamp which marks the start of the auction
        minIncrement = _minIncrement; // The minimum increment for the bid
        directBuyPrice = _directBuyPrice; // The price for a direct buy
        startPrice = _startPrice; // The starting price for the auction
        _nft = IERC721(_nftAddress); // The address of the nft token
        nftAddress = _nftAddress;
        tokenId = _tokenId; // The id of the token
        maxBidder = _creator; // Setting the maxBidder to auction creator.
    }

    enum AuctionState {
        OPEN,
        CANCELLED,
        ENDED,
        DIRECT_BUY
    }

    struct Bid { // A bid on an auction
        address sender;
        uint256 bid;
    }

    function placeBid() payable external returns(bool){} // Place a bid on the auction
    function withdrawToken() external returns(bool){} // Withdraw the token after the auction is over
    function withdrawFunds() external returns(bool){} // Withdraw the funds after the auction is over
    function cancelAuction() external returns(bool){} // Cancel the auction
    function getAuctionState() public view returns(uint) {} // Get the auction state
    function allBids() external view returns (address[] memory, uint256[] memory) {} // Returns a list of all bids and addresses

    event NewBid(address bidder, uint bid); // A new bid was placed
    event WithdrawToken(address withdrawer); // The auction winner withdrawed the token
    event WithdrawFunds(address withdrawer, uint256 amount); // The auction owner withdrawed the funds
    event AuctionCancelled(); // The auction was cancelled
}