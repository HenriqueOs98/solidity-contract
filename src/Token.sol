// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;


contract Token {
    string private _name = "Bootcamp";
    string private _symbol = "OCG";
    uint8 private _decimals = 18;

    mapping (address => uint256) balance;

    mapping (address => mapping (address => uint256) ) _allowance;

    function name() view public returns(string memory) {
        return _name;
    }

    function symbol() view public returns(string memory) {
        return _symbol;
    }

    function decimals() view public returns(uint8) {
        return _decimals;
    }

    function balanceOf(address _user) view public returns(uint256) {
        return balance[_user];
    }

     function transfer(address to, uint256 amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
     }


    function approve(address spender, uint256 amount) public {
        _allowance[msg.sender][spender] = amount;

    }

    function transferFrom(address from, address to, uint256 amount) public {
        
        if (_allowance[from][msg.sender] < amount) {
            revert("vc nao tem allowance suficiente");
        }
        balance[from] -= amount;
        balance[to] += amount;
    }

    function allowance(address owner, address spender) view public returns(uint256) {
        return _allowance[owner][spender];
    }

}
