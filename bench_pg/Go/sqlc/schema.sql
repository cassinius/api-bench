CREATE TABLE public.retailer (
    id integer NOT NULL,
    "GSTIN" character varying(15),
    "Business_name" character varying(100),
    "Contact_person" character varying(50),
    "Contact_number" integer,
    "Contact_address" character varying(100),
    "Contact_emailId" character varying(50),
    "Status" character varying(10),
    "Outlet_limit" integer
);
