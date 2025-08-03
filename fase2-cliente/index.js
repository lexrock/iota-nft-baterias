import { Client } from '@iota/sdk';

async function main() {
  console.log("IOTA dev environment running");

  // Dirección del nodo Hornet
  const NODE_URL = "http://100.94.154.44:14265";
  // Nodo público de Shimmer testnet
  //const NODE_URL = "https://api.testnet.shimmer.network";


  // Crear cliente IOTA
  const client = new Client({
    nodes: [NODE_URL],
    ignoreNodeHealth: true
  });

  try {
    const info = await client.getInfo();
    console.log("Conectado al nodo Hornet!");
    console.log(info);
  } catch (err) {
    console.error("Error conectando al nodo:", err);
  }
}

main();
