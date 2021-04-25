import * as fs from "fs";
import * as path from "path";
import * as redis from "redis";

console.log(redis);
const redisPort = 6379;

const client = redis.createClient(redisPort);

const in_file = path.join(__dirname, "../../../../DB/retailer_api.json");
const retailers: [] = JSON.parse(fs.readFileSync(in_file).toString());

console.log(retailers);

retailers.forEach(retailer => {
  // client.setex
});