--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: retailer; Type: TABLE; Schema: public; Owner: retailer
--

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


ALTER TABLE public.retailer OWNER TO retailer;

--
-- Name: retailer_id_seq; Type: SEQUENCE; Schema: public; Owner: retailer
--

CREATE SEQUENCE public.retailer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.retailer_id_seq OWNER TO retailer;

--
-- Name: retailer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: retailer
--

ALTER SEQUENCE public.retailer_id_seq OWNED BY public.retailer.id;


--
-- Name: retailer id; Type: DEFAULT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.retailer ALTER COLUMN id SET DEFAULT nextval('public.retailer_id_seq'::regclass);


--
-- Name: retailer retailer_pkey; Type: CONSTRAINT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.retailer
    ADD CONSTRAINT retailer_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

