package model

type Retailer struct {
	//gorm.Model
	Id               int32  `json:"id"`
	GSTIN            string `json:"gstin"`
	Business_name    string `json:"business_name"`
	Contact_person   string `json:"contact_person"`
	Contact_number   int32  `json:"contact_number"`
	Constact_address string `json:"contact_address"`
	Contact_emailId  string `json:"contact_emailId"`
	Status           string `json:"status"`
	Outlet_limit     int32  `json:"outlet_limit"`
}
