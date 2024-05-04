import { ethers } from "hardhat";

export default async function deploy(contractName: string, args: any[] = []) {
    return await
        (args.length > 0
            ? ethers.deployContract(contractName, args)
            : ethers.deployContract(contractName));
}