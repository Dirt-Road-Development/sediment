import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-deploy";
import "hardhat-deploy-ethers";
import "solidity-coverage";

const config: HardhatUserConfig = {
  solidity: "0.8.25",
};

export default config;
