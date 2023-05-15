import { InferModel } from "drizzle-orm";
import { pgTable, serial, text, varchar, integer } from "drizzle-orm/pg-core";

export const retailers = pgTable("retailer", {
  id: serial("id").primaryKey(),
  GSTIN: varchar("GSTIN", { length: 15 }),
  businessName: varchar("Business_name", { length: 100 }),
  contactPerson: varchar("Contact_person", { length: 50 }),
  contactNumber: integer("Contact_number"),
  contactAddress: varchar("Contact_address", { length: 100 }),
  contactEmail: varchar("Contact_emailId", { length: 50 }),
  status: varchar("Status", { length: 10 }),
  outletLimit: integer("Outlet_limit"),
});

export type RetailerType = InferModel<typeof retailers>;
