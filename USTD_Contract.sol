/**
// SPDX-License-Identifier: MIT
// ⚠️ This contract is protected and intended for reference only.
// Unauthorized reproduction or reuse is discouraged.
// Developed by MTC GROUP - https://ustdcoin.info
 *Submitted for verification at BscScan.com on 2025-04-20
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// ------------------- INTERFACES -------------------

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

interface IERC20Metadata is IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}

interface IERC20Errors {
    error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed);
    error ERC20InvalidSender(address sender);
    error ERC20InvalidReceiver(address receiver);
    error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed);
    error ERC20InvalidApprover(address approver);
    error ERC20InvalidSpender(address spender);
}

interface IUniswapV2Router {
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}

interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address);
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IUniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
}

// ------------------- ABSTRACT -------------------

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// ------------------- CONTRACT -------------------

contract USDCOIN is Context, IERC20, IERC20Metadata, IERC20Errors {
    IUniswapV2Router public router;
    IUniswapV2Pair public pair;
    address public usdt = 0x55d398326f99059fF775485246999027B3197955;
    address factory = 0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73;
    uint256 public constant TARGET_PRICE = 10**18;
    bool public tradeStarted = false;
    string public condition;
    uint256 public tolerance = 0;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    address public owner;

    constructor() {
        _name = "USD Coin";
        _symbol = "USTD";
        owner = msg.sender;

        router = IUniswapV2Router(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        address _uniswapV2Pair = IUniswapV2Factory(factory).createPair(address(this), usdt);
        pair = IUniswapV2Pair(_uniswapV2Pair);

        _mint(msg.sender, 1_000_000_000 * (10**18));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not authorized");
        _;
    }

    function setTolerace(uint _new) public onlyOwner {
        tolerance = _new;
    }

    function startTrade() public onlyOwner {
        tradeStarted = true;
    }

    function stopTrade() public onlyOwner {
        tradeStarted = false;
    }

    function name() public view override(IERC20Metadata) returns (string memory) {
        return _name;
    }

    function symbol() public view override(IERC20Metadata) returns (string memory) {
        return _symbol;
    }

  function decimals() public pure override(IERC20Metadata) returns (uint8) {

        return 18;
    }

function totalSupply() public view override(IERC20) returns (uint256) {
    return _totalSupply;
}

   function balanceOf(address account) public view override(IERC20) returns (uint256) {
    return _balances[account];
}

    function transfer(address to, uint256 value) public override(IERC20) returns (bool) {
        address owner_ = _msgSender();
        _transfer(owner_, to, value);
        return true;
    }

    function allowance(address owner_, address spender) public view override(IERC20) returns (uint256) {
        return _allowances[owner_][spender];
    }

    function approve(address spender, uint256 value) public override(IERC20) returns (bool) {
        address owner_ = _msgSender();
        _approve(owner_, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public override(IERC20) returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, value);
        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal virtual {
        require(from != address(0), "invalid sender");
        require(to != address(0), "invalid receiver");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= value, "insufficient balance");
        unchecked {
            _balances[from] = fromBalance - value;
        }
        _balances[to] += value;

        emit Transfer(from, to, value);
    }

    function _mint(address account, uint256 value) internal virtual {
        require(account != address(0), "invalid mint");
        _totalSupply += value;
        _balances[account] += value;
        emit Transfer(address(0), account, value);
    }

    function _approve(address owner_, address spender, uint256 value) internal virtual {
        require(owner_ != address(0), "invalid approver");
        require(spender != address(0), "invalid spender");
        _allowances[owner_][spender] = value;
        emit Approval(owner_, spender, value);
    }

    function _spendAllowance(address owner_, address spender, uint256 value) internal virtual {
        uint256 currentAllowance = allowance(owner_, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= value, "insufficient allowance");
            unchecked {
                _approve(owner_, spender, currentAllowance - value);
            }
        }
    }
}
