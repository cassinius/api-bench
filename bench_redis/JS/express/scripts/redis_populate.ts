import * as fs from "fs";
import * as path from "path";
// import * as util from "util";
import * as redis from "redis";

import { Retailer } from "../types/retailer";

// console.log(redis);
const redisUrl = "redis://localhost:6379/7";

const client = redis.createClient(redisUrl);
// console.log('Redis client:', client);

const in_file = path.join(__dirname, "../../../../DB/retailer_api.json");
const retailers: Retailer[] = JSON.parse(fs.readFileSync(in_file).toString());
// console.log(retailers);


for ( let i = 0; i < retailers.length; i++ ) {
  client.set(String(i), JSON.stringify(retailers[i]));
}

let keys: string[];
client.KEYS("*", (err, res) => {
  // console.log(res);
  keys = res;
  // keys = res.join(" ");
  console.log(keys);

  client.mget(keys, (err, res) => console.log('# retailers:', res.length));
});

client.get("42", (err, res) => console.log(res));
