table! {
    retailer (id) {
        id -> Int4,
        GSTIN -> Nullable<Varchar>,
        Business_name -> Nullable<Varchar>,
        Contact_person -> Nullable<Varchar>,
        Contact_number -> Nullable<Int4>,
        Contact_address -> Nullable<Varchar>,
        Contact_emailId -> Nullable<Varchar>,
        Status -> Nullable<Varchar>,
        Outlet_limit -> Nullable<Int4>,
    }
}
