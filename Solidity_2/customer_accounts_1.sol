/*
Instructions
------------
1. Open the Remix IDE. Either paste the code from the starter file into a new Solidity file or open the `customer_account.sol` file that you created earlier.

2. Define an `address payable` variable named `authorizedRecipient`. This Ethereum address will represent a third-party account that’s authorized to receive withdrawal payments.

3. To allow the account owner to receive withdrawal payments at their Ethereum address, change the `owner` variable to become `payable`.

4. Modify the type of the `newOwner` variable in the `setInfo` function to `address payable`. This will avoid compilation errors from the change that you made to the `owner` variable.

5. Change the `sendRemmitance` function by adding a `require` function. This `require` function will enforce the rule that only the account owner or the authorized recipient can receive ether from the contract balance.

6. Compile your smart contract. If an error occurs, review your code, and make the necessary changes for a successful compilation.

*/


pragma solidity ^0.5.0;

contract CustomerAccount {
    address payable owner;
    bool isNewAccount;
    uint public accountBalance;
    string customerName;
    string customerLastName;
    address payable authorizedRecipient;

    function getInfo() view public returns(address, address payable, bool, uint, string memory, string memory) {
        return (owner, authorizedRecipient, isNewAccount, accountBalance, customerName, customerLastName);
    }

    function setInfo(address payable newOwner, address payable newAuthorizedRecipient, bool newAccountStatus, uint newAccountBalance, string memory newCustomerName, string memory newCustomerLastName) public {
        owner = newOwner;
        authorizedRecipient = newAuthorizedRecipient;
        isNewAccount = newAccountStatus;
        accountBalance = newAccountBalance;
        customerName = newCustomerName;
        customerLastName = newCustomerLastName;
    }

    function sendRemittance(uint amount, address payable recipient) public {
        require(recipient == owner || recipient == authorizedRecipient, "The recipient address is not authorized!");
        recipient.transfer(amount);
        accountBalance = address(this).balance;
    }

    function deposit() public payable {
        accountBalance = address(this).balance;
    }

    function() external payable {}
}