require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
// require("@nomiclabs/hardhat-ethers");
// require("@nomiclabs/hardhat-etherscan");

module.exports = {
  defaultNetwork: "polygon_mumbai",
  networks: {
    hardhat: {},
    polygon_mumbai: {
      url: process.env.INFURA_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
    scroll: {
      url: "https://sepolia-rpc.scroll.io",
      chainId: 534351,

      accounts: [process.env.PRIVATE_KEY],
    },
    arbitrum: {
      url: process.env.ARBITRUM_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      polygonMumbai: process.env.POLYGONSCAN_API_KEY,
      scroll: process.env.SCROLL_API_KEY,
      arbitrumGoerli: process.env.ARBITRUM_API_KEY,
    },
    customChains: [
      {
        network: "scroll",
        chainId: 534351,
        urls: {
          apiURL: "https://api-sepolia.scrollscan.com/api",
          browserURL: "https://sepolia.scrollscan.com/",
        },
      },
      {
        network: "arbitrum",
        chainId: 42161,
        urls: {
          apiURL: "https://api-goerli.arbiscan.io/api",
          browserURL: "https://goerli.arbiscan.io/",
        },
      },
    ],
  },

  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
