const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const LandRegistryModule = buildModule("LandRegistryModule", (m) => {
  const landRegistry = m.contract("LandRegistry");

  return { landRegistry };
});

module.exports = LandRegistryModule;