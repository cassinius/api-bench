import typia from "typia";
import { RetailerType } from "../schema";

export const checkRetailer = typia.createIs<RetailerType>();
export const stringifyRetailer = typia.createStringify<RetailerType>();
export const isStringifyRetailer = typia.createIsStringify<RetailerType>();

export const checkRetailerArray = typia.createIs<RetailerType[]>();
export const stringifyRetailerArray = typia.createStringify<RetailerType[]>();
export const isStringifyRetailerArray = typia.createIsStringify<RetailerType[]>();