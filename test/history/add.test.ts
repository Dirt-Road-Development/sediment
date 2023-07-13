import { describe, it } from "mocha";
import { deploy, getEvent } from "./helpers";
import { expect } from "chai";

describe("History - Add Function", () => {

    it("Add 3 data events", async() => {
        const { history } = await deploy();
        await expect(history.add(...getEvent("data", 0))).to.emit(history, "Add").withArgs(0n);
        await expect(history.add(...getEvent("data", 1))).to.emit(history, "Add").withArgs(1n);
        await expect(history.add(...getEvent("data", 2))).to.emit(history, "Add").withArgs(2n);
        expect(await history.eventCounter()).to.be.equal(3n);
    });

    it("Add 3 external uri events", async() => {
        const { history } = await deploy();
        await expect(history.add(...getEvent("external", 0))).to.emit(history, "Add").withArgs(0n);
        await expect(history.add(...getEvent("external", 1))).to.emit(history, "Add").withArgs(1n);
        await expect(history.add(...getEvent("external", 2))).to.emit(history, "Add").withArgs(2n);
        expect(await history.eventCounter()).to.be.equal(3n);
    });
});