import { describe, it } from "mocha";
import { deploy } from "./helpers";
import { expect } from "chai";
import { zeroAddress } from "@nomicfoundation/ethereumjs-util";

describe("Store - State Tests", () => {

    describe("Deployment", () => {
        it("Should emit StoreCreated", async() => {
            const { store } = await deploy();
            await expect(store.deploymentTransaction()).to.emit(store, "StoreCreated");
        })
    })

    describe("Address Store", () => {
        it("Should have 0 counter", async() => {
            const { addressStore } = await deploy();
            expect(
                await addressStore.counter()
            ).to.be.equal(0n);
        });

        it("Should have no state", async() => {
            const { addressStore } = await deploy();
            expect(
                await addressStore.get(zeroAddress())
            ).to.be.equal("0x");
        });
    });

    describe("Integer Store", () => {
        it("Should have 0 counter", async() => {
            const { integerStore } = await deploy();
            expect(
                await integerStore.counter()
            ).to.be.equal(0n);
        });

        it("Should have no state", async() => {
            const { integerStore } = await deploy();
            expect(
                await integerStore.get(0n)
            ).to.be.equal("0x");
        });
    });

    describe("String Store", () => {
        it("Should have 0 counter", async() => {
            const { stringStore } = await deploy();
            expect(
                await stringStore.counter()
            ).to.be.equal(0n);
        });

        it("Should have no state", async() => {
            const { stringStore } = await deploy();
            expect(
                await stringStore.get("")
            ).to.be.equal("0x");
        });
    });
});