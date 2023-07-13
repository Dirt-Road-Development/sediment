import { ethers } from "hardhat";

export const deploy = async() => {
    const history = await ethers.deployContract("History");
    return { history }
}

export const EMPTY_EVENT = [0n,'','',''];

export const dataEvents = [
    {
        name: "Complete Level",
        data: "Level #1",
        externalURI: "null"
    },
    {
        name: "Lose Level",
        data: JSON.stringify({
            level: 1,
            score: 17
        }),
        externalURI: "null"
    },
    {
        name: "Tie",
        data: JSON.stringify({
            scores: [5,5],
            game: "football",
            gameId: "00002",
            timestamp: new Date().getTime()
        }),
        externalURI: "null"
    }
]

export const externalEvents = [
    {
        name: "Game Results",
        data: "null",
        externalURI: "ipfs://bafkreiffr2an7oey2ynhb36mzse3bl3qhrclyxikkjj6xxxu6md7a5qjfm"
    },
    {
        name: "Txt File",
        data: "null",
        externalURI: "ipfs://bafkreifsoarugqkfony7ora6mrfdydhmsmwrrtpbykjnplm7gst6guh7sy"
    }, 
    {
        name: "JS File",
        data: "null",
        externalURI: "ipfs://bafkreif7kllfpksrgwihjz7pf7t772e7aiyotiabrsadcbnnqjshokiqsq"
}
]

export const getEvent = (type: "data" | "external", index: 0 | 1 | 2) => {
    let event = type === "data" ? dataEvents[index] : externalEvents[index];
    return Object.values(event) as [string, string, string];

}