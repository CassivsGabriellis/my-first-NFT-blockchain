async function main() {
  // The contract factory is assigned to the 'MyFirstNFT' variable
  const MyFirstNFT = await ethers.getContractFactory('MyFirstNFT');

  // Start deployment, returning a promise that resolves to a contract object
  const myNFT = await MyFirstNFT.deploy(); // Instance of the contract
  console.log(`Contract deployed to address: ${myNFT.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
