//  Truffle lets us load a contract requiring it with the artifacts.require function
const GreeterContract = artifacts.require("Greeter");

//  Deploy the contract
contract("Greeter", () => {
    it("has been deployed successfully", async () => {
        const greeter = await GreeterContract.deployed();   // Async operation

        //  If greeter exist the test pass
        assert(greeter, "contract was not deployed");
    });
});


describe("greet()", () => {
    it("returns 'Hello, World!'", async () => {
    const greeter = await GreeterContract.deployed();   // Async operation
    const expected = "Hello, World!";
    const actual = await greeter.greet();               // Async operation

    assert.equal(actual, expected, "greeted with 'Hello, World!'");
    });
});


//  Deploy a new contract
contract("Greeter: update greeting", () => {
    describe("setGreeting(string)", () => {
        it("sets greeting to the passed string", async () => {
            const greeter = await GreeterContract.deployed();   // Async operation
            const expected = "Hi there";

            await greeter.setGreeting(expected);                // Async operation
            const actual = await greeter.greet();

            assert.equal(actual, expected, "greeting was not updated");
        })
    })
})

