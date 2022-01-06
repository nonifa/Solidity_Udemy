//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Deposit{

    address immutable admin;

    constructor() {
        admin = msg.sender;
    }

    receive() external payable {}
    fallback() external payable {}


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendWholeBalance(address payable recipient) public {
        require(admin == msg.sender, "Transfer failed, you are not the owner!");

        recipient.transfer(getBalance());
    }
}