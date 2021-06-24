const Tx = require('ethereumjs-tx').Transaction;
const Web3 = require('web3')
const web3 = new Web3('https://ropsten.infura.io/v3/d92fd0d900fc4b85bf4090eb5478ba41')
 
web3.eth.defaultChain = 'ropsten'

const account1 = '0x4cce6A0F50Fb0593CCb3F21ebF441e6D5CF980B5'
const account2 = '0xD2545bD1321Af87C29EBaDaaDfC4aAc8Bec3B92F'
 
const privateKey1 = Buffer.from('7f45901ef073face71ceb65c81e86ae1776a84213d8ade3c1e654a5409ad2287', 'hex')
const privateKey2 = Buffer.from('d6bc928c6a7c409f85e0d2d7c08c8d67e09bec17824a4febef2d2b78f28de5bb', 'hex')
 
const getDataAddress = '0xB2338A7f20eA096247222a30052CdC8CCE39ADFc'
const getDataAbi = [
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "_data",
                "type": "string"
            }
        ],
        "name": "set",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "data",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "get",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    }
]
const getDataContract = new web3.eth.Contract(getDataAbi, getDataAddress);
 
// getDataContract.methods.get().call((err, result) => {
//     console.log(result);
// })

//  web3.eth.getTransactionCount(account1, function(error, txCount) {
    
//     const data = getDataContract.methods.set("iii").encodeABI()
 
//     const txObject ={
//         nonce: web3.utils.toHex(txCount),
//         gasLimit: web3.utils.toHex(2100000),
//         gasPrice: web3.utils.toHex(web3.utils.toWei('100', 'gwei')),
//         to: getDataAddress,
//         data: data,
//     }
//     const tx = new Tx(txObject, {chain: 'ropsten', hardfork: 'petersburg'});
//     tx.sign(privateKey1)
 
//     const serializedTransaction = tx.serialize()
//     const raw = '0x' + serializedTransaction.toString('hex')
 
//     web3.eth.sendSignedTransaction(raw, (error, txHash) => {
//         console.log(txHash)
//       })
//     }) 

web3.eth.getTransactionCount(account1, function(error, txCount) {
  //build transaction
  const txObject = {
        nonce: txCount,
        gasLimit: web3.utils.toHex(2100000),
        gasPrice: web3.utils.toHex(web3.utils.toWei('100', 'gwei')),
        to: account2,
        value: web3.utils.toHex(web3.utils.toWei('1', 'ether'))
    }
  // sign the transaction
    const tx = new Tx(txObject, {chain: 'ropsten'});
    console.log(tx)
    tx.sign(privateKey1)
  // broadcast 
    const serializedTransaction = tx.serialize()
    
    const raw = '0x' + serializedTransaction.toString('hex')
    console.log(tx)
    console.log(serializedTransaction)
    console.log(raw)
    
    web3.eth.sendSignedTransaction(raw, (error, txHash) => {
        console.log(txHash)
    })
}) 



