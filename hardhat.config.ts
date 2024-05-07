import { HardhatUserConfig } from "hardhat/config";
import compilers from "./compilers.json";
import "@nomicfoundation/hardhat-toolbox";
import "solidity-coverage";

const config: HardhatUserConfig = {
  solidity: {
    compilers
  }
};

export default config;
