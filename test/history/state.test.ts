import { describe, it } from "mocha";
import { deploy, EMPTY_EVENT } from "./helpers";
import { expect } from "chai";

describe("History - State Tests", () => {

    it("Should Have Blank State", async() => {
        const { history } = await deploy();

        expect(await history.events(0)).to.deep.equal(EMPTY_EVENT);
        expect(await history.events(1)).to.deep.equal(EMPTY_EVENT);
        expect(await history.events(10)).to.deep.equal(EMPTY_EVENT);
        expect(await history.events(100)).to.deep.equal(EMPTY_EVENT);
    });

    it("Should have empty latest event", async() => {
        const { history } = await deploy();
        expect(await history.getLatest()).to.deep.equal(EMPTY_EVENT);
    })

    it("Should be 0 counter", async() => {
        const { history } = await deploy();
        expect(await history.eventCounter()).to.be.equal(0n);
    })
});