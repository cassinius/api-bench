module.exports = {
  name: "Elysia Retailer API", // Name of your application
  script: "src/index.ts", // Entry point of your application
  interpreter: "bun", // Path to the Bun interpreter
  mode: "cluster", // Cluster or fork
  instances: 'max', // Number of instances to be started in cluster mode
};