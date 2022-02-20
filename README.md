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