## install
`yarn install`

## compile
`yarn compile`

## deploy local
`hardhat --network localhost deploy --watch`

## deploy chain
`hardhat --network <network> deploy --watch`

## setup forge test
install submodules
`git submodule update --init`
install cargo
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh`

## run test
`forge test -f <rpc> -vvv --force`
ex `forge test -f https://rpc.api.moonriver.moonbeam.network -vvv --force`

## to print for debugging
import "../test/utils/console.sol";
console.log();

## Setting up Snapshot call-contract strategy
{
  "strategies": [
    ["contract-call", {
      // contract address
      "address": "0x6887DF2f4296e8B772cb19479472A16E836dB9e0",
      // output decimals
      "decimals": 18,
      // strategy symbol
      "symbol": "mySCORE",
      // arguments are passed to the method; "%{address}" is replaced with the voter's address; default value ["%{address}"]
      "args": ["0x6887DF2f4296e8B772cb19479472A16E836dB9e0", "%{address}"], 
      // method ABI, output type should be uint256
      "methodABI": {
        "constant": true,
        "inputs": [{
          "internalType": "address",
          "name": "_someAddress",
          "type": "address"
        }, {
          "internalType": "address",
          "name": "_voterAddress",
          "type": "address"
        }],
        "name": "totalScoresFor",
        "outputs": [{
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      }
    }],
  ]
}