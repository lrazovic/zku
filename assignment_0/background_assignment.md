## A. Conceptual Knowledge

### What is a smart contract? How are they deployed? You should be able to describe how a smart contract is deployed and the necessary steps.

In "[Smart Contracts][1]" Nick Szabo defines a smart contract as a computerized transaction protocol that executes the terms of a contract. Contract Accounts (CAs) can be triggered by humans sending a transaction or by other contracts sending a message. When executed, can perform arbitrarily complex operations, allowing it to read and write to internal storage and send other messages, or create contracts. In the Ethereum environment contracts run (in a logical sense) on the *Ethereum Virtual Machine (EVM)*. We can think of the EVM as an emulation of a single, global “computer” in which all transactions are local on each node of the network and are executed in relative synchrony. Smart contracts run *EVM bytecode* when receiving a transaction, allowing them to perform calculations and further transactions. Smart Contracts can be written in a high-level language like Solidity or Vyper, they will be *compiled* in EVM bytecode. Deploying the smart contract on the blockchain is just sending a transaction containing the code of the compiled smart contract without specifying any recipients. In principle to deploy a smart contract you need:
1. The contract's bytecode.
2. An Ethereum node.
3. ETH for paying gas.
4. A deployment script or plugin.\

We can use tools like [Hardhat](https://hardhat.org) or [Truffle](https://trufflesuite.com) to automatize all the steps described before. For example using Hardhat, once correctly installed by following the documentation on the site, we can launch a local node using `npx hardhat node`. This will generates also 20 accounts with 1000 ETH, which should be sufficient for a lot of local deployments/testing. We can write a script in JavaScript that deploy the contract on the specified chain (the local one by default, but we can also deploy it on Testnets/Mainnet leveraging services like Infura/Alchemy) and execute the script using `npx hardhat run path/to/script.js`

```javascript
async function main () {
    // We get the contract to deploy
    const Greeter = await ethers.getContractFactory('Greeter');
    console.log('Deploying Greeter...');
    const smart_contract = await Greeter.deploy();
    await smart_contract.deployed();
    console.log('Greeter deployed to:', smart_contract.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
    console.error(error);
    process.exit(1);
});
```

In this case, the address of the deployed contract will be printed on the terminal and we can interact with it using Remix, the Hardhat console, or using a frontend.

### What is gas? Why is gas optimization such a big focus when building smart contracts?

All programmable computation in Ethereum is subject to fees. Any fragment of programmable computation has a cost in terms of **gas**. Gas does not exist outside of the execution of a transaction and very important, the gas is not ether. Transactors will necessarily have a trade-off between lowering gas price and maximizing the chances that their transaction will be mined relatively soon. Gas also circumvents the halting problem in fact if the contract does not stop, after a while, it might eventually run out of gas. When we build smart contracts we have to be very careful about the cost in gas of the single operations, this is because each operation has a fixed cost as described in the [yellow paper][2]. Since the cost in gas is paid by those who invoke a contract then we must optimize as much as possible the cost of operations, to minimize the expense of the end-user. 

### What is a hash? Why do people use hashing to hide information?
A hash function is a deterministic mathematical function that maps a set of inputs of arbitrary size to a fixed-length output.
In cryptographic applications the hash function is required to have the following properties:
1. preimage resistance: it must be computationally intractable to search for an input string that gives a hash equal to a given hash;
2. resistance to second pre-image: it is computationally intractable to search for an input string that gives a hash equal to a given string;
3. collision resistance: it is computationally intractable to search for a pair of input strings that give the same hash.

### How would you prove to a colorblind person that two different colored objects are actually of different colors?

## B. You sure you’re solid with Solidity?



[1]: https://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart.contracts.html "Smart Contracts"
[2]: https://ethereum.github.io/yellowpaper/paper.pdf "Yellow Paper"