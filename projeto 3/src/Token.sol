// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Token {
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public totalSupply;

    event Transfer(address from, address to, uint256 value);
    event Approval(address owner, address spender, uint256 value);

    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint256)) allowance;

    function balanceOf(address _owner) public view returns (uint256) {
        uint256 userBalance = balance[_owner];
        return userBalance;
    }

    function transfer(address _to, uint256 _value) public {
        require(balance[msg.sender] >= _value, "INSUFICIENT_FUNDS");

        balance[_to] += _value;
        balance[msg.sender] -= _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function approve(address _spender, uint256 _value) public {
        require(balance[msg.sender] >= _value, "INSUFICIENT_FUNDS");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(
            allowance[_from][msg.sender] >= _value,
            "INSUFICIENT_ALLOWANCE"
        );

        balance[_to] += _value;
        balance[msg.sender] -= _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function getAllowanceValue(
        address _owner,
        address _spender
    ) public view returns (uint256) {
        return allowance[_owner][_spender];
    }

    constructor() {
        name = "NearX Bootcamp Test Coin";
        symbol = "NBTC";
        decimal = 18;

        balance[msg.sender] = 10000 * 10e18;
    }
}
