import { HardhatUserConfig } from "hardhat/config";
import compilers from "./compilers.json";
import "@nomicfoundation/hardhat-toolbox";
import "solidity-coverage";
import "solidity-docgen";

const config: HardhatUserConfig = {
  solidity: {
    compilers
  },
  docgen: {
    pages: "files",
    output: 'docs',
  }
};

export default config;
