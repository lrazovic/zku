# A. Conceptual Knowledge

1. In "[Smart Contracts][1]" Nick Szabo defines a smart contract as a computerized transaction protocol that executes the terms of a contract. Contract Accounts (CAs) can be triggered by humans sending a transaction or by other contracts sending a message. When executed, can perform arbitrarily complex operations, allowing it to read and write to internal storage and send other messages, or create contracts. In the Ethereum environment contracts run (in a logical sense) on the *Ethereum Virtual Machine (EVM)*. We can think of the EVM as an emulation of a single, global “computer” in which all transactions are local on each node of the network are executed in relative synchrony. Smart contracts run *EVM bytecode* when receiving a transaction, allowing them to perform calculations and further transactions. Smart Contracts can be written in the high-level language like Solidity or Vyper, they will be *compiled* in EVM bytecode. Deploying the smart contract on the blockchain is actually just sending a transaction containing the code of the compiled smart contract without specifying any recipients. In principle to deploy a smart contract you need:
	1. The contract's bytecode.
	2. ETH for paying gas.
	3. A deployment script or plugin
	4. An Ethereum node.
We can use tools like [Hardhat](https://hardhat.org) or [Truffle](https://trufflesuite.com) to automatize all the steps described before. 


2. All programmable computation in Ethereum is subject to fees. Any fragment of programmable computation has a cost in terms of **gas**. Gas does not exist outside of the execution of a transaction and very important, the gas is not ether. Transactors will necessarily have a trade-off between lowering gas price and maximizing chances that their transaction will be mined relatively soon. Gas also circumvents the halting problem in fact if the contract does not stop, after a while it might eventually run out of gas.

[1]: https://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart.contracts.html "Smart Contracts"