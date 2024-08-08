import { InferSelectModel } from "drizzle-orm";
import { mysqlTable, serial, varchar, int } from "drizzle-orm/mysql-core";

export const retailers = mysqlTable("retailers", {
  id: serial("id").primaryKey(),
  GSTIN: varchar("GSTIN", { length: 15 }),
  businessName: varchar("Business_name", { length: 100 }),
  contactPerson: varchar("Contact_person", { length: 50 }),
  contactNumber: int("Contact_number"),
  contactAddress: varchar("Contact_address", { length: 100 }),
  contactEmail: varchar("Contact_emailId", { length: 50 }),
  status: varchar("Status", { length: 10 }),
  outletLimit: int("Outlet_limit"),
});

export type RetailerType = InferSelectModel<typeof retailers>;
