--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Fle2sxpx+hEynjcmmSdQ4A==$lVW+Nmc3KWmzmfVUJuO2nzz2KO7QoDLNBGKQwpeCbRM=:S4bqoxvOPJ6zMA3VFt/64ON/T4cHbmVGba8ElbzgD7U=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "fluyt" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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

--
-- Name: fluyt; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE fluyt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE fluyt OWNER TO root;

\connect fluyt

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

--
-- Name: admin; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA admin;


ALTER SCHEMA admin OWNER TO root;

--
-- Name: manager; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA manager;


ALTER SCHEMA manager OWNER TO root;

--
-- Name: multi-tenant; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA "multi-tenant";


ALTER SCHEMA "multi-tenant" OWNER TO root;

--
-- Name: user; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA "user";


ALTER SCHEMA "user" OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: admin; Owner: root
--

CREATE TABLE admin.customer (
                                id integer NOT NULL,
                                schema_name character varying(63) NOT NULL,
                                company_name character varying(100) NOT NULL,
                                trade_name character varying(100) NOT NULL,
                                email character varying(100) NOT NULL,
                                active boolean DEFAULT true
);


ALTER TABLE admin.customer OWNER TO root;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: admin; Owner: root
--

CREATE SEQUENCE admin.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.customer_id_seq OWNER TO root;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: root
--

ALTER SEQUENCE admin.customer_id_seq OWNED BY admin.customer.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: admin; Owner: root
--

CREATE TABLE admin.flyway_schema_history (
                                             installed_rank integer NOT NULL,
                                             version character varying(50),
                                             description character varying(200) NOT NULL,
                                             type character varying(20) NOT NULL,
                                             script character varying(1000) NOT NULL,
                                             checksum integer,
                                             installed_by character varying(100) NOT NULL,
                                             installed_on timestamp without time zone DEFAULT now() NOT NULL,
                                             execution_time integer NOT NULL,
                                             success boolean NOT NULL
);


ALTER TABLE admin.flyway_schema_history OWNER TO root;

--
-- Name: company; Type: TABLE; Schema: manager; Owner: root
--

CREATE TABLE manager.company (
                                 id integer NOT NULL,
                                 company_name character varying(100) NOT NULL,
                                 trade_name character varying(100) NOT NULL,
                                 email character varying(100) NOT NULL
);


ALTER TABLE manager.company OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: manager; Owner: root
--

CREATE SEQUENCE manager.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manager.company_id_seq OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: manager; Owner: root
--

ALTER SEQUENCE manager.company_id_seq OWNED BY manager.company.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: manager; Owner: root
--

CREATE TABLE manager.flyway_schema_history (
                                               installed_rank integer NOT NULL,
                                               version character varying(50),
                                               description character varying(200) NOT NULL,
                                               type character varying(20) NOT NULL,
                                               script character varying(1000) NOT NULL,
                                               checksum integer,
                                               installed_by character varying(100) NOT NULL,
                                               installed_on timestamp without time zone DEFAULT now() NOT NULL,
                                               execution_time integer NOT NULL,
                                               success boolean NOT NULL
);


ALTER TABLE manager.flyway_schema_history OWNER TO root;

--
-- Name: k8s_cluster; Type: TABLE; Schema: manager; Owner: root
--

CREATE TABLE manager.k8s_cluster (
                                     id integer NOT NULL,
                                     name character varying(100) NOT NULL,
                                     connection_type character varying(50) NOT NULL,
                                     url character varying(255),
                                     token text,
                                     username character varying(50),
                                     password text,
                                     validate_ssl boolean
);


ALTER TABLE manager.k8s_cluster OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE; Schema: manager; Owner: root
--

CREATE SEQUENCE manager.k8s_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manager.k8s_cluster_id_seq OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: manager; Owner: root
--

ALTER SEQUENCE manager.k8s_cluster_id_seq OWNED BY manager.k8s_cluster.id;


--
-- Name: company; Type: TABLE; Schema: multi-tenant; Owner: root
--

CREATE TABLE "multi-tenant".company (
                                        id integer NOT NULL,
                                        company_name character varying(100) NOT NULL,
                                        trade_name character varying(100) NOT NULL,
                                        email character varying(100) NOT NULL
);


ALTER TABLE "multi-tenant".company OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: multi-tenant; Owner: root
--

CREATE SEQUENCE "multi-tenant".company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "multi-tenant".company_id_seq OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: multi-tenant; Owner: root
--

ALTER SEQUENCE "multi-tenant".company_id_seq OWNED BY "multi-tenant".company.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: multi-tenant; Owner: root
--

CREATE TABLE "multi-tenant".flyway_schema_history (
                                                      installed_rank integer NOT NULL,
                                                      version character varying(50),
                                                      description character varying(200) NOT NULL,
                                                      type character varying(20) NOT NULL,
                                                      script character varying(1000) NOT NULL,
                                                      checksum integer,
                                                      installed_by character varying(100) NOT NULL,
                                                      installed_on timestamp without time zone DEFAULT now() NOT NULL,
                                                      execution_time integer NOT NULL,
                                                      success boolean NOT NULL
);


ALTER TABLE "multi-tenant".flyway_schema_history OWNER TO root;

--
-- Name: k8s_cluster; Type: TABLE; Schema: multi-tenant; Owner: root
--

CREATE TABLE "multi-tenant".k8s_cluster (
                                            id integer NOT NULL,
                                            name character varying(100) NOT NULL,
                                            connection_type character varying(50) NOT NULL,
                                            url character varying(255),
                                            token text,
                                            username character varying(50),
                                            password text,
                                            validate_ssl boolean
);


ALTER TABLE "multi-tenant".k8s_cluster OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE; Schema: multi-tenant; Owner: root
--

CREATE SEQUENCE "multi-tenant".k8s_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "multi-tenant".k8s_cluster_id_seq OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: multi-tenant; Owner: root
--

ALTER SEQUENCE "multi-tenant".k8s_cluster_id_seq OWNED BY "multi-tenant".k8s_cluster.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.flyway_schema_history (
                                              installed_rank integer NOT NULL,
                                              version character varying(50),
                                              description character varying(200) NOT NULL,
                                              type character varying(20) NOT NULL,
                                              script character varying(1000) NOT NULL,
                                              checksum integer,
                                              installed_by character varying(100) NOT NULL,
                                              installed_on timestamp without time zone DEFAULT now() NOT NULL,
                                              execution_time integer NOT NULL,
                                              success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO root;

--
-- Name: company; Type: TABLE; Schema: user; Owner: root
--

CREATE TABLE "user".company (
                                id integer NOT NULL,
                                company_name character varying(100) NOT NULL,
                                trade_name character varying(100) NOT NULL,
                                email character varying(100) NOT NULL
);


ALTER TABLE "user".company OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: user; Owner: root
--

CREATE SEQUENCE "user".company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "user".company_id_seq OWNER TO root;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: user; Owner: root
--

ALTER SEQUENCE "user".company_id_seq OWNED BY "user".company.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: user; Owner: root
--

CREATE TABLE "user".flyway_schema_history (
                                              installed_rank integer NOT NULL,
                                              version character varying(50),
                                              description character varying(200) NOT NULL,
                                              type character varying(20) NOT NULL,
                                              script character varying(1000) NOT NULL,
                                              checksum integer,
                                              installed_by character varying(100) NOT NULL,
                                              installed_on timestamp without time zone DEFAULT now() NOT NULL,
                                              execution_time integer NOT NULL,
                                              success boolean NOT NULL
);


ALTER TABLE "user".flyway_schema_history OWNER TO root;

--
-- Name: k8s_cluster; Type: TABLE; Schema: user; Owner: root
--

CREATE TABLE "user".k8s_cluster (
                                    id integer NOT NULL,
                                    name character varying(100) NOT NULL,
                                    connection_type character varying(50) NOT NULL,
                                    url character varying(255),
                                    token text,
                                    username character varying(50),
                                    password text,
                                    validate_ssl boolean
);


ALTER TABLE "user".k8s_cluster OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE; Schema: user; Owner: root
--

CREATE SEQUENCE "user".k8s_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "user".k8s_cluster_id_seq OWNER TO root;

--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: user; Owner: root
--

ALTER SEQUENCE "user".k8s_cluster_id_seq OWNED BY "user".k8s_cluster.id;


--
-- Name: customer id; Type: DEFAULT; Schema: admin; Owner: root
--

ALTER TABLE ONLY admin.customer ALTER COLUMN id SET DEFAULT nextval('admin.customer_id_seq'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: manager; Owner: root
--

ALTER TABLE ONLY manager.company ALTER COLUMN id SET DEFAULT nextval('manager.company_id_seq'::regclass);


--
-- Name: k8s_cluster id; Type: DEFAULT; Schema: manager; Owner: root
--

ALTER TABLE ONLY manager.k8s_cluster ALTER COLUMN id SET DEFAULT nextval('manager.k8s_cluster_id_seq'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: multi-tenant; Owner: root
--

ALTER TABLE ONLY "multi-tenant".company ALTER COLUMN id SET DEFAULT nextval('"multi-tenant".company_id_seq'::regclass);


--
-- Name: k8s_cluster id; Type: DEFAULT; Schema: multi-tenant; Owner: root
--

ALTER TABLE ONLY "multi-tenant".k8s_cluster ALTER COLUMN id SET DEFAULT nextval('"multi-tenant".k8s_cluster_id_seq'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: user; Owner: root
--

ALTER TABLE ONLY "user".company ALTER COLUMN id SET DEFAULT nextval('"user".company_id_seq'::regclass);


--
-- Name: k8s_cluster id; Type: DEFAULT; Schema: user; Owner: root
--

ALTER TABLE ONLY "user".k8s_cluster ALTER COLUMN id SET DEFAULT nextval('"user".k8s_cluster_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: admin; Owner: root
--

COPY admin.customer (id, schema_name, company_name, trade_name, email, active) FROM stdin;
1	user	user	user	user@fluyt.com	t
3	multi-tenant	multi-tenant	multi-tenant	multi-tenant@fluyt.com	t
2	manager	manager	manager	manager@fluyt.com	t
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: admin; Owner: root
--

COPY admin.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"admin"	\N	root	2023-04-18 15:04:16.346502	0	t
1	1.0.0	Create Customer Table	SQL	db/migration/admin/V1.0.0__Create_Customer_Table.sql	-1151713933	root	2023-04-18 15:04:16.382733	27	t
2	1.0.1	Insert Customer Test	SQL	db/migration/admin/V1.0.1__Insert_Customer_Test.sql	649739508	root	2023-04-18 15:04:16.42829	10	t
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: manager; Owner: root
--

COPY manager.company (id, company_name, trade_name, email) FROM stdin;
1	manager	manager	manager@fluyt.com
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: manager; Owner: root
--

COPY manager.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"manager"	\N	root	2023-04-21 09:02:22.783979	0	t
1	1.0.0	Create Company Table	SQL	V1.0.0__Create_Company_Table.sql	-998522761	root	2023-04-21 09:02:22.813034	23	t
2	1.0.1	Create K8s Cluster Table	SQL	V1.0.1__Create_K8s_Cluster_Table.sql	-1394592048	root	2023-04-21 09:02:22.855509	35	t
\.


--
-- Data for Name: k8s_cluster; Type: TABLE DATA; Schema: manager; Owner: root
--

COPY manager.k8s_cluster (id, name, connection_type, url, token, username, password, validate_ssl) FROM stdin;
1	local	DEFAULT	\N	\N	\N	\N	f
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: multi-tenant; Owner: root
--

COPY "multi-tenant".company (id, company_name, trade_name, email) FROM stdin;
1	multi-tenant	multi-tenant	multi-tenant@fluyt.com
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: multi-tenant; Owner: root
--

COPY "multi-tenant".flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"multi-tenant"	\N	root	2023-04-21 09:03:58.539317	0	t
1	1.0.0	Create Company Table	SQL	V1.0.0__Create_Company_Table.sql	-998522761	root	2023-04-21 09:03:58.567072	22	t
2	1.0.1	Create K8s Cluster Table	SQL	V1.0.1__Create_K8s_Cluster_Table.sql	-1394592048	root	2023-04-21 09:03:58.609957	33	t
\.


--
-- Data for Name: k8s_cluster; Type: TABLE DATA; Schema: multi-tenant; Owner: root
--

COPY "multi-tenant".k8s_cluster (id, name, connection_type, url, token, username, password, validate_ssl) FROM stdin;
1	local	DEFAULT	\N	\N	\N	\N	f
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: user; Owner: root
--

COPY "user".company (id, company_name, trade_name, email) FROM stdin;
1	user	user	user@fluyt.com
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: user; Owner: root
--

COPY "user".flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"user"	\N	root	2023-04-21 08:58:14.32287	0	t
1	1.0.0	Create Company Table	SQL	V1.0.0__Create_Company_Table.sql	-998522761	root	2023-04-21 08:58:14.35226	20	t
2	1.0.1	Create K8s Cluster Table	SQL	V1.0.1__Create_K8s_Cluster_Table.sql	-1394592048	root	2023-04-21 08:58:14.390714	29	t
\.


--
-- Data for Name: k8s_cluster; Type: TABLE DATA; Schema: user; Owner: root
--

COPY "user".k8s_cluster (id, name, connection_type, url, token, username, password, validate_ssl) FROM stdin;
1	local	DEFAULT	\N	\N	\N	\N	f
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: root
--

SELECT pg_catalog.setval('admin.customer_id_seq', 11, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: manager; Owner: root
--

SELECT pg_catalog.setval('manager.company_id_seq', 1, true);


--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE SET; Schema: manager; Owner: root
--

SELECT pg_catalog.setval('manager.k8s_cluster_id_seq', 1, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: multi-tenant; Owner: root
--

SELECT pg_catalog.setval('"multi-tenant".company_id_seq', 1, true);


--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE SET; Schema: multi-tenant; Owner: root
--

SELECT pg_catalog.setval('"multi-tenant".k8s_cluster_id_seq', 1, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: user; Owner: root
--

SELECT pg_catalog.setval('"user".company_id_seq', 2, true);


--
-- Name: k8s_cluster_id_seq; Type: SEQUENCE SET; Schema: user; Owner: root
--

SELECT pg_catalog.setval('"user".k8s_cluster_id_seq', 1, true);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: admin; Owner: root
--

ALTER TABLE ONLY admin.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: admin; Owner: root
--

ALTER TABLE ONLY admin.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: manager; Owner: root
--

ALTER TABLE ONLY manager.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: manager; Owner: root
--

ALTER TABLE ONLY manager.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: k8s_cluster k8s_cluster_pkey; Type: CONSTRAINT; Schema: manager; Owner: root
--

ALTER TABLE ONLY manager.k8s_cluster
    ADD CONSTRAINT k8s_cluster_pkey PRIMARY KEY (id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: multi-tenant; Owner: root
--

ALTER TABLE ONLY "multi-tenant".company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: multi-tenant; Owner: root
--

ALTER TABLE ONLY "multi-tenant".flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: k8s_cluster k8s_cluster_pkey; Type: CONSTRAINT; Schema: multi-tenant; Owner: root
--

ALTER TABLE ONLY "multi-tenant".k8s_cluster
    ADD CONSTRAINT k8s_cluster_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: user; Owner: root
--

ALTER TABLE ONLY "user".company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: user; Owner: root
--

ALTER TABLE ONLY "user".flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: k8s_cluster k8s_cluster_pkey; Type: CONSTRAINT; Schema: user; Owner: root
--

ALTER TABLE ONLY "user".k8s_cluster
    ADD CONSTRAINT k8s_cluster_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: admin; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON admin.flyway_schema_history USING btree (success);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: manager; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON manager.flyway_schema_history USING btree (success);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: multi-tenant; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON "multi-tenant".flyway_schema_history USING btree (success);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: user; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON "user".flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

