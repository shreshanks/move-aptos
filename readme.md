# Token Generator

This is a simple smart contract for generating tokens on the Aptos blockchain. This is a great way to learn about how to use Move to create and manage tokens on Aptos.

## Usage

To generate a new token, call the `generate_token()` function. This function will return a new Token struct, which contains the owner of the token and the balance of the token.

```move
public fun generate_token(): Token {
    // Check if the total supply of tokens has been reached.
    if (total_supply <= 0) {
        abort("Total supply of tokens has been reached.");
    }

    // Generate a new token ID.
    let token_id: u64 = generate_token_id();

    // Create a new token struct.
    let token: Token = Token {
        owner: sender(),
        balance: 1,
    };

    // Decrease the total supply of tokens.
    total_supply = total_supply - 1;

    // Return the newly generated token.
    return token;
}


To check the balance of a token, call the `get_balance()` function. This function will return the balance of the token for the specified owner.

move
public fun get_balance(owner: address): u64 {
    // Check if the owner exists.
    if (!exists<Token>(owner)) {
        abort("Owner does not exist.");
    }

    // Return the balance of the token for the specified owner.
    return get<Token>(owner).balance;
}


To transfer a token, call the `transfer_token()` function. This function will transfer the specified amount of tokens from the sender to the recipient.

move
public fun transfer_token(recipient: address, amount: u64) {
    // Check if the sender has enough tokens to transfer.
    let sender_balance: u64 = get_balance(sender());
    if (sender_balance < amount) {
        abort("Sender does not have enough tokens.");
    }

    // Check if the recipient exists.
    if (!exists<Token>(recipient)) {
        abort("Recipient does not exist.");
    }

    // Decrease the sender's balance.
    let new_sender_balance: u64 = sender_balance - amount;
    update<Token>(sender(), Token { owner: sender(), balance: new_sender_balance });

    // Increase the recipient's balance.
    let recipient_balance: u64 = get_balance(recipient);
    let new_recipient_balance: u64 = recipient_balance + amount;
    update<Token>(recipient, Token { owner: recipient, balance: new_recipient_balance });
}


## Deployment

To deploy the token generator smart contract to the Aptos blockchain, you can use the following steps:

1. Compile the Move code using the Move compiler.
2. Save the compiled Move bytecode to a file.
3. Connect to an Aptos node and submit the Move bytecode to the blockchain.

Once the smart contract has been deployed, you can use the functions described above to generate, check the balance, and transfer tokens.

## License

This project is licensed under the Apache 2License.

