import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Paylancer {
    struct PaymentRequest {
        address requester;
        address recipient;
        uint256 amount;
        address token;
        bool fulfilled;
    }

    uint256 public requestCount;
    mapping(uint256 => PaymentRequest) public paymentRequests;

    event PaymentSent(address indexed from, address indexed to, uint256 amount, address token);
    event PaymentRequested(uint256 indexed requestId, address indexed requester, address indexed recipient, uint256 amount, address token);
    event PaymentFulfilled(uint256 indexed requestId, address indexed fulfiller);

    // Send ETH payment
    function sendPayment(address payable recipient) external payable {
        require(msg.value > 0, "Amount must be > 0");
        recipient.transfer(msg.value);
        emit PaymentSent(msg.sender, recipient, msg.value, address(0));
    }

    // Send ERC20 payment
    function sendTokenPayment(address recipient, uint256 amount, address token) external {
        require(amount > 0, "Amount must be > 0");
        IERC20(token).transferFrom(msg.sender, recipient, amount);
        emit PaymentSent(msg.sender, recipient, amount, token);
    }

    // Create a payment request
    function createPaymentRequest(address recipient, uint256 amount, address token) external returns (uint256) {
        require(amount > 0, "Amount must be > 0");
        paymentRequests[requestCount] = PaymentRequest({
            requester: msg.sender,
            recipient: recipient,
            amount: amount,
            token: token,
            fulfilled: false
        });
        emit PaymentRequested(requestCount, msg.sender, recipient, amount, token);
        requestCount++;
        return requestCount - 1;
    }

    // Fulfill a payment request (ETH)
    function fulfillPaymentRequestETH(uint256 requestId) external payable {
        PaymentRequest storage req = paymentRequests[requestId];
        require(!req.fulfilled, "Already fulfilled");
        require(req.token == address(0), "Not an ETH request");
        require(msg.value == req.amount, "Incorrect amount");
        payable(req.recipient).transfer(msg.value);
        req.fulfilled = true;
        emit PaymentFulfilled(requestId, msg.sender);
    }

    // Fulfill a payment request (ERC20)
    function fulfillPaymentRequestToken(uint256 requestId) external {
        PaymentRequest storage req = paymentRequests[requestId];
        require(!req.fulfilled, "Already fulfilled");
        require(req.token != address(0), "Not a token request");
        IERC20(req.token).transferFrom(msg.sender, req.recipient, req.amount);
        req.fulfilled = true;
        emit PaymentFulfilled(requestId, msg.sender);
    }
}
contract Paylancer {
    // Add your contract logic here
    // Example: escrow, payments, etc.
}
