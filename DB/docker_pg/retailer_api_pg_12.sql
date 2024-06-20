--
-- PostgreSQL database dump
--

--
-- Connect to the right database
--
\c retailer_api

-- Dumped from database version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product; Type: TABLE; Schema: public; Owner: retailer
--

CREATE TABLE public.product (
    id integer NOT NULL,
    title character varying(255),
    body_sanitized character varying(5000)
);


ALTER TABLE public.product OWNER TO retailer;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: retailer
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO retailer;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: retailer
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


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
-- Name: store; Type: TABLE; Schema: public; Owner: retailer
--

CREATE TABLE public.store (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.store OWNER TO retailer;

--
-- Name: store_id_seq; Type: SEQUENCE; Schema: public; Owner: retailer
--

CREATE SEQUENCE public.store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_id_seq OWNER TO retailer;

--
-- Name: store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: retailer
--

ALTER SEQUENCE public.store_id_seq OWNED BY public.store.id;


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: retailer id; Type: DEFAULT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.retailer ALTER COLUMN id SET DEFAULT nextval('public.retailer_id_seq'::regclass);


--
-- Name: store id; Type: DEFAULT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.store ALTER COLUMN id SET DEFAULT nextval('public.store_id_seq'::regclass);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: retailer
--

COPY public.product (id, title, body_sanitized) FROM stdin;
\.


--
-- Data for Name: retailer; Type: TABLE DATA; Schema: public; Owner: retailer
--

COPY public.retailer (id, "GSTIN", "Business_name", "Contact_person", "Contact_number", "Contact_address", "Contact_emailId", "Status", "Outlet_limit") FROM stdin;
1	JnoUJV969zqGZuA	Patrick Taylor	Jesus Wright	28671	75157 Santos Viaduct\nNelsonview, CT 19750	kgarrett@yahoo.com	active	5
2	TdhF8gSoATjP2F2	Ronald Romero	Jaime Dunn	93167	2450 Jacob Overpass\nDanielton, IA 79272	ryanmichael@torres-gonzales.com	inactive	4
3	k2b9tDKNY66G7Jp	Shane Anderson	Mary Park	59005	4330 Alexis Estate\nStaceyberg, IL 03731	bethany41@cook-wilson.com	active	6
4	8pnC6huj71a0YpL	Rebecca Montgomery	Laura Roberson	52298	6300 Michael Spur\nOrozcomouth, IL 29486	ashleypruitt@gmail.com	inactive	1
5	cieM8Bqq8EczdeN	Kyle Spears	Hannah Moore	57164	79819 Scott Ridge\nPort Theresaside, MA 40652	watkinsjessica@gmail.com	inactive	2
6	miCKq3BtGSBTAY1	Michael Combs	Michael Pruitt	89013	257 Lindsay Track\nWest Melindaside, MT 38141	bmorris@yang.org	inactive	8
7	KBJNzXbw60AaBDx	Mrs. Breanna Kennedy MD	Richard Andrews	31793	38147 Veronica Branch Suite 265\nBrooksfort, LA 25477	drosario@yahoo.com	inactive	7
8	UkOjun0Bq32SxW3	Gregory Reeves	Eric Tyler	92499	10962 James Knolls Suite 238\nSouth Roberthaven, CA 05634	jacob94@paul.com	inactive	7
9	Shheyzw1ABV44ah	Stephanie Buchanan	George Davis	48692	025 Armstrong Key Apt. 808\nSouth Michael, CO 72367	louis51@mercer.com	active	5
10	OOtIVvHCBOZeWCK	William Garner	Melissa Martinez	15626	725 Marco Way Suite 190\nNew Jasonburgh, HI 84649	john18@jenkins-brown.com	active	4
11	Svh5QuvSFoqgpVw	Jessica Sharp	Dan Fox	77865	USNV Martin\nFPO AP 15006	mwilson@yahoo.com	active	1
12	51ggjdGrE7zyUSz	Lisa Richard	Benjamin Roberts	18812	8798 Robert Hollow\nMichelleview, ID 98728	billpotter@crawford-perez.com	inactive	10
13	pVYWUi0AwSVPdps	Brian Bryant	Alexander Mcclure	14801	54613 Tiffany Flat\nWest Daniel, LA 73916	danny22@johnson.biz	active	9
14	fgA5k5hnwA8Zxtp	Jessica Turner	Erica Velazquez	27230	5409 Stephen Dam Suite 681\nRobinsonchester, WI 01258	lisa82@benson.com	active	2
15	MA89xI0PUZKKtI6	Anna Shaw	Victor Ruiz	76457	000 Shannon Bridge\nCastroport, AK 45477	annettejuarez@stephenson.com	active	2
16	19gqhQtxcfuGQt6	Kelly Gallegos	Marilyn Ballard	10465	19177 Karen Parkway\nAshleystad, WY 54777	danielhoward@hotmail.com	inactive	5
17	8NR1esyFi3iK4hc	Tracy Wang	Jamie Moore	16304	27744 Sheila Village Apt. 587\nHuanghaven, MT 74037	bpeters@hotmail.com	active	1
18	Eq3Wmp1PC5CmYgk	Megan Levine	Jenny Fitzgerald	6795	00892 Jose Springs\nJamesside, NE 40912	jeffrey69@yahoo.com	inactive	7
19	mS613AJglZEKfxI	Gloria Duke	Tara Chaney	28611	21429 Juarez Drive Suite 523\nSouth Samuelchester, MT 90032	vickie53@yahoo.com	active	6
20	2C64K8oHRmCYSgc	Charles Fernandez	Brittany Davis	87487	568 Antonio Square\nPort Patty, MN 53112	jortiz@gmail.com	active	2
21	hpG3kxwAEyg8Za0	Desiree Dixon	Marcus Woodward	44947	59361 Bender Island\nNew Jamesfort, VA 54484	alejandro92@gmail.com	active	4
22	8u7e54VVssEXS3e	Benjamin Porter	Dominique Clark DDS	23942	9582 Pearson Alley\nGabrielleborough, MT 21502	josephjohnson@green-smith.biz	active	7
23	3rx2zpIzS5CftHz	Crystal Miller	Gabrielle Terry	95218	569 Allen Point\nFoxville, CT 56742	natashawalls@payne.com	active	5
24	t69uPFoJcXISdc3	Kimberly Johnson	Anthony Obrien	82818	Unit 8704 Box 4859\nDPO AA 02295	nmoore@hotmail.com	active	1
25	xXovKV5sCopeGgk	Mike Smith	Tina Ortega	81025	335 Andrew Brooks\nNorth Timothy, LA 42728	boydmatthew@dillon-hart.net	inactive	6
26	FsDIwj74zFKK6ue	Casey Smith	Julian Thompson	53041	0871 Jason Inlet Apt. 662\nNew Robert, DC 64271	karenjordan@gmail.com	active	9
27	Hv1IbDNnun9pVWF	Mark Martin	Michael Washington	44496	80707 Kerr Trafficway\nLake Lancefurt, WI 27665	vaughanshawna@hotmail.com	active	1
28	bUXYUPKqsLcmECg	Kara Gordon	Teresa Curtis	7545	5452 Isabella Shores\nEast Maryhaven, CA 91789	chaserosales@yahoo.com	active	2
29	xJSAAxJdcMWbFCr	Paige Johnson	Joy Ferrell	58104	812 Patrick Common Suite 335\nWest Stephanieborough, OK 67279	jjackson@hotmail.com	active	10
30	9wuBOGWZHKMtfFf	Jordan Nichols	Kelly Horne	34236	0581 Jack Mall\nKimberlyside, AR 43454	oherring@bates.com	inactive	4
31	rV97w5ZbSoD5XVe	Lindsey Murray	Ashley Williams	65309	15132 Brock Turnpike Apt. 788\nMatthewborough, NC 75975	patriciacarter@bowers-martinez.com	active	1
32	JZRAVQeUQunxeX8	Carolyn Woods	Amanda Smith	48838	6838 Kevin Neck\nEast Katherineville, DE 91700	tamaraconley@fox.com	active	4
33	o7O5C8hTq5YZ8fA	Elizabeth Huffman	Randall Donaldson	54060	65219 Jacqueline Lane\nNew Meagan, LA 27572	kevin38@smith.net	active	8
34	P6iPMSNAN47GGJo	Frances Solis	Melissa Williamson	20092	16010 Michael Track\nNew Robert, FL 94060	luisharris@hotmail.com	active	9
35	ADIlbNjRsI0HJw0	Juan Gutierrez	Andrew Henderson	20312	46163 William Lights Apt. 352\nJoshuafort, UT 40779	oconnellerika@hotmail.com	inactive	9
36	MNOq8IjiKtVZNsX	Peggy Patel	Angela Miller	54643	02519 Holmes Mount Suite 839\nEast Shawnbury, LA 15038	jesse05@estrada.com	inactive	4
37	NSyu1oJO8e3l4ei	Nicole Hines	Greg Edwards	41304	942 Clark Brooks Apt. 369\nCharlesberg, SD 25407	hamiltonerica@gmail.com	active	9
38	NJRxLoH6NK8MFVZ	Kathleen Walton	Teresa Larson	79509	408 Eugene Rue Suite 999\nEast Samanthaville, NH 84131	rhenson@yahoo.com	active	1
39	tOPimLU3Fa3Qj9O	Brian Young	Megan Conrad	67763	54139 Terri Stravenue Apt. 769\nAlexandermouth, ID 60127	browndawn@yahoo.com	inactive	3
40	68VleWd4cXQZui0	Jason Hoffman	Virginia Miranda	53620	Unit 5937 Box 0785\nDPO AE 90900	morgansmith@johnson.com	active	9
41	BbKzfqJ72SxQhhK	Catherine Brown	Terry Boyd	92335	46293 Ralph Plaza Apt. 178\nWest Stephanieville, CO 30727	sherry17@yahoo.com	inactive	10
42	00wdDdTbJ2H1KAN	Sarah Hawkins	Victor Prince	52535	0370 Paul Radial\nJorgestad, IN 98408	harrisemily@smith.com	inactive	8
43	72ryCrcENMBYkKv	Joshua Harris	Thomas Grant	50945	50207 Gonzalez Trail\nLake Kayleefurt, RI 84543	kerrmelissa@gmail.com	inactive	2
44	9U50JMS6lhN3IyZ	Aimee King	Marc Hays	77030	4132 Ryan Curve Suite 807\nWest Mary, TN 48585	joshuaross@travis.net	active	6
45	q44S5Z18lwalY8q	Christopher Ballard	Travis Martinez	55550	211 Jonathan Underpass Suite 012\nTamaraton, MA 97288	katherinewilliams@gonzales.com	inactive	5
46	eYU9kpgJR8LZ6k5	Adrian Rodriguez	Steven Smith	20960	PSC 3227, Box 1410\nAPO AA 69970	crystal00@callahan-young.biz	inactive	2
47	vsFUEghDlOCAfD9	Laura Estrada	Justin Klein	1319	095 Daniel Mountains\nEstradaton, MI 51303	kimberlyburton@gmail.com	active	6
48	93CLEE414hY48P0	Lee Smith	Benjamin Avery	80042	Unit 2742 Box 8965\nDPO AP 18811	anthonysmith@hotmail.com	active	7
49	3DFkuNwOqs9xA8S	David Chavez	Jeffrey Moody	40475	Unit 0681 Box 0356\nDPO AP 58710	kimbrandi@hotmail.com	active	2
50	rSiRG43eqLg7xds	Renee Johnson	David Allen	68692	939 Hubbard Inlet Suite 361\nNew Marissa, NE 66382	chavezvirginia@gmail.com	active	7
51	WCXZs73OiJe2ntY	Trevor Oliver	Emily Calhoun	72682	402 Christopher Wall Apt. 248\nMooremouth, UT 83409	charles10@gmail.com	inactive	7
52	gbEsA5nkT32Sz86	Justin Johnson	David Reid	15531	USS Montgomery\nFPO AP 43634	timmyers@yahoo.com	active	8
53	erEpr1DEgT2wOlk	Tina Mathews	Martin Ibarra II	45533	650 Elizabeth Views\nLake Allenburgh, AL 76492	wendyyoung@king-walker.com	active	2
54	8BUuPDqWfZiy0lN	Jessica Cantu	Stephanie King	43365	329 Villegas Forge\nPort Josephview, UT 55182	tracy90@yahoo.com	active	9
55	KC7MldiSZcmrTKs	Jordan Johnson	Paul Walton	13983	1929 Clark Rest\nWest Mark, AR 01605	lking@zhang.org	inactive	9
56	uUqkJoTSvPnW3e3	Sara Osborn	Austin Jones	97564	74389 Francis Parkway\nWest Teresa, MN 33588	prestonmegan@schroeder.com	active	3
57	upiaRIqQIjoXM6b	Mary Stevens	Gary Mendoza	84715	46807 Veronica Brook Suite 544\nSouth Jamesville, OK 66526	qchan@gmail.com	active	10
58	BFvxSrYNbonLvZw	Kathleen Pearson	Tara Johnson	77830	65302 Michael Unions Suite 148\nZacharyview, TN 20859	trussell@gray.com	active	10
59	mHLUlfwvsrXackx	David Walker	Kari Brown	64345	2757 Woods Park\nNorth Tommy, SD 66465	williamstara@gmail.com	active	5
60	HlQzsknw6Q7ecfh	Jennifer Williams	Melissa Aguilar	5942	74126 Potter Shoal Apt. 052\nEast Brett, IN 19875	icastaneda@gmail.com	inactive	1
61	3KVrRGcudx1Mk0Q	John Becker	Michelle Calhoun	36329	172 Nielsen Landing Suite 631\nAndrewmouth, MD 58511	omoon@yahoo.com	active	8
62	fQT2uWli3RovJsg	Jessica Martin	Thomas Alexander	8123	7223 Turner Highway\nNorth Zacharyfurt, NC 47097	erikaclark@gmail.com	active	2
63	VYPed2Y8VbFPYGZ	Rhonda Perry	Cameron Green	64234	284 Eugene Alley\nEast Tara, HI 42556	mejiachristopher@yahoo.com	active	7
64	ced0cp8w5OfSJMv	Carlos Jackson	Sandy Velasquez	57814	736 Megan Isle Suite 365\nJohnsonmouth, NM 96630	castillothomas@aguirre.net	active	3
65	YihsM7LtC95i9DK	Christina Green	Larry Logan	95616	68146 Teresa Mission\nMartinezberg, WI 37467	hjackson@hotmail.com	active	8
66	JyIAYdElofo7Ung	Dawn Russell	Julie Santiago	97550	Unit 5887 Box 3376\nDPO AP 31202	jim39@mccann.com	active	1
67	ZJ9pDav0O8Nfde8	Candace Hunter	Julie Orozco	68032	95445 Jordan Port\nEast Timothyside, NM 71829	fsmith@hotmail.com	active	1
68	6yYXsfgcon5G11O	Kimberly Phillips	Maria Gaines	3644	434 Shannon Expressway\nNicholeborough, KS 71897	deborahfoley@yahoo.com	inactive	8
69	BXOjvAS39u6yr9X	Chelsey White	Jeffrey Ramos	62300	108 Jones Plain\nWagnerfurt, AK 29423	ryan39@yahoo.com	active	6
70	b2hRQveX2xoMFkq	Steven Mason	Brian Huang	82501	5097 Clayton Alley\nMitchellbury, TX 31413	courtneywilcox@yahoo.com	active	4
71	EDsdFxmdIZZBBjj	Teresa Brooks	Lucas Cordova	44175	7716 Nelson Vista\nBushfort, GA 44783	harrismatthew@gmail.com	active	4
72	nS6kqwRTEkxKBUi	Jorge Larsen	Kylie Hernandez	28574	8997 Charles Mission Suite 966\nJeffreyborough, WY 15342	richarddouglas@suarez.com	active	2
73	D1G8hFdOiYtnV3l	Sarah Pierce	Joshua Clark	64128	43511 Lam Park\nKatrinaberg, CA 97567	madams@king.com	inactive	2
74	sAD1U639KAlSbYH	Megan Davis	Chad Burns	95007	16537 Shirley Manors\nWest Calvin, CA 89751	johnsonkristen@yahoo.com	inactive	10
75	3B4cJaJlmdiWzHs	Leah Martin	Barbara Gordon	31161	9735 Lisa Gateway Suite 541\nLake Jennifer, TX 17795	ashleysavage@gmail.com	active	3
76	axUWrB7UYXyeF3t	Emily Bishop	Samantha Morgan	99457	USS Garcia\nFPO AE 52345	pamelaperkins@haynes.biz	active	5
77	SShDDuImTJtjkCI	James Diaz	Taylor Horn	85519	9161 Daniel Route Apt. 424\nTerrimouth, CO 55584	walkerjennifer@mckenzie-dennis.com	inactive	9
78	t86qHes0ORH4Oud	Elizabeth Abbott	Raymond Jones	54048	1825 Joseph Ford Suite 923\nLake Melissa, NV 14891	dustindennis@davis-christensen.org	active	8
79	I7584TZ0UWsFnkb	Steven Case	Gloria Anthony	78652	9631 Courtney Forge Suite 735\nJoneschester, NJ 49796	daltonsharon@barrett.com	active	4
80	e97PG5hHXca5p6f	Nicholas Hill	Andrea Rodriguez	82249	022 Olson Mission Suite 336\nJuliestad, OR 98725	sheparddustin@tucker.com	active	3
81	eSDffuA0f0xcwth	Andrew Scott	Debra Barker	91721	76505 Alex Union Apt. 342\nNorth Krystal, DE 85936	ashleycastro@yahoo.com	active	5
82	VLr0NZEICVJY9rI	Christopher Miller	Stephanie Mckay	10748	802 Roberts Oval\nLake Cassandra, NE 46857	james42@thompson.com	active	1
83	1KpAx0SU04wGRGJ	Bradley Hartman	Robert Larson	48831	2025 Haley Lakes Apt. 248\nSmithfurt, OH 24428	kramerjeffrey@gibbs.org	active	7
84	7qaweCaq2jKFdap	Mr. Riley Carroll Jr.	Sara Jones	81279	149 Hartman Roads Apt. 758\nNorth Amandaport, IA 83612	bgarcia@francis-scott.com	active	9
85	FREQTZyUN5Wcn7y	Megan Nichols	Angela Meyers	37981	804 Holland Shoals Suite 064\nLake Shelbymouth, DE 72926	ricardojackson@bell.com	inactive	5
86	kubn9POe5Tt8UWx	Jacqueline Meyers	Christopher Williams	59678	57542 Farrell Locks Suite 611\nEast Anthonymouth, MA 06192	zmitchell@rodriguez-curry.info	active	2
87	Opi1eYXRhmDV7FA	Crystal Rhodes	Zachary Suarez	47291	56011 Alexander Lodge Apt. 635\nPort Jerry, OH 69983	brianhoffman@bennett.net	active	4
88	PSTyGoKrj9b5iRu	Calvin Trujillo	Steven Compton	98984	USNS Summers\nFPO AE 05714	greentina@freeman.com	active	6
89	LTO75ZfslelMhBQ	Philip Nelson	Vicki Wade	87547	8401 Kevin Corners\nNorth Emilystad, CT 79901	johnsonjoseph@yahoo.com	active	7
90	eAIyROlWQrBkuQI	Todd Nichols	Andrea Mccarty	43355	1641 Neal Run Apt. 294\nLake Jaymouth, IA 15463	wattsjordan@martinez.info	inactive	9
91	kflHlAot7q3wlw0	Jordan Benson	Jonathan Austin	45239	9772 Gabriel Viaduct Apt. 490\nPort Jessica, CO 37243	eharvey@gmail.com	active	8
92	oHV8WuYmDTyc9tO	Michael Nunez	Billy Wells	98434	2052 William Mission Apt. 907\nNew Kristiton, UT 92710	adamschristopher@cochran-morgan.com	inactive	1
93	lN4FqbpB5T3HPy1	Barbara Wells	Nichole Hall	46629	90541 Haynes Forest\nSouth Katherinehaven, OH 41251	christycrawford@hotmail.com	active	4
94	LdN2QcjNNl9Wgcx	Nicholas White	Jeffrey Wright	40868	Unit 4242 Box 3741\nDPO AA 70545	jamesjennifer@huff-thomas.com	active	6
95	0EiNDHfTDNtRdXy	Ivan Mccarthy	Adam Perkins	75390	462 Chavez Fords Suite 453\nJoshuatown, NV 42784	angelacross@yahoo.com	inactive	3
96	TGA4crfUCjDCKzM	Matthew Heath	John Nguyen	47959	77895 Lacey Key Suite 964\nSouth Samantha, NC 12207	robertjohnson@hotmail.com	active	8
97	I8VArGuyaf294dd	Allison Harris	Lauren Delacruz	56528	485 Hill Club Suite 877\nWest Jamesland, TX 49820	wallacejennifer@hotmail.com	active	6
98	FEgcbGrQv8Hqnse	Richard Henson	Amy Mitchell	97594	5835 Schneider Ranch Suite 908\nDavidshire, MS 54647	cowantyler@montoya.biz	inactive	9
99	pvoNisp87CfFIRZ	Joann Tucker	Donna Cardenas	7799	455 Porter Causeway Suite 927\nLake Carlos, ND 92762	bwhite@gmail.com	active	4
100	Foy15hOFtgmiOvv	Michael Meyer	Jim Flores	59408	32522 Brenda Pine Suite 156\nNorth Mary, NV 45374	trevinoaaron@gmail.com	active	10
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: retailer
--

COPY public.store (id, name) FROM stdin;
\.


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: retailer
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- Name: retailer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: retailer
--

SELECT pg_catalog.setval('public.retailer_id_seq', 1, false);


--
-- Name: store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: retailer
--

SELECT pg_catalog.setval('public.store_id_seq', 1, false);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: retailer retailer_pkey; Type: CONSTRAINT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.retailer
    ADD CONSTRAINT retailer_pkey PRIMARY KEY (id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: retailer
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

