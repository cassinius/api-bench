import { text, integer, sqliteTable } from "drizzle-orm/sqlite-core";

/**
 * 
 */
export const retailers = sqliteTable('public.retailer', {
  id: text('id'),
  gstin: text('GSTIN').notNull(),
  businessName: text('Business_name').notNull(),
  contactPerson: text('Contact_person').notNull(),
  contactNumber: integer('Contact_number').notNull(),
  contactAddress: text('Contact_address').notNull(),
  contactEmail: text('Contact_emailId').notNull(),
  status: text('Status').notNull(),
  outletLimit: integer('Outlet_limit').notNull(),
});