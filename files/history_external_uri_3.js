async function main() {
    console.log("I am a JavaScript file");
}

main()
    .catch((err) => {
        console.error(err);
        process.exitCode = 1;
    })