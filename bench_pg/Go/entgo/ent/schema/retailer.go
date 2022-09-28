package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema"
	"entgo.io/ent/schema/field"
)

// Retailer holds the schema definition for the Retailer entity.
type Retailer struct {
	ent.Schema
}

// Annotations of the User.
func (Retailer) Annotations() []schema.Annotation {
	return []schema.Annotation{
		entsql.Annotation{Table: "retailer"},
	}
}

// Fields of the Retailer.
func (Retailer) Fields() []ent.Field {
	return []ent.Field{
		//field.Int32("Id").Positive().StorageKey().StructTag(`json:"id"`),
		field.String("GSTIN").Unique().StorageKey("GSTIN").StructTag(`json:"gstin"`),
		field.String("BusinessName").StorageKey("Business_name").StructTag(`json:"business_name"`),
		field.String("ContactPerson").StorageKey("Contact_person").StructTag(`json:"contact_person"`),
		field.Int32("ContactNumber").StorageKey("Contact_number").Positive().StructTag(`json:"contact_number"`),
		field.String("ContactAddress").StorageKey("Contact_address").StructTag(`json:"contact_address"`),
		field.String("ContactEmailId").StorageKey("Contact_emailId").StructTag(`json:"contact_email_id"`),
		field.String("Status").StorageKey("Status").StructTag(`json:"status"`),
		field.Int32("OutletLimit").Positive().StorageKey("Outlet_limit").StructTag(`json:"outlet_limit"`),
	}
}

// Edges of the Retailer.
func (Retailer) Edges() []ent.Edge {
	return nil
}
