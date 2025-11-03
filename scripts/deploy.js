async function main() {
  const Voting = await ethers.getContractFactory("Voting");
  const voting = await Voting.deploy(["Prabowo Subianto", "Anies Baswedan", "Ganjar Pranowo"]);
  await voting.waitForDeployment();
  console.log("Voting contract deployed at:", await voting.getAddress());
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
