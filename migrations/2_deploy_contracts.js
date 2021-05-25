const Deinsta = artifacts.require("Deinsta");
// This file migrate the smart contract to the blockchain from our computer.
module.exports = function (deployer) {
  deployer.deploy(Deinsta);
};