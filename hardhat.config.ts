// https://github.com/wighawag/hardhat-deploy#2-extra-hardhatconfig-networks-options
import 'dotenv/config'
import { HardhatUserConfig } from 'hardhat/types'
import { task } from "hardhat/config"
import { Signer } from "@ethersproject/abstract-signer"
import 'hardhat-deploy'
import '@nomiclabs/hardhat-ethers'
import '@typechain/hardhat'
import 'solidity-coverage'
import '@nomiclabs/hardhat-etherscan'
import 'hardhat-interface-generator'
import {nodeUrl, accounts, getChainId, apiKey} from './utils/network'

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts: Signer[] = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(await account.getAddress());
  }
});

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: '0.8.9',
        settings: {
          optimizer: {
            enabled: true,
            runs: 9999,
          },
        },
      },
    ],
  },
  namedAccounts: {
    deployer: 0,
    dev: 1,
    DAO: {
      default: 2,
      // Moonriver
      1285: '0xD4a7FEbD52efda82d6f8acE24908aE0aa5b4f956',
    },
  },
  networks: {
    localhost: {
      url: nodeUrl('localhost'),
      accounts: accounts(),
    },
    staging: {
      url: nodeUrl('rinkeby'),
      accounts: accounts('rinkeby'),
    },
    production: {
      url: nodeUrl('mainnet'),
      accounts: accounts('mainnet'),
    },
    mainnet: {
      url: nodeUrl('mainnet'),
      accounts: accounts('mainnet'),
    },
    rinkeby: {
      url: nodeUrl('rinkeby'),
      accounts: accounts('rinkeby'),
    },
    kovan: {
      url: nodeUrl('kovan'),
      accounts: accounts('kovan'),
    },
    goerli: {
      url: nodeUrl('goerli'),
      accounts: accounts('goerli'),
    },
    moonriver: {
      url: nodeUrl('moonriver'),
      chainId: getChainId('moonriver'),
      accounts: accounts('moonriver'),
      live: true, //Whether a network is local or on-chain. False by default on localhost & hardhat
      saveDeployments: true, //Whether to save deployments to disk
      tags: ['moonriver'], //Tags to represent a network. Useful to conditionally operate on network
      gasPrice: 2000000000, //Gas price used for deploys (18 decimals)
      gas: 10000000, //Gas limit for deploys (18 decimals)
    },
    moonbase: {
      url: nodeUrl('moonbase'),
      chainId: getChainId('moonbase'),
      accounts: accounts('moonbase'),
      live: true,
      saveDeployments: true,
      tags: ['moonbase'],
      gasPrice: 2000000000,
      gas: 10000000,
    }
  },
  paths: {
    sources: "./src/contracts",
    artifacts: "./build/artifacts",
    cache: "./build/cache",
  },
  mocha: {
    timeout: 0,
  },
};

export default config;
