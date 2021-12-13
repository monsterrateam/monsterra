const MSTRToken = artifacts.require("MSTRToken");

module.exports = async function(deployer) {
  await deployer.deploy(MSTRToken);
  let mstrToken = await MSTRToken.deployed();
  console.log("mstrToken.address:", mstrToken.address);

};
