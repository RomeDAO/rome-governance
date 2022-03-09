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
      "address": "contract_address",
      "decimals": 9,
      "symbol": "voteROME",
      "args": ["HOUSE_NAME or ROME", "%{address}"],
      "methodABI": {
        "inputs": [
          {
            "internalType": "string",
            "name": "_house",
            "type": "string"
          },
          {
            "internalType": "address",
            "name": "_voter",
            "type": "address"
          }
        ],
        "name": "getGovernanceWeight",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    }],
  ]
}