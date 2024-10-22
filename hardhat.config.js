require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.27",
  networks: {
    zkEVMCardona: {
      url: "https://rpc.cardona.zkevm-rpc.com",
      accounts: ["0ad4425dfeb9ea18f63f34b2da9fc3226d40834d8dc9f44a4a6ced212957a64e"], // Replace with your wallet's private key
      chainId: 2442,
    },
  },
};














