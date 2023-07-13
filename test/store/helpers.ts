import { ethers } from "hardhat";

export const deploy = async() => {
    const store = await ethers.deployContract("Store");
    const addressStoreAddress = await store.addressStore();
    const integerStoreAddress = await store.addressStore();
    const stringStoreAddress = await store.addressStore();

    const addressStore = await ethers.getContractAt("AddressKV", addressStoreAddress);
    const integerStore = await ethers.getContractAt("IntegerKV", integerStoreAddress);
    const stringStore = await ethers.getContractAt("StringKV", stringStoreAddress);

    return { addressStore, integerStore, store, stringStore };
}
