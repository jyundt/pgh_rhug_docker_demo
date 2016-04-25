--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE admin (
    id integer NOT NULL,
    email character varying(200),
    username character varying(200),
    password_hash character varying(128),
    confirmed boolean,
    name character varying(200)
);


ALTER TABLE public.admin OWNER TO oval;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO oval;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE admin_id_seq OWNED BY admin.id;


--
-- Name: admin_role; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE admin_role (
    id integer NOT NULL,
    admin_id integer,
    role_id integer
);


ALTER TABLE public.admin_role OWNER TO oval;

--
-- Name: admin_role_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE admin_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_role_id_seq OWNER TO oval;

--
-- Name: admin_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE admin_role_id_seq OWNED BY admin_role.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO oval;

--
-- Name: marshal; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE marshal (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.marshal OWNER TO oval;

--
-- Name: marshal_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE marshal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marshal_id_seq OWNER TO oval;

--
-- Name: marshal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE marshal_id_seq OWNED BY marshal.id;


--
-- Name: official; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE official (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.official OWNER TO oval;

--
-- Name: official_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE official_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.official_id_seq OWNER TO oval;

--
-- Name: official_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE official_id_seq OWNED BY official.id;


--
-- Name: participant; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE participant (
    id integer NOT NULL,
    racer_id integer,
    team_id integer,
    race_id integer,
    place integer,
    points integer,
    team_points integer,
    mar_points integer,
    mar_place integer,
    point_prime boolean,
    dnf boolean,
    dns boolean,
    relegated boolean,
    disqualified boolean
);


ALTER TABLE public.participant OWNER TO oval;

--
-- Name: participant_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE participant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participant_id_seq OWNER TO oval;

--
-- Name: participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE participant_id_seq OWNED BY participant.id;


--
-- Name: prime; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE prime (
    id integer NOT NULL,
    participant_id integer,
    name character varying(200) NOT NULL
);


ALTER TABLE public.prime OWNER TO oval;

--
-- Name: prime_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE prime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prime_id_seq OWNER TO oval;

--
-- Name: prime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE prime_id_seq OWNED BY prime.id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE race (
    id integer NOT NULL,
    date date NOT NULL,
    class_id integer,
    duration interval,
    slow_lap interval,
    fast_lap interval,
    average_lap interval,
    weather character varying(200),
    usac_permit character varying(200),
    laps integer,
    starters integer
);


ALTER TABLE public.race OWNER TO oval;

--
-- Name: race_class; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE race_class (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.race_class OWNER TO oval;

--
-- Name: race_class_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE race_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_class_id_seq OWNER TO oval;

--
-- Name: race_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE race_class_id_seq OWNED BY race_class.id;


--
-- Name: race_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_id_seq OWNER TO oval;

--
-- Name: race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE race_id_seq OWNED BY race.id;


--
-- Name: race_marshal; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE race_marshal (
    id integer NOT NULL,
    marshal_id integer,
    race_id integer
);


ALTER TABLE public.race_marshal OWNER TO oval;

--
-- Name: race_marshal_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE race_marshal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_marshal_id_seq OWNER TO oval;

--
-- Name: race_marshal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE race_marshal_id_seq OWNED BY race_marshal.id;


--
-- Name: race_official; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE race_official (
    id integer NOT NULL,
    official_id integer,
    race_id integer
);


ALTER TABLE public.race_official OWNER TO oval;

--
-- Name: race_official_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE race_official_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_official_id_seq OWNER TO oval;

--
-- Name: race_official_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE race_official_id_seq OWNED BY race_official.id;


--
-- Name: racer; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE racer (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    usac_license integer,
    birthdate date,
    current_team_id integer
);


ALTER TABLE public.racer OWNER TO oval;

--
-- Name: racer_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE racer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.racer_id_seq OWNER TO oval;

--
-- Name: racer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE racer_id_seq OWNED BY racer.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying(200)
);


ALTER TABLE public.role OWNER TO oval;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO oval;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE team (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.team OWNER TO oval;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO oval;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: oval; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(200),
    username character varying(200),
    password_hash character varying(128),
    confirmed boolean,
    name character varying(200)
);


ALTER TABLE public.users OWNER TO oval;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: oval
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO oval;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oval
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY admin ALTER COLUMN id SET DEFAULT nextval('admin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY admin_role ALTER COLUMN id SET DEFAULT nextval('admin_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY marshal ALTER COLUMN id SET DEFAULT nextval('marshal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY official ALTER COLUMN id SET DEFAULT nextval('official_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY participant ALTER COLUMN id SET DEFAULT nextval('participant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY prime ALTER COLUMN id SET DEFAULT nextval('prime_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race ALTER COLUMN id SET DEFAULT nextval('race_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_class ALTER COLUMN id SET DEFAULT nextval('race_class_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_marshal ALTER COLUMN id SET DEFAULT nextval('race_marshal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_official ALTER COLUMN id SET DEFAULT nextval('race_official_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY racer ALTER COLUMN id SET DEFAULT nextval('racer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oval
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY admin (id, email, username, password_hash, confirmed, name) FROM stdin;
2	emily.wolfe@gmail.com	emily	pbkdf2:sha1:1000$SVDszvkY$1b2fc1782eee759a15b396256c806a979adee276	f	\N
3	moappel@gmail.com	mappel	pbkdf2:sha1:1000$upPhaly9$a8872ce8d1395a76e699e4f9b4fd9d3c9bb145db	f	\N
1	jyundt@gmail.com	jyundt	pbkdf2:sha1:1000$agVPuJ3U$d4128a34bc44e3e2f2d90b7809a951db388d837c	f	\N
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('admin_id_seq', 3, true);


--
-- Data for Name: admin_role; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY admin_role (id, admin_id, role_id) FROM stdin;
1	1	1
2	2	2
\.


--
-- Name: admin_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('admin_role_id_seq', 2, true);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY alembic_version (version_num) FROM stdin;
628b5fe65b72
\.


--
-- Data for Name: marshal; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY marshal (id, name) FROM stdin;
1	EJ Hubstenberger
2	Birk McGilvrey
3	Jacob Yundt
4	Josh Friedman
\.


--
-- Name: marshal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('marshal_id_seq', 4, true);


--
-- Data for Name: official; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY official (id, name) FROM stdin;
1	Doug Riegner
2	John Cotter
3	Kurt Kearcher
5	Nikki Berrian
\.


--
-- Name: official_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('official_id_seq', 5, true);


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY participant (id, racer_id, team_id, race_id, place, points, team_points, mar_points, mar_place, point_prime, dnf, dns, relegated, disqualified) FROM stdin;
70	62	\N	5	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	1	1	1	1	10	10	\N	\N	\N	\N	\N	\N	\N
39	37	9	3	8	1	1	\N	\N	\N	\N	\N	\N	\N
2	2	1	1	2	8	8	\N	\N	\N	\N	\N	\N	\N
40	38	11	3	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	18	7	3	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	2	1	3	7	6	\N	\N	t	\N	\N	\N	\N
42	39	10	3	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	4	2	1	4	5	5	\N	\N	\N	\N	\N	\N	\N
43	40	13	3	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	5	3	1	5	4	4	\N	\N	\N	\N	\N	\N	\N
6	6	4	1	6	\N	\N	\N	1	\N	\N	\N	\N	\N
44	41	8	3	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	7	1	1	7	2	2	\N	\N	\N	\N	\N	\N	\N
45	42	9	3	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	8	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N
9	9	1	1	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	10	2	1	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	\N	1	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	\N	1	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	13	2	1	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	43	1	3	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	2	1	14	\N	\N	2	2	\N	\N	\N	\N	\N
15	15	5	1	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	44	13	3	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	16	6	2	1	10	10	\N	\N	\N	\N	\N	\N	\N
71	63	\N	5	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	45	7	4	1	10	10	\N	\N	\N	\N	\N	\N	\N
72	64	\N	5	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	10	2	2	2	9	8	1	3	t	\N	\N	\N	\N
18	17	\N	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	65	2	5	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	18	7	2	4	5	5	\N	\N	\N	\N	\N	\N	\N
49	46	7	4	2	8	8	1	3	\N	\N	\N	\N	\N
20	19	8	2	5	4	4	\N	\N	\N	\N	\N	\N	\N
74	66	2	5	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	47	1	4	3	6	6	\N	\N	\N	\N	\N	\N	\N
21	20	8	2	6	3	3	3	1	\N	\N	\N	\N	\N
51	43	1	4	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	21	9	2	7	2	2	\N	\N	\N	\N	\N	\N	\N
23	22	10	2	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	23	7	2	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	4	2	2	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	67	\N	5	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	24	7	2	11	\N	\N	2	2	\N	\N	\N	\N	\N
27	25	9	2	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	26	\N	2	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	27	11	2	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	28	\N	2	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	29	7	2	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	68	2	5	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	30	12	3	1	10	10	\N	\N	\N	\N	\N	\N	\N
52	48	4	4	5	5	4	\N	\N	t	\N	\N	\N	\N
33	31	1	3	2	8	8	\N	\N	\N	\N	\N	\N	\N
34	32	\N	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	21	9	6	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	49	14	4	6	3	3	\N	\N	\N	\N	\N	\N	\N
35	33	13	3	4	6	5	\N	\N	t	\N	\N	\N	\N
36	34	13	3	5	4	4	\N	\N	\N	\N	\N	\N	\N
37	35	9	3	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	18	7	6	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	36	6	3	7	2	2	\N	\N	\N	\N	\N	\N	\N
94	77	14	6	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	50	7	4	7	2	2	3	1	\N	\N	\N	\N	\N
79	69	15	6	3	\N	\N	\N	1	\N	\N	\N	\N	\N
55	24	7	4	8	1	\N	\N	\N	\N	\N	\N	\N	\N
56	51	11	4	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	52	\N	4	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	25	9	4	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	12	\N	4	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	53	1	4	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	54	\N	4	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	55	14	4	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	52	14	5	1	\N	\N	\N	1	\N	\N	\N	\N	\N
64	56	2	5	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	57	\N	5	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	58	\N	5	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	59	2	5	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	60	2	5	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	61	\N	5	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	19	8	6	4	\N	\N	\N	3	\N	\N	\N	\N	\N
81	70	10	6	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	29	7	6	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	10	2	6	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	23	7	6	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	53	1	6	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	4	2	6	9	\N	\N	\N	2	\N	\N	\N	\N	\N
86	71	9	6	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	54	\N	6	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	72	10	6	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	73	8	6	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	74	\N	6	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	75	15	6	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	76	16	6	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	67	\N	6	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	78	6	7	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	34	13	7	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	36	6	7	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	79	17	7	3	\N	\N	\N	1	\N	\N	\N	\N	\N
99	80	9	7	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	81	1	7	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	43	1	7	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	82	13	7	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	83	15	7	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	42	1	7	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	38	1	7	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	84	13	7	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	7	1	8	2	\N	\N	\N	3	\N	\N	\N	\N	\N
108	50	7	8	1	\N	\N	\N	2	\N	\N	\N	\N	\N
113	52	14	8	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	85	14	8	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	55	14	8	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	48	14	8	5	\N	\N	\N	1	\N	\N	\N	\N	\N
114	86	7	8	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	59	2	8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	46	7	8	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	6	\N	8	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	5	3	8	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	2	1	8	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	87	2	8	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	27	1	8	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	88	\N	9	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	52	14	9	1	\N	\N	\N	1	\N	\N	\N	\N	\N
124	59	2	9	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	61	\N	9	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	87	2	9	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	57	\N	9	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	58	\N	9	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	60	2	9	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	5	3	9	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	89	\N	9	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	63	\N	9	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	90	\N	9	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	91	\N	9	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	92	14	9	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	68	2	9	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	93	2	9	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	56	2	9	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	5	3	13	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	21	9	10	1	\N	\N	\N	2	\N	\N	\N	\N	\N
140	39	10	10	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	4	2	10	3	\N	\N	\N	1	\N	\N	\N	\N	\N
142	24	7	10	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	60	2	13	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	94	10	10	5	\N	\N	\N	3	\N	\N	\N	\N	\N
144	18	7	10	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	19	8	10	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	16	6	10	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	95	2	10	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	53	1	10	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	70	10	10	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	72	10	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	10	2	10	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	22	10	10	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	77	14	10	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	75	15	10	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	96	1	10	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	54	\N	10	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	97	\N	10	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	98	16	10	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	20	8	10	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	36	6	11	1	\N	\N	\N	2	\N	\N	\N	\N	\N
161	78	6	11	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	38	1	11	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	99	13	11	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	89	\N	13	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	79	17	11	5	\N	\N	\N	1	\N	\N	\N	\N	\N
165	43	1	11	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	34	13	11	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	37	1	11	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	35	9	11	9	\N	\N	\N	3	\N	\N	\N	\N	\N
169	19	8	11	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	100	10	11	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	83	15	11	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	101	9	11	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	82	13	11	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	4	2	11	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	102	2	13	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	48	14	12	1	\N	\N	\N	1	\N	\N	\N	\N	\N
176	46	7	12	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	52	14	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	59	2	12	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	87	2	12	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	47	1	12	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	6	\N	12	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	88	\N	13	1	\N	\N	\N	1	\N	\N	\N	\N	\N
183	59	2	13	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	87	2	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	56	2	13	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	61	\N	13	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	64	\N	13	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	58	\N	13	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	93	2	13	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	103	\N	13	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	68	2	13	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	90	\N	13	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	104	2	13	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	105	2	13	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	106	2	13	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	71	9	14	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	69	15	14	1	\N	\N	\N	1	\N	\N	\N	\N	\N
201	24	7	14	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	16	6	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	18	7	14	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	19	8	14	5	\N	\N	\N	2	\N	\N	\N	\N	\N
205	53	1	14	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
206	70	10	14	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	23	7	14	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	21	9	14	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	54	\N	14	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	76	16	14	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	27	1	14	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	98	16	14	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	20	8	14	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	25	9	14	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	77	14	14	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	75	15	14	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	4	2	14	17	\N	\N	\N	3	\N	\N	\N	\N	\N
217	107	3	14	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	108	1	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	81	1	15	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	78	6	15	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	43	1	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	37	1	15	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	99	13	15	4	\N	\N	\N	2	\N	\N	\N	\N	\N
225	79	17	15	5	\N	\N	\N	1	\N	\N	\N	\N	\N
226	35	9	15	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	84	13	15	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	38	1	15	7	\N	\N	\N	3	\N	\N	\N	\N	\N
228	109	9	15	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	34	13	15	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	36	6	15	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	83	15	15	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	19	8	15	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	100	10	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	42	1	15	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	85	14	15	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	110	6	15	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	41	8	15	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	111	1	15	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	47	1	15	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	80	9	15	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	112	1	15	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	40	13	15	24	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	52	14	16	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	7	1	16	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	46	7	16	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	48	14	16	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	47	1	16	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
250	59	2	16	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
251	55	14	16	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	2	1	16	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	87	2	16	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	113	14	16	9	\N	\N	\N	1	\N	\N	\N	\N	\N
255	54	\N	16	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	114	2	16	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	25	9	16	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	115	14	16	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	77	14	16	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	61	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	49	14	16	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	50	7	16	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	60	2	16	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	88	\N	17	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	56	2	17	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	57	\N	17	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	59	2	17	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	116	\N	17	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	14	2	17	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	58	\N	17	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	117	\N	17	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	118	18	17	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	103	\N	17	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	119	2	17	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	60	2	17	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	68	2	17	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	120	\N	17	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	121	\N	17	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	122	3	17	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	18	7	18	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	21	9	18	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	39	10	18	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	6	\N	20	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	19	8	18	4	\N	\N	\N	1	\N	\N	\N	\N	\N
284	23	7	18	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	53	1	18	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	71	9	18	7	\N	\N	\N	2	\N	\N	\N	\N	\N
287	24	7	18	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	10	2	18	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	20	8	18	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	45	7	18	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	27	1	18	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	97	\N	18	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	54	\N	18	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	107	3	18	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	2	1	18	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	77	14	18	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	98	16	18	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	25	9	18	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	110	6	19	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	99	13	19	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	35	9	19	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	30	2	19	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	37	1	19	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	81	1	19	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	101	9	19	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	123	10	19	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	52	14	19	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
321	8	2	20	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	79	17	19	10	\N	\N	\N	1	\N	\N	\N	\N	\N
309	111	1	19	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	41	8	19	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	19	8	19	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	46	7	20	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	7	1	20	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	48	14	20	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	52	14	20	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	88	\N	20	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	59	2	20	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	95	2	20	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	124	7	20	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	125	1	20	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	60	2	20	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	53	1	20	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	87	2	20	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	25	9	20	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	129	\N	21	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	113	14	20	16	\N	\N	\N	2	\N	\N	\N	\N	\N
328	126	18	20	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	47	1	20	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	54	\N	20	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	76	16	20	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	77	14	20	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	50	7	20	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	49	14	20	23	\N	\N	\N	3	\N	\N	\N	\N	\N
335	88	\N	21	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	56	2	21	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	118	18	21	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	127	\N	21	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	59	2	21	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	130	\N	21	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	61	\N	21	6	\N	\N	\N	1	\N	\N	\N	\N	\N
341	60	2	21	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	128	\N	21	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	14	2	21	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	91	14	21	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	58	\N	21	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	93	2	21	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	65	2	21	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
350	131	\N	21	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	16	6	22	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	18	7	22	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	21	9	22	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	22	10	22	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	69	15	22	4	\N	\N	\N	1	\N	\N	\N	\N	\N
355	19	8	22	5	\N	\N	\N	2	\N	\N	\N	\N	\N
356	4	2	22	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	95	2	22	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	132	16	22	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	25	9	22	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	24	7	22	9	\N	\N	\N	3	\N	\N	\N	\N	\N
362	71	9	22	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	76	16	22	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	72	10	22	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	107	3	22	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	70	10	22	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	97	\N	22	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	20	8	22	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	75	15	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	98	16	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	120	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	43	1	23	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	84	13	23	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	79	17	23	2	\N	\N	\N	1	\N	\N	\N	\N	\N
375	101	9	23	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	111	1	23	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	31	1	23	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	40	13	23	6	\N	\N	\N	3	\N	\N	\N	\N	\N
379	81	1	23	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	78	6	23	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	37	1	23	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	99	13	23	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	109	9	23	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	112	1	23	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	42	1	23	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	52	14	23	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
447	53	1	26	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	82	13	23	16	\N	\N	\N	2	\N	\N	\N	\N	\N
388	47	1	23	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	85	14	23	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	7	1	23	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	70	10	23	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	30	2	23	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	46	7	24	1	\N	\N	\N	2	\N	\N	\N	\N	\N
394	52	14	24	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	88	\N	24	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	48	14	24	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	59	2	24	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
448	97	\N	26	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	113	14	24	6	\N	\N	\N	1	\N	\N	\N	\N	\N
399	124	7	24	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	6	\N	24	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	51	18	24	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
402	2	1	24	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	5	3	24	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	10	2	24	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	8	2	24	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	126	18	24	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	114	2	24	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	27	1	24	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	77	14	24	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	61	\N	24	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	55	14	24	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	133	\N	24	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
413	134	7	24	21	\N	\N	\N	3	\N	\N	\N	\N	\N
414	60	2	25	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	56	2	25	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	5	3	25	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	73	8	26	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	122	3	25	4	\N	\N	\N	1	\N	\N	\N	\N	\N
418	135	2	25	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
419	59	2	25	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
420	104	2	25	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
421	136	\N	25	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	14	2	25	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	90	\N	25	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	68	2	25	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
425	137	\N	25	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	131	\N	25	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	93	2	25	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	138	1	25	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	121	2	25	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
450	75	15	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	69	15	26	1	\N	\N	\N	2	\N	\N	\N	\N	\N
431	21	9	26	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
432	16	6	26	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	18	7	26	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	94	10	26	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
451	98	16	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	19	8	26	6	\N	\N	\N	1	\N	\N	\N	\N	\N
452	120	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	24	7	26	7	\N	\N	\N	3	\N	\N	\N	\N	\N
437	83	15	26	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	45	7	26	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
439	22	10	26	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
440	4	2	26	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
441	59	2	26	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
442	72	10	26	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
443	54	\N	26	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
444	76	16	26	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
445	25	9	26	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
446	71	9	26	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	139	16	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	77	14	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	106	2	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
456	105	2	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
457	140	16	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481	141	10	28	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
458	99	13	27	1	\N	\N	\N	1	\N	\N	\N	\N	\N
459	38	1	27	2	\N	\N	\N	2	\N	\N	\N	\N	\N
460	81	1	27	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
461	78	6	27	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
462	40	13	27	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	82	13	27	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	109	9	27	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	43	1	27	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	80	9	27	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	79	17	27	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
468	42	1	27	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
469	84	13	27	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
470	19	8	27	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	112	1	27	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
472	36	6	27	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	30	2	27	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
474	37	1	27	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	123	10	27	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
476	141	10	27	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
477	48	14	27	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
478	100	10	28	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
479	86	7	28	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
480	46	7	28	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
482	88	1	28	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
483	124	7	28	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
484	49	14	28	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
492	25	9	28	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
485	113	14	28	8	\N	\N	\N	1	\N	\N	\N	\N	\N
486	50	7	28	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	47	1	28	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	134	7	28	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	48	14	28	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	85	14	28	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
491	122	3	28	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
498	13	2	29	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	119	2	29	1	\N	\N	\N	1	\N	\N	\N	\N	\N
494	60	2	29	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
495	56	2	29	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
496	5	3	29	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
497	142	\N	29	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
499	116	19	29	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	131	20	29	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
502	68	2	29	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	59	2	29	9	\N	\N	\N	2	\N	\N	\N	\N	\N
503	89	\N	29	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
504	58	\N	29	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
505	90	\N	29	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
506	136	\N	29	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	143	\N	29	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
508	16	6	30	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	21	9	30	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	19	8	30	2	\N	\N	\N	1	\N	\N	\N	\N	\N
512	45	7	30	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	4	2	30	4	\N	\N	\N	3	\N	\N	\N	\N	\N
513	53	1	30	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	25	9	30	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	132	16	30	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	2	1	30	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	75	15	34	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	22	10	30	10	\N	\N	\N	2	\N	\N	\N	\N	\N
518	70	10	30	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	97	\N	30	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	27	1	30	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	71	9	30	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	54	\N	30	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	96	1	30	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	77	14	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	144	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	140	16	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	105	2	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	106	2	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	99	13	31	1	\N	\N	\N	1	\N	\N	\N	\N	\N
596	16	6	34	5	4	4	\N	\N	\N	\N	\N	\N	\N
530	84	13	31	2	\N	\N	\N	2	\N	\N	\N	\N	\N
531	81	1	31	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	80	9	31	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
533	36	6	31	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
534	78	6	31	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
535	34	13	31	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	101	9	31	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
537	52	14	31	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
538	19	8	31	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
539	38	1	31	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	46	7	31	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	109	9	31	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
542	112	1	31	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
543	7	1	31	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
544	145	\N	31	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	30	2	31	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
546	47	1	31	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	48	14	31	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	146	6	31	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
549	18	7	31	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
550	111	1	31	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	82	13	31	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
552	31	1	31	24	\N	\N	\N	3	\N	\N	\N	\N	\N
553	16	6	31	25	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	46	7	32	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
555	52	14	32	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
576	116	19	33	3	6	6	1	3	\N	\N	\N	\N	\N
556	7	1	32	3	\N	\N	\N	2	\N	\N	\N	\N	\N
557	48	14	32	4	\N	\N	\N	1	\N	\N	\N	\N	\N
558	147	\N	32	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	6	\N	32	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	50	7	32	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	56	2	32	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
562	59	2	32	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	85	14	32	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	8	2	32	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	91	14	32	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	114	2	32	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
567	25	9	32	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	124	7	32	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	87	2	32	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	148	\N	32	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	98	16	32	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
572	47	1	32	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
573	61	\N	32	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	29	7	34	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
577	149	2	33	4	5	5	\N	\N	\N	\N	\N	\N	\N
597	53	1	34	6	3	3	\N	\N	\N	\N	\N	\N	\N
574	56	2	33	1	11	10	2	2	t	\N	\N	\N	\N
578	60	2	33	5	4	4	\N	\N	\N	\N	\N	\N	\N
575	61	\N	33	2	8	\N	3	1	\N	\N	\N	\N	\N
579	58	\N	33	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	20	8	34	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
580	93	2	33	7	2	\N	\N	\N	\N	\N	\N	\N	\N
581	63	\N	33	8	1	\N	\N	\N	\N	\N	\N	\N	\N
582	135	2	33	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
583	57	\N	33	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
584	104	2	33	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
585	103	\N	33	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
586	131	20	33	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
587	121	2	33	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
588	136	\N	33	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
589	89	\N	33	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
590	150	2	33	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	151	\N	33	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	10	2	34	7	2	2	\N	\N	\N	\N	\N	\N	\N
592	21	9	34	1	10	10	\N	\N	\N	\N	\N	\N	\N
613	72	10	34	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	98	16	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	95	2	34	8	1	1	\N	\N	\N	\N	\N	\N	\N
593	19	8	34	2	8	8	3	1	\N	\N	\N	\N	\N
615	106	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
616	140	16	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
594	18	7	34	3	6	6	\N	\N	\N	\N	\N	\N	\N
600	69	9	34	9	\N	\N	2	2	\N	\N	\N	\N	\N
601	54	\N	34	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
595	45	7	34	4	6	5	\N	\N	t	\N	\N	\N	\N
602	25	9	34	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
603	71	9	34	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	22	10	34	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	107	3	34	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
606	4	2	34	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	23	7	34	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	70	10	34	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	152	3	34	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	132	16	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	144	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	105	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
624	18	7	35	5	4	4	\N	\N	\N	\N	\N	\N	\N
622	30	2	35	3	6	6	\N	\N	\N	\N	\N	\N	\N
620	78	6	35	1	10	10	\N	\N	\N	\N	\N	\N	\N
621	43	1	35	2	8	8	\N	\N	\N	\N	\N	\N	\N
628	40	13	35	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
626	16	6	35	7	2	2	\N	\N	\N	\N	\N	\N	\N
623	99	13	35	4	5	5	\N	\N	\N	\N	\N	\N	\N
625	101	9	35	6	3	3	\N	\N	\N	\N	\N	\N	\N
627	79	17	35	8	1	1	\N	\N	\N	\N	\N	\N	\N
629	84	13	35	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	31	1	35	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
631	111	1	35	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	153	21	35	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
633	154	20	35	14	\N	\N	2	2	\N	\N	\N	\N	\N
634	38	1	35	15	\N	\N	1	3	\N	\N	\N	\N	\N
635	146	6	35	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
636	19	8	35	17	1	\N	3	1	t	\N	\N	\N	\N
637	112	1	35	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	49	14	36	1	10	10	2	2	\N	\N	\N	\N	\N
640	46	7	36	3	6	6	\N	\N	\N	\N	\N	\N	\N
639	155	18	36	2	\N	\N	\N	3	\N	\N	\N	\N	\N
680	21	9	38	7	2	2	2	2	\N	\N	\N	\N	\N
641	47	1	36	4	5	5	\N	\N	\N	\N	\N	\N	\N
705	18	7	39	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	18	7	38	8	1	1	\N	\N	\N	\N	\N	\N	\N
642	50	7	36	5	5	4	\N	\N	t	\N	\N	\N	\N
706	20	8	39	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	7	1	36	6	3	3	\N	\N	\N	\N	\N	\N	\N
644	6	\N	36	7	2	\N	\N	\N	\N	\N	\N	\N	\N
682	19	8	38	9	\N	\N	1	3	\N	\N	\N	\N	\N
645	48	14	36	8	1	1	\N	\N	\N	\N	\N	\N	\N
646	88	1	36	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
707	70	10	39	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
647	113	14	36	10	\N	\N	3	1	\N	\N	\N	\N	\N
648	25	9	36	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	55	14	36	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	91	14	36	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	87	2	36	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	156	3	36	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	157	18	36	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
654	51	18	36	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
655	126	18	36	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
683	94	10	38	10	1	\N	\N	\N	t	\N	\N	\N	\N
684	53	1	38	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
656	88	1	37	1	10	10	3	1	\N	\N	\N	\N	\N
685	25	9	38	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
686	27	1	38	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	98	16	38	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	56	2	37	2	9	8	2	2	t	\N	\N	\N	\N
688	152	3	38	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	60	2	37	3	6	6	\N	\N	\N	\N	\N	\N	\N
689	10	2	38	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
659	59	2	37	4	5	5	\N	\N	\N	\N	\N	\N	\N
660	119	2	37	5	4	\N	\N	\N	\N	\N	\N	\N	\N
690	76	16	38	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	63	\N	37	6	3	\N	\N	\N	\N	\N	\N	\N	\N
662	158	\N	37	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	93	2	37	8	1	\N	\N	\N	\N	\N	\N	\N	\N
664	107	3	37	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
665	149	2	37	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	103	\N	37	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
667	89	\N	37	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
668	159	22	37	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	160	15	38	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
692	144	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	135	2	37	14	\N	\N	1	3	\N	\N	\N	\N	\N
670	104	2	37	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	91	14	37	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	138	1	37	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	68	2	37	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
674	83	15	38	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
708	31	1	39	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	45	7	38	2	8	8	\N	\N	\N	\N	\N	\N	\N
709	134	7	39	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
710	82	13	39	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
676	154	20	38	3	6	6	3	1	\N	\N	\N	\N	\N
693	36	6	39	1	11	10	3	1	t	\N	\N	\N	\N
677	70	10	38	4	5	5	\N	\N	\N	\N	\N	\N	\N
718	48	14	40	8	1	1	\N	\N	\N	\N	\N	\N	\N
678	23	7	38	5	4	4	\N	\N	\N	\N	\N	\N	\N
719	5	3	40	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	20	8	38	6	3	3	\N	\N	\N	\N	\N	\N	\N
694	40	13	39	2	8	8	1	3	\N	\N	\N	\N	\N
711	46	7	40	1	10	10	2	2	\N	\N	\N	\N	\N
720	51	18	40	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
695	111	1	39	3	6	6	2	2	\N	\N	\N	\N	\N
721	49	14	40	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
696	99	13	39	4	5	5	\N	\N	\N	\N	\N	\N	\N
712	86	7	40	2	8	8	1	3	\N	\N	\N	\N	\N
697	30	2	39	5	4	4	\N	\N	\N	\N	\N	\N	\N
722	71	9	40	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
698	43	1	39	6	3	3	\N	\N	\N	\N	\N	\N	\N
723	161	18	40	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
699	78	6	39	7	2	2	\N	\N	\N	\N	\N	\N	\N
724	85	14	40	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
713	52	14	40	3	7	6	3	1	t	\N	\N	\N	\N
700	21	9	39	8	1	1	\N	\N	\N	\N	\N	\N	\N
701	79	17	39	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
702	19	8	39	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
703	16	6	39	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
704	101	9	39	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	162	14	40	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
714	88	1	40	4	5	5	\N	\N	\N	\N	\N	\N	\N
726	124	7	40	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
715	47	1	40	5	4	4	\N	\N	\N	\N	\N	\N	\N
749	4	2	42	5	4	4	3	1	\N	\N	\N	\N	\N
716	13	2	40	6	3	3	\N	\N	\N	\N	\N	\N	\N
740	122	3	41	14	\N	\N	\N	2	\N	\N	\N	\N	\N
717	7	1	40	7	2	2	\N	\N	\N	\N	\N	\N	\N
727	56	2	41	1	11	10	\N	\N	t	\N	\N	\N	\N
741	166	2	41	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
733	150	2	41	7	2	2	3	1	\N	\N	\N	\N	\N
728	61	\N	41	2	8	\N	\N	\N	\N	\N	\N	\N	\N
729	53	1	41	3	6	6	\N	\N	\N	\N	\N	\N	\N
742	59	2	41	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
730	63	\N	41	4	5	\N	\N	\N	\N	\N	\N	\N	\N
731	163	\N	41	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	164	\N	41	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	14	2	41	8	1	1	\N	\N	\N	\N	\N	\N	\N
735	103	\N	41	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
736	92	14	41	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
737	121	2	41	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
738	165	\N	41	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
739	135	2	41	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
743	60	2	41	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
744	136	\N	41	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
750	10	2	42	6	3	3	\N	\N	\N	\N	\N	\N	\N
746	16	6	42	2	8	8	\N	\N	\N	\N	\N	\N	\N
745	21	9	42	1	10	10	1	3	\N	\N	\N	\N	\N
747	18	7	42	3	6	6	\N	\N	\N	\N	\N	\N	\N
748	94	10	42	4	6	5	\N	\N	t	\N	\N	\N	\N
751	24	7	42	7	2	2	2	2	\N	\N	\N	\N	\N
752	167	10	42	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
753	53	1	42	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
754	70	10	42	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
755	29	7	42	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
756	71	9	42	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
757	95	2	42	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
758	54	\N	42	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	96	1	42	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
760	107	3	42	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
761	168	\N	42	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	132	16	43	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
763	27	1	43	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
764	167	10	43	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	98	16	43	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
766	140	16	43	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
767	169	\N	43	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	77	14	43	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	170	\N	43	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	105	2	43	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	171	\N	43	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
772	108	1	43	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	2	1	45	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
773	78	6	44	1	10	10	\N	\N	\N	\N	\N	\N	\N
824	19	8	47	6	3	3	3	1	\N	\N	\N	\N	\N
774	30	2	44	2	8	8	\N	\N	\N	\N	\N	\N	\N
801	5	3	46	1	10	10	\N	\N	\N	\N	\N	\N	\N
775	43	1	44	3	7	6	\N	\N	\N	\N	\N	\N	\N
802	158	\N	46	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
803	174	\N	46	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
776	110	6	44	4	5	5	2	2	\N	\N	\N	\N	\N
862	56	2	49	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	52	14	49	2	8	8	\N	\N	\N	\N	\N	\N	\N
804	60	2	46	4	5	5	\N	\N	\N	\N	\N	\N	\N
777	99	13	44	5	4	4	1	3	\N	\N	\N	\N	\N
805	156	3	46	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
778	40	13	44	6	3	3	\N	\N	\N	\N	\N	\N	\N
825	45	7	47	7	2	2	\N	\N	\N	\N	\N	\N	\N
779	111	1	44	7	2	2	\N	\N	\N	\N	\N	\N	\N
841	154	20	48	9	\N	\N	1	3	\N	\N	\N	\N	\N
826	23	7	47	8	1	\N	\N	\N	\N	\N	\N	\N	\N
780	79	17	44	8	1	1	\N	\N	\N	\N	\N	\N	\N
781	112	1	44	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	82	13	44	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
806	116	19	46	6	3	3	1	3	\N	\N	\N	\N	\N
783	38	1	44	11	\N	\N	3	1	\N	\N	\N	\N	\N
784	172	6	44	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
807	93	2	46	7	2	2	\N	\N	\N	\N	\N	\N	\N
842	40	13	48	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
785	46	7	45	1	11	10	3	1	t	\N	\N	\N	\N
827	154	20	47	9	\N	\N	2	2	\N	\N	\N	\N	\N
808	59	2	46	8	1	1	\N	\N	\N	\N	\N	\N	\N
786	88	1	45	2	8	8	\N	\N	\N	\N	\N	\N	\N
809	103	\N	46	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
810	135	2	46	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
787	48	14	45	3	6	6	2	2	\N	\N	\N	\N	\N
828	70	10	47	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	150	2	46	11	\N	\N	3	1	\N	\N	\N	\N	\N
788	52	14	45	4	5	5	1	3	\N	\N	\N	\N	\N
812	131	20	46	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
789	47	1	45	5	4	4	\N	\N	\N	\N	\N	\N	\N
790	124	7	45	6	3	3	\N	\N	\N	\N	\N	\N	\N
813	56	2	46	13	\N	\N	\N	2	\N	\N	\N	\N	\N
791	100	10	45	7	2	2	\N	\N	\N	\N	\N	\N	\N
814	90	\N	46	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
792	56	2	45	8	1	1	\N	\N	\N	\N	\N	\N	\N
793	122	3	45	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
794	4	2	45	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
795	13	2	45	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	173	\N	45	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	7	1	45	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
798	14	2	45	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	85	14	45	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	65	2	46	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
816	149	2	46	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
817	170	\N	46	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	83	15	47	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	27	1	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
818	165	\N	46	18	1	\N	\N	\N	t	\N	\N	\N	\N
831	75	15	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
832	98	16	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
819	24	7	47	1	10	10	\N	\N	\N	\N	\N	\N	\N
843	52	14	48	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
820	16	6	47	2	9	8	\N	\N	t	\N	\N	\N	\N
833	30	2	48	1	10	10	\N	\N	\N	\N	\N	\N	\N
821	21	9	47	3	6	6	\N	\N	\N	\N	\N	\N	\N
844	110	6	48	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	18	7	47	4	5	5	\N	\N	\N	\N	\N	\N	\N
834	43	1	48	2	8	8	\N	\N	\N	\N	\N	\N	\N
823	26	23	47	5	4	4	\N	\N	\N	\N	\N	\N	\N
845	112	1	48	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
846	44	13	48	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
835	99	13	48	3	6	6	3	1	\N	\N	\N	\N	\N
858	124	7	49	6	3	3	\N	\N	\N	\N	\N	\N	\N
836	78	6	48	4	5	5	\N	\N	\N	\N	\N	\N	\N
847	19	8	48	15	\N	\N	2	2	\N	\N	\N	\N	\N
848	31	1	48	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
837	36	6	48	5	5	4	\N	\N	t	\N	\N	\N	\N
838	175	\N	48	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	146	6	48	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
839	109	9	48	7	2	2	\N	\N	\N	\N	\N	\N	\N
850	48	14	48	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	111	1	48	8	1	1	\N	\N	\N	\N	\N	\N	\N
851	176	13	48	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
852	16	6	48	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	48	14	49	3	6	6	\N	\N	\N	\N	\N	\N	\N
853	46	7	49	1	11	10	\N	\N	t	\N	\N	\N	\N
863	55	14	49	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
859	47	1	49	7	2	2	\N	\N	\N	\N	\N	\N	\N
856	88	1	49	4	5	5	\N	\N	\N	\N	\N	\N	\N
864	2	1	49	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
860	51	18	49	8	1	1	\N	\N	\N	\N	\N	\N	\N
857	85	14	49	5	4	4	2	2	\N	\N	\N	\N	\N
861	95	2	49	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	91	14	49	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
868	87	2	49	16	\N	\N	3	1	\N	\N	\N	\N	\N
869	126	18	49	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
866	161	18	49	14	\N	\N	1	3	\N	\N	\N	\N	\N
867	114	2	49	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
870	19	8	51	1	10	10	2	2	\N	\N	\N	\N	\N
871	18	7	51	2	8	8	\N	\N	\N	\N	\N	\N	\N
872	16	6	51	3	6	6	\N	\N	\N	\N	\N	\N	\N
873	21	9	51	4	5	5	\N	\N	\N	\N	\N	\N	\N
874	94	10	51	5	4	4	\N	\N	\N	\N	\N	\N	\N
875	177	10	51	6	3	3	1	3	\N	\N	\N	\N	\N
876	45	7	51	7	2	2	\N	\N	\N	\N	\N	\N	\N
877	4	2	51	8	1	1	\N	\N	\N	\N	\N	\N	\N
878	70	10	51	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
879	71	9	51	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
880	98	16	51	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	39	10	51	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	26	23	51	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
883	20	8	51	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
923	85	14	53	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	24	7	51	15	\N	\N	3	1	\N	\N	\N	\N	\N
885	77	14	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
886	140	16	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	98	16	55	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
887	22	10	51	\N	1	\N	\N	\N	t	\N	\N	\N	\N
924	86	7	53	14	\N	\N	3	1	\N	\N	\N	\N	\N
960	77	14	55	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
888	99	13	52	1	11	10	2	2	t	\N	\N	\N	\N
925	51	18	53	15	\N	\N	2	2	\N	\N	\N	\N	\N
926	25	9	53	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
889	36	6	52	2	8	8	1	3	\N	\N	\N	\N	\N
927	8	2	53	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
890	40	13	52	3	6	6	\N	\N	\N	\N	\N	\N	\N
928	115	14	53	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	43	1	52	4	5	5	\N	\N	\N	\N	\N	\N	\N
929	91	14	53	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
892	78	6	52	5	4	4	\N	\N	\N	\N	\N	\N	\N
930	5	3	53	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
893	30	2	52	6	3	3	\N	\N	\N	\N	\N	\N	\N
961	139	7	55	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	156	3	54	1	\N	\N	\N	1	\N	\N	\N	\N	\N
894	37	1	52	7	2	2	\N	\N	\N	\N	\N	\N	\N
932	5	3	54	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
895	81	1	52	8	1	1	\N	\N	\N	\N	\N	\N	\N
896	79	17	52	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
897	172	6	52	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
898	18	7	52	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
899	19	8	52	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	178	\N	52	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	179	13	52	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
902	7	1	52	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
903	101	9	52	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
904	154	20	52	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
905	52	14	52	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
906	80	9	52	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
907	180	\N	52	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
908	70	10	52	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
909	109	9	52	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
910	110	6	52	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
933	61	\N	54	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	52	14	53	1	11	10	\N	\N	t	\N	\N	\N	\N
934	158	\N	54	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	88	1	53	2	8	8	\N	\N	\N	\N	\N	\N	\N
935	131	20	54	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	46	7	53	3	6	6	\N	\N	\N	\N	\N	\N	\N
936	93	2	54	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
914	48	14	53	4	5	5	\N	\N	\N	\N	\N	\N	\N
937	91	14	54	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
915	123	10	53	5	4	4	\N	\N	\N	\N	\N	\N	\N
938	150	2	54	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
916	56	2	53	6	3	3	\N	\N	\N	\N	\N	\N	\N
939	65	2	54	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
940	14	2	54	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
917	113	14	53	7	2	2	1	3	\N	\N	\N	\N	\N
941	77	14	54	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
918	47	1	53	8	1	1	\N	\N	\N	\N	\N	\N	\N
919	7	1	53	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
920	54	\N	53	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	49	14	53	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
922	100	10	53	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
942	170	\N	54	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	138	1	54	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
944	181	\N	54	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
945	60	2	54	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
946	16	6	55	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	178	\N	55	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
949	26	23	55	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	21	9	55	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
962	182	7	55	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	19	8	55	6	\N	\N	\N	1	\N	\N	\N	\N	\N
952	4	2	55	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
963	20	8	55	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
954	39	10	55	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
955	24	7	55	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
956	10	2	55	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
957	29	7	55	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
958	72	10	55	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	92	14	56	8	1	1	\N	\N	\N	\N	\N	\N	\N
964	165	\N	56	1	10	\N	\N	\N	\N	\N	\N	\N	\N
983	24	7	57	4	5	5	3	1	\N	\N	\N	\N	\N
965	157	18	56	2	8	8	\N	\N	\N	\N	\N	\N	\N
981	94	10	57	2	8	8	\N	\N	\N	\N	\N	\N	\N
966	158	\N	56	3	\N	\N	\N	2	\N	\N	\N	\N	\N
972	116	19	56	9	\N	\N	1	3	\N	\N	\N	\N	\N
973	136	\N	56	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	150	2	56	4	5	5	3	1	\N	\N	\N	\N	\N
974	184	\N	56	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
968	149	2	56	5	5	4	\N	\N	\N	\N	\N	\N	\N
969	183	\N	56	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	90	\N	56	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
970	53	1	56	7	2	2	\N	\N	\N	\N	\N	\N	\N
976	131	20	56	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
977	68	2	56	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
978	65	2	56	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	103	\N	56	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
988	20	8	57	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
980	21	9	57	1	10	10	\N	\N	\N	\N	\N	\N	\N
986	39	10	57	7	2	2	\N	\N	\N	\N	\N	\N	\N
984	16	6	57	5	5	4	\N	\N	t	\N	\N	\N	\N
982	4	2	57	3	6	6	1	3	\N	\N	\N	\N	\N
989	53	1	57	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
985	18	7	57	6	3	3	\N	\N	\N	\N	\N	\N	\N
987	71	9	57	8	1	1	\N	\N	\N	\N	\N	\N	\N
990	70	10	57	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	54	\N	57	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	19	8	57	13	\N	\N	2	2	\N	\N	\N	\N	\N
993	177	10	57	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
994	27	1	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	98	16	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
996	77	14	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	106	2	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
998	140	16	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	105	2	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1000	79	17	58	1	10	10	1	3	\N	\N	\N	\N	\N
1002	30	2	58	3	6	6	\N	\N	\N	\N	\N	\N	\N
1001	185	24	58	2	\N	\N	\N	2	\N	\N	\N	\N	\N
1003	43	1	58	4	5	5	\N	\N	\N	\N	\N	\N	\N
1004	110	6	58	5	4	4	\N	\N	\N	\N	\N	\N	\N
1068	106	2	61	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1047	116	19	60	3	6	6	1	3	\N	\N	\N	\N	\N
1005	99	13	58	6	4	3	\N	\N	t	\N	\N	\N	\N
1069	140	16	61	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	16	6	58	7	2	2	\N	\N	\N	\N	\N	\N	\N
1106	136	\N	64	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1007	172	6	58	8	1	1	\N	\N	\N	\N	\N	\N	\N
1008	123	10	58	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1009	100	10	58	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1010	18	7	58	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	101	9	58	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1012	19	8	58	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1013	52	14	58	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	186	6	58	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1015	48	14	58	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1016	10	2	58	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1017	187	6	58	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1018	154	20	58	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1019	37	1	58	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1020	31	1	58	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1048	59	2	60	4	5	5	3	1	\N	\N	\N	\N	\N
1081	49	14	63	1	11	10	3	1	t	\N	\N	\N	\N
1049	103	\N	60	5	4	\N	\N	\N	\N	\N	\N	\N	\N
1021	113	14	59	1	10	10	2	2	\N	\N	\N	\N	\N
1050	183	\N	60	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	88	1	59	2	8	8	\N	\N	\N	\N	\N	\N	\N
1023	52	14	59	3	6	6	\N	\N	\N	\N	\N	\N	\N
1051	136	\N	60	7	2	\N	\N	\N	\N	\N	\N	\N	\N
1024	7	1	59	4	5	5	\N	\N	\N	\N	\N	\N	\N
1052	90	\N	60	8	1	\N	\N	\N	\N	\N	\N	\N	\N
1025	46	7	59	5	4	4	\N	\N	\N	\N	\N	\N	\N
1053	121	2	60	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1026	48	14	59	6	3	3	\N	\N	\N	\N	\N	\N	\N
1070	38	1	62	1	10	10	3	1	\N	\N	\N	\N	\N
1027	47	1	59	7	2	2	\N	\N	\N	\N	\N	\N	\N
1054	165	\N	60	10	1	\N	\N	\N	t	\N	\N	\N	\N
1028	161	18	59	8	1	1	\N	\N	\N	\N	\N	\N	\N
1029	51	18	59	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1030	50	7	59	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	56	2	59	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1032	91	14	59	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1033	95	2	59	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1034	25	9	59	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1035	93	2	59	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036	114	2	59	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	13	2	59	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1038	14	2	59	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1039	77	14	59	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1090	113	14	63	10	\N	\N	2	2	\N	\N	\N	\N	\N
1082	52	14	63	2	8	8	\N	\N	\N	\N	\N	\N	\N
1055	94	10	61	1	10	10	\N	\N	\N	\N	\N	\N	\N
1040	49	14	59	20	1	\N	3	1	t	\N	\N	\N	\N
1041	55	14	59	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1042	126	18	59	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
1043	104	2	59	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
1071	30	2	62	2	8	8	\N	\N	\N	\N	\N	\N	\N
1044	87	2	59	24	\N	\N	1	3	\N	\N	\N	\N	\N
1045	60	2	60	1	10	10	\N	\N	\N	\N	\N	\N	\N
1091	85	14	63	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1056	24	7	61	2	9	8	2	2	t	\N	\N	\N	\N
1046	150	2	60	2	8	8	2	2	\N	\N	\N	\N	\N
1072	43	1	62	3	7	6	\N	\N	t	\N	\N	\N	\N
1083	88	1	63	3	6	6	\N	\N	\N	\N	\N	\N	\N
1057	4	2	61	3	6	6	\N	\N	\N	\N	\N	\N	\N
1073	36	6	62	4	5	5	\N	\N	\N	\N	\N	\N	\N
953	161	18	55	8	\N	\N	\N	\N	f	f	f	f	f
1058	21	9	61	4	5	5	\N	\N	\N	\N	\N	\N	\N
1059	18	7	61	5	4	4	\N	\N	\N	\N	\N	\N	\N
1092	56	2	63	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1074	112	1	62	5	4	4	\N	\N	\N	\N	\N	\N	\N
1084	48	14	63	4	5	5	\N	\N	\N	\N	\N	\N	\N
1060	177	10	61	6	3	3	1	3	\N	\N	\N	\N	\N
1061	45	7	61	7	2	2	\N	\N	\N	\N	\N	\N	\N
1075	111	1	62	6	3	\N	2	2	\N	\N	\N	\N	\N
1062	16	6	61	8	1	1	\N	\N	\N	\N	\N	\N	\N
1063	53	1	61	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1064	71	9	61	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1065	39	10	61	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1066	98	16	61	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1093	59	2	63	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1085	46	7	63	5	4	4	\N	\N	\N	\N	\N	\N	\N
1067	19	8	61	13	\N	\N	3	1	\N	\N	\N	\N	\N
1076	19	8	62	7	2	2	1	3	\N	\N	\N	\N	\N
1077	185	24	62	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	82	13	62	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1079	146	6	62	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1080	18	7	62	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1107	121	2	64	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1101	119	2	64	8	1	\N	3	1	\N	\N	\N	\N	\N
1097	116	19	64	4	6	5	1	3	t	\N	\N	\N	\N
1086	124	7	63	6	3	3	1	3	\N	\N	\N	\N	\N
1094	150	2	64	1	10	10	2	2	\N	\N	\N	\N	\N
1087	47	1	63	7	2	2	\N	\N	\N	\N	\N	\N	\N
1102	89	\N	64	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1088	100	10	63	8	1	1	\N	\N	\N	\N	\N	\N	\N
1089	7	1	63	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	60	2	64	2	8	8	\N	\N	\N	\N	\N	\N	\N
1098	131	20	64	5	4	4	\N	\N	\N	\N	\N	\N	\N
1096	5	3	64	3	6	6	\N	\N	\N	\N	\N	\N	\N
1103	165	\N	64	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1099	59	2	64	6	3	3	\N	\N	\N	\N	\N	\N	\N
1104	65	2	64	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1100	93	2	64	7	2	\N	\N	\N	\N	\N	\N	\N	\N
1105	103	\N	64	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1108	188	\N	64	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1109	63	\N	64	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1110	149	2	64	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	4	2	65	1	10	10	1	3	\N	\N	\N	\N	\N
1112	69	9	65	2	8	8	\N	\N	\N	\N	\N	\N	\N
1113	154	20	65	3	6	6	\N	\N	\N	\N	\N	\N	\N
1115	21	9	65	5	4	4	\N	\N	\N	\N	\N	\N	\N
1114	177	10	65	4	6	5	3	1	t	\N	\N	\N	\N
1116	18	7	65	6	3	3	\N	\N	\N	\N	\N	\N	\N
1117	94	10	65	7	2	2	\N	\N	\N	\N	\N	\N	\N
1118	10	2	65	8	1	1	\N	\N	\N	\N	\N	\N	\N
1119	16	6	65	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	70	10	65	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1121	23	7	65	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	71	9	65	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1123	39	10	65	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1206	25	9	69	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	49	14	67	8	2	1	3	1	t	\N	\N	\N	\N
1124	19	8	65	14	\N	\N	2	2	\N	\N	\N	\N	\N
1125	140	16	65	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1126	98	16	65	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	189	3	65	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1128	53	1	65	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	75	15	65	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	76	16	65	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	45	7	65	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1162	124	7	67	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1132	101	9	66	1	10	10	\N	\N	\N	\N	\N	\N	\N
1163	45	7	67	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1133	30	2	66	2	8	8	\N	\N	\N	\N	\N	\N	\N
1164	25	9	67	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1134	78	6	66	3	6	6	\N	\N	\N	\N	\N	\N	\N
1165	51	18	67	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1135	18	7	66	4	5	5	\N	\N	\N	\N	\N	\N	\N
1166	54	\N	67	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1167	55	14	67	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1136	38	1	66	5	4	4	1	3	\N	\N	\N	\N	\N
1168	2	1	67	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1137	80	9	66	6	3	3	\N	\N	\N	\N	\N	\N	\N
1169	152	3	67	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1138	43	1	66	7	3	2	\N	\N	t	\N	\N	\N	\N
1170	114	2	67	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1139	37	1	66	8	1	1	\N	\N	\N	\N	\N	\N	\N
1140	187	6	66	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	16	6	66	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1142	31	1	66	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	157	18	67	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	19	8	66	12	\N	\N	2	2	\N	\N	\N	\N	\N
1144	36	6	66	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	52	14	66	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	161	18	66	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	82	13	66	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1148	185	24	66	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	190	\N	67	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	154	20	66	18	\N	\N	3	1	\N	\N	\N	\N	\N
1150	186	6	66	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	112	1	66	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	4	2	66	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	146	6	66	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	47	1	67	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1174	126	18	67	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1154	88	1	67	1	10	10	2	2	\N	\N	\N	\N	\N
1175	77	14	67	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	138	1	67	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
1155	52	14	67	2	8	8	1	3	\N	\N	\N	\N	\N
1177	56	2	68	1	\N	\N	\N	3	\N	\N	\N	\N	\N
1156	46	7	67	3	6	6	\N	\N	\N	\N	\N	\N	\N
1193	69	9	69	2	8	8	\N	\N	\N	\N	\N	\N	\N
1157	86	7	67	4	5	5	\N	\N	\N	\N	\N	\N	\N
1178	59	2	68	2	8	8	\N	\N	\N	\N	\N	\N	\N
1158	155	18	67	5	4	4	\N	\N	\N	\N	\N	\N	\N
1207	76	16	69	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1159	7	1	67	6	3	3	\N	\N	\N	\N	\N	\N	\N
1208	54	\N	69	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1160	85	14	67	7	2	2	\N	\N	\N	\N	\N	\N	\N
1179	5	3	68	3	7	6	\N	\N	t	\N	\N	\N	\N
1180	156	3	68	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	191	\N	68	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	154	20	69	3	6	6	3	1	\N	\N	\N	\N	\N
1182	93	2	68	6	3	3	\N	\N	\N	\N	\N	\N	\N
1209	192	\N	69	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1183	63	\N	68	7	2	\N	\N	\N	\N	\N	\N	\N	\N
1184	165	\N	68	8	1	\N	\N	\N	\N	\N	\N	\N	\N
1185	136	\N	68	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1186	103	\N	68	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1195	20	8	69	4	5	5	\N	\N	\N	\N	\N	\N	\N
1187	138	1	68	11	\N	\N	2	2	\N	\N	\N	\N	\N
1188	104	2	68	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1210	39	10	69	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1189	150	2	68	13	\N	\N	3	1	\N	\N	\N	\N	\N
1190	149	2	68	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1191	107	3	68	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	24	7	69	5	4	4	\N	\N	\N	\N	\N	\N	\N
1211	75	15	69	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1192	177	10	69	1	10	10	1	3	\N	\N	\N	\N	\N
1212	98	16	69	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1197	16	6	69	6	4	3	\N	\N	t	\N	\N	\N	\N
1213	77	14	69	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	21	9	69	7	2	2	\N	\N	\N	\N	\N	\N	\N
1226	47	1	70	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1199	94	10	69	8	1	1	\N	\N	\N	\N	\N	\N	\N
1200	18	7	69	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1201	45	7	69	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1202	70	10	69	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1214	30	2	70	1	10	10	\N	\N	\N	\N	\N	\N	\N
1203	19	8	69	12	\N	\N	2	2	\N	\N	\N	\N	\N
1204	53	1	69	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1205	10	2	69	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1217	78	6	70	4	5	5	\N	\N	\N	\N	\N	\N	\N
1215	43	1	70	2	8	8	\N	\N	\N	\N	\N	\N	\N
1221	101	9	70	8	1	1	\N	\N	\N	\N	\N	\N	\N
1218	18	7	70	5	4	4	\N	\N	\N	\N	\N	\N	\N
1222	111	1	70	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1216	38	1	70	3	7	6	3	1	t	\N	\N	\N	\N
1219	79	17	70	6	3	3	\N	\N	\N	\N	\N	\N	\N
1227	52	14	70	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1223	19	8	70	10	\N	\N	2	2	\N	\N	\N	\N	\N
1220	99	13	70	7	2	2	1	3	\N	\N	\N	\N	\N
1224	31	1	70	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1225	82	13	70	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1228	154	20	70	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	185	24	70	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1230	20	8	70	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1231	146	6	70	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1232	187	6	70	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1233	112	1	70	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1234	52	14	71	1	10	10	\N	\N	\N	\N	\N	\N	\N
1235	48	14	71	2	8	8	\N	\N	\N	\N	\N	\N	\N
1236	88	1	71	3	6	6	\N	\N	\N	\N	\N	\N	\N
1237	7	1	71	4	5	5	\N	\N	\N	\N	\N	\N	\N
1238	155	18	71	5	4	4	\N	\N	\N	\N	\N	\N	\N
1239	50	7	71	6	3	3	\N	\N	\N	\N	\N	\N	\N
1240	124	7	71	7	2	2	\N	\N	\N	\N	\N	\N	\N
1241	56	2	71	8	1	1	\N	\N	\N	\N	\N	\N	\N
1242	54	\N	71	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1243	55	14	71	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1244	51	18	71	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1245	159	22	71	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1246	161	18	71	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1247	77	14	71	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1248	157	18	71	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1249	59	2	71	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1250	25	9	71	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1251	114	2	71	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1252	104	2	71	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1253	190	\N	71	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1310	16	6	74	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1254	87	2	71	21	\N	\N	2	2	\N	\N	\N	\N	\N
1255	115	14	71	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
1256	126	18	71	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
1257	2	1	71	24	\N	\N	\N	\N	\N	\N	\N	\N	\N
1311	80	9	74	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1286	4	2	73	7	2	2	1	3	\N	\N	\N	\N	\N
1258	47	1	71	25	1	\N	3	1	t	\N	\N	\N	\N
1259	27	1	71	26	\N	\N	\N	\N	\N	\N	\N	\N	\N
1312	52	14	74	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	113	14	71	27	\N	\N	1	3	\N	\N	\N	\N	\N
1287	24	7	73	8	1	1	\N	\N	\N	\N	\N	\N	\N
1313	109	9	74	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1261	150	2	72	1	10	10	3	1	\N	\N	\N	\N	\N
1288	154	20	73	9	\N	\N	3	1	\N	\N	\N	\N	\N
1262	107	3	72	2	8	8	\N	\N	\N	\N	\N	\N	\N
1289	98	16	73	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1314	48	14	74	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1263	59	2	72	3	6	6	2	2	\N	\N	\N	\N	\N
1290	177	10	73	11	\N	\N	2	2	\N	\N	\N	\N	\N
1264	60	2	72	4	5	5	\N	\N	\N	\N	\N	\N	\N
1291	70	10	73	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1292	95	2	73	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1265	116	19	72	5	4	4	1	3	\N	\N	\N	\N	\N
1266	193	\N	72	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
1293	39	10	73	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1267	63	\N	72	7	2	\N	\N	\N	\N	\N	\N	\N	\N
1268	191	\N	72	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1269	165	\N	72	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	131	20	72	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1271	164	\N	72	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1272	67	\N	72	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1294	132	16	73	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	136	\N	72	13	1	\N	\N	\N	t	\N	\N	\N	\N
1274	68	2	72	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1275	104	2	72	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1276	149	2	72	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	14	2	72	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1278	138	1	72	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	194	\N	72	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1295	71	9	73	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	16	6	73	1	10	10	\N	\N	\N	\N	\N	\N	\N
1296	10	2	73	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1281	21	9	73	2	8	8	\N	\N	\N	\N	\N	\N	\N
1297	29	7	73	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	18	7	73	3	6	6	\N	\N	\N	\N	\N	\N	\N
1298	75	15	73	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1283	94	10	73	4	5	5	\N	\N	\N	\N	\N	\N	\N
1299	106	2	73	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1284	45	7	73	5	5	4	\N	\N	t	\N	\N	\N	\N
1300	77	14	73	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1285	69	9	73	6	3	3	\N	\N	\N	\N	\N	\N	\N
1323	190	\N	75	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	91	14	75	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1301	99	13	74	1	10	10	3	1	\N	\N	\N	\N	\N
1315	86	7	75	1	10	10	3	1	\N	\N	\N	\N	\N
1325	85	14	75	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1302	36	6	74	2	8	8	1	3	\N	\N	\N	\N	\N
1326	54	\N	75	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1303	78	6	74	3	6	6	\N	\N	\N	\N	\N	\N	\N
1316	52	14	75	2	8	8	2	2	\N	\N	\N	\N	\N
1304	30	2	74	4	5	5	\N	\N	\N	\N	\N	\N	\N
1327	14	2	75	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1305	18	7	74	5	4	4	\N	\N	\N	\N	\N	\N	\N
1306	187	6	74	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
1317	100	10	75	3	6	6	\N	\N	\N	\N	\N	\N	\N
1307	79	17	74	7	2	2	\N	\N	\N	\N	\N	\N	\N
1328	157	18	75	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1308	101	9	74	8	1	1	\N	\N	\N	\N	\N	\N	\N
1309	83	15	74	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1318	56	2	75	4	5	5	\N	\N	\N	\N	\N	\N	\N
1329	159	22	75	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1330	114	2	75	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1319	48	14	75	5	5	4	\N	\N	t	\N	\N	\N	\N
1331	2	1	75	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	50	7	75	6	3	3	\N	\N	\N	\N	\N	\N	\N
1332	77	14	75	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1321	47	1	75	7	2	2	\N	\N	\N	\N	\N	\N	\N
1333	138	1	75	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	126	18	75	8	1	1	\N	\N	\N	\N	\N	\N	\N
1341	13	2	76	7	\N	\N	1	3	\N	\N	\N	\N	\N
1334	113	14	75	20	\N	\N	1	3	\N	\N	\N	\N	\N
1337	60	2	76	3	6	6	\N	\N	\N	\N	\N	\N	\N
1342	156	3	76	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	5	3	76	1	11	10	\N	\N	t	\N	\N	\N	\N
1338	150	2	76	4	5	5	\N	\N	\N	\N	\N	\N	\N
1336	59	2	76	2	8	8	\N	\N	\N	\N	\N	\N	\N
1343	183	\N	76	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1339	165	\N	76	5	4	\N	\N	\N	\N	\N	\N	\N	\N
1344	65	2	76	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1340	131	20	76	6	3	3	\N	\N	\N	\N	\N	\N	\N
1347	195	\N	76	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1348	90	\N	76	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1345	119	\N	76	11	\N	\N	2	2	\N	\N	\N	\N	\N
1346	181	\N	76	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1349	136	\N	76	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1350	104	2	76	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1351	21	9	77	1	10	10	\N	\N	\N	\N	\N	\N	\N
1353	45	7	77	3	6	6	\N	\N	\N	\N	\N	\N	\N
1352	16	6	77	2	9	8	\N	\N	t	\N	\N	\N	\N
1354	18	7	77	4	5	5	\N	\N	\N	\N	\N	\N	\N
1355	94	10	77	5	4	4	\N	\N	\N	\N	\N	\N	\N
1356	177	10	77	6	3	3	1	3	\N	\N	\N	\N	\N
1357	69	9	77	7	2	2	\N	\N	\N	\N	\N	\N	\N
1358	98	16	77	8	1	1	\N	\N	\N	\N	\N	\N	\N
1359	70	10	77	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1360	29	7	77	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1361	39	10	77	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1362	132	16	77	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1363	154	20	77	13	\N	\N	2	2	\N	\N	\N	\N	\N
1364	75	15	77	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1365	160	15	77	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1366	10	2	77	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1367	152	3	77	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1368	76	16	77	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1369	4	2	77	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1403	114	2	79	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1370	79	17	78	1	10	10	\N	\N	\N	\N	\N	\N	\N
1404	150	2	79	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1371	36	6	78	2	8	8	\N	\N	\N	\N	\N	\N	\N
1405	14	2	79	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1372	52	14	78	3	6	6	\N	\N	\N	\N	\N	\N	\N
1406	104	7	79	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1407	122	3	79	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1373	154	20	78	4	5	5	1	3	\N	\N	\N	\N	\N
1408	77	14	79	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1374	82	13	78	5	4	4	\N	\N	\N	\N	\N	\N	\N
1429	94	10	81	4	5	5	\N	\N	\N	\N	\N	\N	\N
1375	4	2	78	6	3	3	\N	\N	\N	\N	\N	\N	\N
1447	106	2	81	22	\N	\N	\N	\N	\N	\N	\N	\N	\N
1430	45	7	81	5	4	4	\N	\N	\N	\N	\N	\N	\N
1409	116	19	80	1	11	10	2	2	t	\N	\N	\N	\N
1376	38	1	78	7	2	2	3	1	\N	\N	\N	\N	\N
1410	61	\N	80	2	8	\N	\N	\N	\N	\N	\N	\N	\N
1377	19	8	78	8	1	1	2	2	\N	\N	\N	\N	\N
1378	30	2	78	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1448	105	2	81	23	\N	\N	\N	\N	\N	\N	\N	\N	\N
1379	43	1	78	10	1	\N	\N	\N	t	\N	\N	\N	\N
1380	83	15	78	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1381	187	6	78	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1382	78	6	78	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1383	101	9	78	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1384	18	7	78	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1385	48	14	78	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1386	80	9	78	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1387	16	6	78	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1388	20	8	78	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1462	36	6	82	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1411	119	2	80	3	6	6	3	1	\N	\N	\N	\N	\N
1431	19	8	81	6	3	3	2	2	\N	\N	\N	\N	\N
1389	48	14	79	1	11	10	1	3	t	\N	\N	\N	\N
1412	60	2	80	4	5	5	\N	\N	\N	\N	\N	\N	\N
1449	99	13	82	1	10	10	\N	\N	\N	\N	\N	\N	\N
1390	52	14	79	2	8	8	3	1	\N	\N	\N	\N	\N
1413	5	3	80	5	4	4	\N	\N	\N	\N	\N	\N	\N
1391	100	10	79	3	6	6	\N	\N	\N	\N	\N	\N	\N
1432	69	9	81	7	2	2	\N	\N	\N	\N	\N	\N	\N
1392	51	18	79	4	5	5	\N	\N	\N	\N	\N	\N	\N
1414	59	2	80	6	3	3	\N	\N	\N	\N	\N	\N	\N
1393	56	2	79	5	4	4	\N	\N	\N	\N	\N	\N	\N
1455	43	1	82	7	2	2	\N	\N	\N	\N	\N	\N	\N
1450	153	21	82	2	\N	\N	\N	2	\N	\N	\N	\N	\N
1415	131	20	80	7	2	2	\N	\N	\N	\N	\N	\N	\N
1394	113	14	79	6	3	3	2	2	\N	\N	\N	\N	\N
1395	141	10	79	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
1396	124	7	79	8	1	1	\N	\N	\N	\N	\N	\N	\N
1397	54	\N	79	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1398	196	\N	79	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1399	91	14	79	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1400	159	22	79	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1401	126	18	79	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1402	59	2	79	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1416	136	\N	80	8	1	\N	\N	\N	\N	\N	\N	\N	\N
1433	154	20	81	8	1	1	3	1	\N	\N	\N	\N	\N
1417	93	2	80	9	\N	\N	1	3	\N	\N	\N	\N	\N
1418	2	1	80	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1419	13	2	80	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1420	150	2	80	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1421	68	2	80	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1422	107	3	80	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1423	197	\N	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1424	198	\N	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1425	199	\N	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1463	187	6	82	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1426	16	6	81	1	10	10	\N	\N	\N	\N	\N	\N	\N
1434	177	10	81	9	\N	\N	1	3	\N	\N	\N	\N	\N
1427	21	9	81	2	8	8	\N	\N	\N	\N	\N	\N	\N
1435	4	2	81	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1428	18	7	81	3	7	6	\N	\N	t	\N	\N	\N	\N
1436	53	1	81	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1456	38	1	82	8	1	1	\N	\N	\N	\N	\N	\N	\N
1437	98	16	81	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1438	160	\N	81	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1439	23	7	81	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1440	10	2	81	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1441	200	\N	81	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1442	75	15	81	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1443	24	7	81	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1444	144	10	81	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1445	39	10	81	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1446	20	8	81	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1451	82	13	82	3	6	6	3	1	\N	\N	\N	\N	\N
1457	18	7	82	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1452	78	6	82	4	6	5	\N	\N	t	\N	\N	\N	\N
1458	111	1	82	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1453	30	2	82	5	4	4	\N	\N	\N	\N	\N	\N	\N
1469	52	14	83	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
1454	110	6	82	6	3	3	\N	\N	\N	\N	\N	\N	\N
1459	79	17	82	11	\N	\N	1	3	\N	\N	\N	\N	\N
1460	52	14	82	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1461	19	8	82	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1465	49	14	83	2	8	8	2	2	\N	\N	\N	\N	\N
1464	155	18	83	1	10	10	1	3	\N	\N	\N	\N	\N
1467	48	14	83	4	5	5	\N	\N	\N	\N	\N	\N	\N
1470	201	\N	83	7	\N	\N	\N	\N	\N	\N	\N	\N	\N
1466	88	1	83	3	6	6	\N	\N	\N	\N	\N	\N	\N
1468	113	14	83	5	5	4	3	1	t	\N	\N	\N	\N
1472	56	2	83	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1471	85	14	83	8	1	\N	\N	\N	\N	\N	\N	\N	\N
1473	59	2	83	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1474	87	2	83	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1475	27	1	83	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1476	77	14	83	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1478	150	2	84	2	8	8	\N	\N	\N	\N	\N	\N	\N
1477	165	\N	84	1	10	\N	\N	\N	\N	\N	\N	\N	\N
1479	59	2	84	3	6	6	\N	\N	\N	\N	\N	\N	\N
1480	13	2	84	4	\N	\N	\N	\N	\N	\N	\N	\N	\N
1482	116	19	84	6	3	3	\N	\N	\N	\N	\N	\N	\N
1481	60	2	84	5	4	\N	\N	\N	\N	\N	\N	\N	\N
1483	131	20	84	7	2	2	\N	\N	\N	\N	\N	\N	\N
1484	183	3	84	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1485	63	\N	84	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1526	80	9	86	8	1	1	\N	\N	\N	\N	\N	\N	\N
1486	5	3	84	10	1	\N	\N	\N	t	\N	\N	\N	\N
1487	103	\N	84	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1488	195	\N	84	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1489	181	\N	84	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1527	37	1	86	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1490	56	2	84	14	\N	\N	\N	2	\N	\N	\N	\N	\N
1491	68	2	84	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1492	166	2	84	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1493	93	2	84	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1494	136	\N	84	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1528	34	13	86	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1495	149	2	84	19	\N	\N	1	3	\N	\N	\N	\N	\N
1496	202	\N	84	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1497	203	2	84	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1529	10	2	86	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1530	20	8	86	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1498	177	10	85	1	11	10	3	1	t	\N	\N	\N	\N
1531	7	1	86	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1532	48	14	86	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1499	4	2	85	2	8	8	2	2	\N	\N	\N	\N	\N
1533	79	17	86	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1500	69	9	85	3	6	6	1	3	\N	\N	\N	\N	\N
1534	43	1	86	16	1	\N	\N	\N	t	\N	\N	\N	\N
1501	24	7	85	4	5	5	\N	\N	\N	\N	\N	\N	\N
1502	16	6	85	5	4	4	\N	\N	\N	\N	\N	\N	\N
1535	88	1	87	1	10	10	\N	\N	\N	\N	\N	\N	\N
1503	94	10	85	6	3	3	\N	\N	\N	\N	\N	\N	\N
1504	45	7	85	7	2	2	\N	\N	\N	\N	\N	\N	\N
1505	17	\N	85	8	\N	\N	\N	\N	\N	\N	\N	\N	\N
1506	23	7	85	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1507	76	16	85	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1508	10	2	85	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1509	53	1	85	12	\N	\N	\N	\N	\N	\N	\N	\N	\N
1510	75	15	85	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1511	202	\N	85	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1512	39	10	85	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1513	106	2	85	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1514	71	9	85	17	\N	\N	\N	\N	\N	\N	\N	\N	\N
1515	20	8	85	18	\N	\N	\N	\N	\N	\N	\N	\N	\N
1516	77	14	85	19	\N	\N	\N	\N	\N	\N	\N	\N	\N
1517	98	16	85	20	\N	\N	\N	\N	\N	\N	\N	\N	\N
1518	132	16	85	21	\N	\N	\N	\N	\N	\N	\N	\N	\N
1536	48	14	87	2	8	8	\N	\N	\N	\N	\N	\N	\N
1519	99	13	86	1	10	10	\N	\N	\N	\N	\N	\N	\N
1520	187	6	86	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
1521	78	6	86	3	6	6	\N	\N	\N	\N	\N	\N	\N
1522	52	14	86	4	5	5	\N	\N	\N	\N	\N	\N	\N
1537	155	18	87	3	6	6	1	3	\N	\N	\N	\N	\N
1523	30	2	86	5	4	4	\N	\N	\N	\N	\N	\N	\N
1524	35	9	86	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
1538	4	2	87	4	\N	\N	\N	2	\N	\N	\N	\N	\N
1525	101	9	86	7	2	2	2	2	\N	\N	\N	\N	\N
1539	49	14	87	5	4	4	\N	\N	\N	\N	\N	\N	\N
1540	56	2	87	6	3	3	\N	\N	\N	\N	\N	\N	\N
1541	2	1	87	7	2	2	\N	\N	\N	\N	\N	\N	\N
1542	51	18	87	8	1	1	\N	\N	\N	\N	\N	\N	\N
1543	113	14	87	9	\N	\N	\N	\N	\N	\N	\N	\N	\N
1544	114	2	87	10	\N	\N	\N	\N	\N	\N	\N	\N	\N
1545	100	10	87	11	\N	\N	\N	\N	\N	\N	\N	\N	\N
1546	85	14	87	12	1	\N	3	1	t	\N	\N	\N	\N
1547	91	14	87	13	\N	\N	\N	\N	\N	\N	\N	\N	\N
1548	126	18	87	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
1549	189	3	87	15	\N	\N	\N	\N	\N	\N	\N	\N	\N
1550	77	14	87	16	\N	\N	\N	\N	\N	\N	\N	\N	\N
1551	38	1	74	\N	\N	\N	2	2	f	f	f	f	f
1552	43	1	74	\N	\N	\N	\N	\N	t	f	f	f	t
1567	187	6	90	11	\N	\N	\N	\N	f	f	f	f	f
1557	38	1	90	1	\N	\N	\N	\N	f	f	f	f	f
1558	82	6	90	2	\N	\N	\N	2	f	f	f	f	f
1559	52	14	90	3	\N	\N	\N	\N	f	f	f	f	f
1560	180	\N	90	4	\N	\N	\N	\N	f	f	f	f	f
1562	37	1	90	6	\N	\N	\N	\N	f	f	f	f	f
1561	101	9	90	5	\N	\N	\N	\N	f	f	f	f	f
1563	206	13	90	7	\N	\N	\N	\N	f	f	f	f	f
1564	7	1	90	8	\N	\N	\N	\N	f	f	f	f	f
1565	147	\N	90	9	\N	\N	\N	\N	f	f	f	f	f
1566	79	17	90	10	\N	\N	\N	\N	f	f	f	f	f
1568	110	6	90	12	\N	\N	\N	\N	f	f	f	f	f
1569	207	13	90	13	\N	\N	\N	\N	f	f	f	f	f
1570	19	8	90	14	\N	\N	\N	\N	f	f	f	f	f
1571	4	2	90	15	\N	\N	\N	\N	f	f	f	f	f
1572	111	1	90	16	\N	\N	\N	\N	f	f	f	f	f
1573	48	14	90	17	\N	\N	\N	\N	f	f	f	f	f
1574	78	6	90	18	\N	\N	\N	\N	f	f	f	f	f
1575	112	1	90	19	\N	\N	\N	\N	f	f	f	f	f
1576	125	1	90	20	\N	\N	\N	\N	f	f	f	f	f
1577	114	14	90	21	\N	\N	\N	\N	f	f	f	f	f
1578	208	\N	90	22	\N	\N	\N	\N	f	f	f	f	f
1579	99	6	90	\N	\N	\N	\N	1	f	f	f	f	f
1581	209	1	91	2	\N	\N	\N	\N	f	f	f	f	f
1582	56	2	91	3	\N	\N	\N	\N	f	f	f	f	f
1583	48	14	91	4	\N	\N	\N	\N	f	f	f	f	f
1584	100	10	91	5	\N	\N	\N	\N	f	f	f	f	f
1585	208	\N	91	6	\N	\N	\N	\N	f	f	f	f	f
1586	91	14	91	7	\N	\N	\N	\N	f	f	f	f	f
1587	210	2	91	8	\N	\N	\N	\N	f	f	f	f	f
1588	211	\N	91	9	\N	\N	\N	\N	f	f	f	f	f
1589	59	2	91	10	\N	\N	\N	\N	f	f	f	f	f
1590	106	2	91	11	\N	\N	\N	\N	f	f	f	f	f
1591	136	\N	91	12	\N	\N	\N	\N	f	f	f	f	f
1592	2	1	91	13	\N	\N	\N	\N	f	f	f	f	f
1593	96	1	91	14	\N	\N	\N	\N	f	f	f	f	f
1594	93	2	91	15	\N	\N	\N	\N	f	f	f	f	f
1595	51	18	91	16	\N	\N	\N	\N	f	f	f	f	f
1596	114	14	91	17	\N	\N	\N	\N	f	f	f	f	f
1597	8	1	91	18	\N	\N	\N	\N	f	f	f	f	f
1598	55	14	91	19	\N	\N	\N	\N	f	f	f	f	f
1599	6	\N	91	20	\N	\N	\N	\N	f	f	f	f	f
1600	77	14	91	21	\N	\N	\N	\N	f	f	f	f	f
1601	115	1	91	22	\N	\N	\N	\N	f	f	f	f	f
1602	126	25	91	23	\N	\N	\N	\N	f	f	f	f	f
1603	60	10	91	24	\N	\N	\N	\N	f	f	f	f	f
1604	212	18	91	25	\N	\N	\N	\N	f	f	f	f	f
1605	27	1	91	26	\N	\N	\N	\N	f	f	f	f	f
1580	155	18	91	1	\N	\N	\N	1	f	f	f	f	f
1606	213	\N	92	1	\N	\N	\N	\N	f	f	f	f	f
1607	158	\N	92	2	\N	\N	\N	\N	f	f	f	f	f
1608	183	\N	92	3	\N	\N	\N	\N	f	f	f	f	f
1609	214	\N	92	4	\N	\N	\N	\N	f	f	f	f	f
1611	119	2	92	6	\N	\N	\N	\N	f	f	f	f	f
1612	215	\N	92	7	\N	\N	\N	\N	f	f	f	f	f
1613	216	26	92	8	\N	\N	\N	\N	f	f	f	f	f
1614	63	\N	92	9	\N	\N	\N	\N	f	f	f	f	f
1615	106	2	92	10	\N	\N	\N	\N	f	f	f	f	f
1616	217	\N	92	11	\N	\N	\N	\N	f	f	f	f	f
1610	164	\N	92	5	\N	\N	\N	1	f	f	f	f	f
1617	103	\N	92	\N	\N	\N	\N	\N	f	t	f	f	f
1618	16	6	93	1	\N	\N	\N	\N	f	f	f	f	f
1619	18	7	93	2	\N	\N	\N	\N	f	f	f	f	f
1621	21	9	93	4	\N	\N	\N	\N	f	f	f	f	f
1622	17	27	93	5	\N	\N	\N	\N	f	f	f	f	f
1623	53	1	93	6	\N	\N	\N	\N	f	f	f	f	f
1624	59	2	93	7	\N	\N	\N	\N	f	f	f	f	f
1625	10	2	93	8	\N	\N	\N	\N	f	f	f	f	f
1626	70	10	93	9	\N	\N	\N	\N	f	f	f	f	f
1627	202	18	93	10	\N	\N	\N	\N	f	f	f	f	f
1628	210	2	93	11	\N	\N	\N	\N	f	f	f	f	f
1629	71	9	93	12	\N	\N	\N	\N	f	f	f	f	f
1630	98	\N	93	13	\N	\N	\N	\N	f	f	f	f	f
1631	39	\N	93	14	\N	\N	\N	\N	f	f	f	f	f
1632	54	\N	93	15	\N	\N	\N	\N	f	f	f	f	f
1633	75	15	93	16	\N	\N	\N	\N	f	f	f	f	f
1620	19	8	93	3	\N	\N	\N	1	f	f	f	f	f
948	94	10	55	3	\N	\N	\N	\N	f	f	f	f	f
1635	99	6	94	2	\N	\N	\N	\N	f	f	f	f	f
1637	38	1	94	4	\N	\N	\N	\N	f	f	f	f	f
1638	80	9	94	5	\N	\N	\N	\N	f	f	f	f	f
1639	207	13	94	6	\N	\N	\N	\N	f	f	f	f	f
1640	18	7	94	7	\N	\N	\N	\N	f	f	f	f	f
1641	206	13	94	8	\N	\N	\N	\N	f	f	f	f	f
1642	46	28	94	9	\N	\N	\N	\N	f	f	f	f	f
1643	7	1	94	10	\N	\N	\N	\N	f	f	f	f	f
1644	209	1	94	11	\N	\N	\N	\N	f	f	f	f	f
1645	187	6	94	12	\N	\N	\N	\N	f	f	f	f	f
1646	111	28	94	13	\N	\N	\N	\N	f	f	f	f	f
1647	100	10	94	14	\N	\N	\N	\N	f	f	f	f	f
1648	179	13	94	15	\N	\N	\N	\N	f	f	f	f	f
1649	70	10	94	16	\N	\N	\N	\N	f	f	f	f	f
1650	30	2	94	17	\N	\N	\N	\N	f	f	f	f	f
1651	39	10	94	18	\N	\N	\N	\N	f	f	f	f	f
1652	48	14	94	19	\N	\N	\N	\N	f	f	f	f	f
1653	79	17	94	20	\N	\N	\N	\N	f	f	f	f	f
1636	52	14	94	3	\N	\N	\N	1	f	f	f	f	f
1634	180	\N	94	1	\N	\N	\N	2	f	f	f	f	f
1656	56	2	95	2	\N	\N	\N	\N	f	f	f	f	f
1657	60	10	95	3	\N	\N	\N	\N	f	f	f	f	f
1658	51	18	95	4	\N	\N	\N	\N	f	f	f	f	f
1659	91	14	95	5	\N	\N	\N	\N	f	f	f	f	f
1660	2	1	95	6	\N	\N	\N	\N	f	f	f	f	f
1661	48	14	95	7	\N	\N	\N	\N	f	f	f	f	f
1662	5	\N	95	8	\N	\N	\N	\N	f	f	f	f	f
1663	126	25	95	9	\N	\N	\N	\N	f	f	f	f	f
1664	93	29	95	10	\N	\N	\N	\N	f	f	f	f	f
1665	55	14	95	11	\N	\N	\N	\N	f	f	f	f	f
1666	219	\N	95	12	\N	\N	\N	\N	f	f	f	f	f
1667	157	18	95	13	\N	\N	\N	\N	f	f	f	f	f
1669	8	1	95	15	\N	\N	\N	\N	f	f	f	f	f
1670	191	\N	95	16	\N	\N	\N	\N	f	f	f	f	f
1671	148	29	95	17	\N	\N	\N	\N	f	f	f	f	f
1672	116	1	95	18	\N	\N	\N	\N	f	f	f	f	f
1673	210	29	95	19	\N	\N	\N	\N	f	f	f	f	f
1674	220	\N	95	20	\N	\N	\N	\N	f	f	f	f	f
1655	155	18	95	1	\N	\N	\N	2	f	f	f	f	f
1668	85	14	95	14	\N	\N	\N	3	f	f	f	f	f
1678	221	\N	96	1	\N	\N	\N	\N	f	f	f	f	f
1680	158	\N	96	3	\N	\N	\N	\N	f	f	f	f	f
1681	222	\N	96	4	\N	\N	\N	\N	f	f	f	f	f
1682	215	\N	96	5	\N	\N	\N	\N	f	f	f	f	f
1683	223	\N	96	6	\N	\N	\N	\N	f	f	f	f	f
1684	131	\N	96	7	\N	\N	\N	\N	f	f	f	f	f
1685	103	\N	96	8	\N	\N	\N	\N	f	f	f	f	f
1686	119	29	96	10	\N	\N	\N	\N	f	f	f	f	f
1687	155	26	96	11	\N	\N	\N	\N	f	f	f	f	f
1688	217	\N	96	12	\N	\N	\N	\N	f	f	f	f	f
1689	194	\N	96	13	\N	\N	\N	\N	f	f	f	f	f
1690	195	\N	96	14	\N	\N	\N	\N	f	f	f	f	f
1691	224	\N	96	15	\N	\N	\N	\N	f	f	f	f	f
1692	225	\N	96	16	\N	\N	\N	\N	f	f	f	f	f
1693	90	\N	96	17	\N	\N	\N	\N	f	f	f	f	f
1694	104	29	96	18	\N	\N	\N	\N	f	f	f	f	f
1679	213	2	96	2	\N	\N	\N	1	f	f	f	f	f
1696	69	9	97	2	\N	\N	\N	\N	f	f	f	f	f
1697	59	2	97	3	\N	\N	\N	\N	f	f	f	f	f
1698	70	10	97	4	\N	\N	\N	\N	f	f	f	f	f
1699	16	6	97	5	\N	\N	\N	\N	f	f	f	f	f
1701	98	\N	97	7	\N	\N	\N	\N	f	f	f	f	f
1702	226	9	97	8	\N	\N	\N	\N	f	f	f	f	f
1703	5	\N	97	9	\N	\N	\N	\N	f	f	f	f	f
1704	10	2	97	10	\N	\N	\N	\N	f	f	f	f	f
1705	210	29	97	11	\N	\N	\N	\N	f	f	f	f	f
1706	71	9	97	12	\N	\N	\N	\N	f	f	f	f	f
1700	21	9	97	6	\N	\N	\N	2	f	f	f	f	f
1654	19	8	94	\N	\N	\N	\N	3	f	t	f	f	f
1676	6	\N	95	\N	\N	\N	\N	1	f	t	f	f	f
1675	96	1	95	21	\N	\N	\N	\N	f	f	f	f	f
1707	75	15	97	13	\N	\N	\N	\N	f	f	f	f	f
1708	54	\N	97	14	\N	\N	\N	\N	f	f	f	f	f
1709	132	27	97	15	\N	\N	\N	\N	f	f	f	f	f
1710	76	\N	97	16	\N	\N	\N	\N	f	f	f	f	f
1711	39	10	97	17	\N	\N	\N	\N	f	f	f	f	f
1712	17	27	97	18	\N	\N	\N	\N	f	f	f	f	f
1695	19	8	97	1	\N	\N	\N	1	f	f	f	f	f
1713	115	\N	95	\N	\N	\N	\N	\N	f	t	f	f	f
\.


--
-- Name: participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('participant_id_seq', 1713, true);


--
-- Data for Name: prime; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY prime (id, participant_id, name) FROM stdin;
1	3	Point Prime
2	3	5 hr energy from Jack Neyer
3	14	$5 from Mark Powder
4	17	Point Prime
5	17	$5 from ?
6	20	$5 from ?
7	22	$5 from Tim Daigle
8	28	$5 from Tim Daigle
9	34	$5 from Official Kurt
10	35	Point Prime
11	40	$5 from Official Kurt
12	43	$5 from Official Kurt
13	51	3 x $5 from Official Kurt
14	52	Point Prime
15	54	3 x $5 from Official Kurt
16	54	2 x $5 from Official Kurt
17	63	$5 from Jeff Gernert
18	69	$5 from Chris Popovich
19	79	t-shirt from John McLaughlin
20	79	$5 from the Lovejoys
21	79	$5 from the Lovejoys
22	96	$5 from Kurt
23	109	$5 from Kurt
24	112	$5 from Kurt
25	123	socks from Aerotech
26	130	tshirt from tshirt fan
27	146	Pabst Bucket from Paul Carberry
28	158	socks from Aerotech
29	158	$10 from Major Taylor Cycling
30	158	$10 from Major Taylor Cycling
31	159	socks from Aerotech
32	163	$5 from Kurt
33	168	$5 from John Heffner
34	168	$5 from Kurt
35	175	$5 from Kurt
36	175	$5 from John Heffner
37	176	$5 from Kurt
38	180	$5 from Bryan
39	182	$20 coupon from LaPrima Espresso
40	200	LaPrima coffee card
41	211	$10 from Mikhail (Major Taylor Cycling)
42	212	$10 from Mikhail (Major Taylor Cycling)
43	224	$5 from Kurt
44	225	LaPrima Espresso 20% off card
45	232	$5 from Kurt
46	234	LaPrima Espresso 20% off card
47	249	$5 from Kurt
48	260	LaPrima Espresso 20% off card
49	260	$5 from Kurt
50	263	LaPrima Espresso 20% off card
51	264	poloshirt from Jeff Gernert
52	266	poloshirt from Jeff Gernert
53	291	$10 from Mikhail (Major Taylor Cycling)
54	308	LaPrima Espresso Race Entry
55	308	$5 from Kurt
56	311	$5 from Kurt
57	314	2 x $5 from Kurt
58	316	LaPrima Espresso race entry
59	322	$5 from Tim Daigle
60	329	$5 frmo Farran
61	358	2x$5 (womans prime) from Chrstine Lovejoy
62	359	$5 from Mikhail (Major Taylor Cycling)
63	363	$5 from Mikhail (Major Taylor Cycling)
64	372	$5 from Kurt
65	393	2 x $5 from Kurt
66	393	2 x $5 from Paul Carberry
67	416	$10 from Tim Daigle
68	416	$5 from Jeff Griffin and Melissa Hiller
69	417	$5 from Jeff Griffin and Melissa Hiller
70	461	Cool Springs TT entry from LaPrima Espresso
71	479	Cool Springs TT entry from LaPrima Espresso
72	481	Oreos
73	481	Brownies
74	481	Brownies
75	508	PBR stuff from Paul Carberry
76	529	$5 from John McLaughlin
77	531	$5 from Kurt
78	552	$5 from Kurt
79	556	$5 from Kurt
80	557	$5 from Paul Carberry
81	557	$5 from deBoer family
82	574	Point Prime
83	574	$5 from Frankie Ross
84	576	$5 from Paul Carberry
85	595	Point Prime
86	631	$5 from Kurt
87	633	$5 from Bryan Routledge
88	634	$5 from Bryan Routledge
89	636	Point Prime
90	636	$5 from Kurt
91	640	Prime from LaPrima Espresso
92	642	Point Prime
93	644	$5 from Tim Daigle
94	646	$5 from Kurt
95	657	Point Prime
96	683	Point Prime
97	693	Point Prime
98	695	$5 from Kurt
99	698	$5 from Matt Dolfi
100	701	Margie Bars from John McLaughlin
101	702	$5 from John McLaughlin
102	703	$5 from Chris Popovich
103	713	Point Prime
104	714	$5 from Tim Daigle
105	727	Point Prime
106	727	1 x$5
107	733	2 x$5
108	738	1 x$5
109	740	2 x$5
110	742	2 x$5
111	748	Point Prime
112	748	$5 from Jim
113	751	$5 from Jim
114	762	$25 from Fatheads
115	762	$5
116	764	$25 from Fatheads
117	785	Point Prime
118	785	$5 from Pat Clair
119	818	Point Prime
120	820	Point Prime
121	834	$5
122	835	Margie Bars from John McLaughlin
123	837	Point Prime
124	844	$5
125	845	cookie
126	847	socks
127	853	Point Prime
128	856	socks from Aerotech
129	856	$5 from Kurt
130	857	$5 from Kurt
131	870	$10 from Jim
132	887	Point Prime
133	888	Point Prime
134	911	Point Prime
135	966	Coffee Tree gift card from East End Cycling Club
136	984	Point Prime
137	985	Coffee Tree gift card from East End Cycling Club
138	994	(Womens only prime)Coffee Tree gift card from East End Cycling Club
139	1003	Wine from Rick Holzworth
140	1005	Point Prime
141	1012	$5 from Kurt
142	1018	$5 gift card from East End Cycling Club
143	1023	Wine from Rick Holzworth
144	1027	$5 from Kurt
145	1040	Point Prime
146	1041	$5 from Kurt
147	1047	Coffee Tree gift card from East End Cycling Club
148	1054	Point Prime
149	1056	Point Prime
150	1062	$5 from Mihkail
151	1067	Coffee Tree gift card from East End Cycling Club
152	1072	Point Prime
153	1075	VFuel Gel Sample Pack from LaPrima Espresso
154	1081	Point Prime
155	1081	$5 from Tim Daigle
156	1084	VFuel Gel Sample Pack from LaPrima Espresso
157	1097	Point Prime
158	1101	$5 from Tim Daigle
159	1114	Point Prime
160	1114	Polo shirt from Jeff Gernert
161	1114	$5 from Tim Daigle
162	1136	Margie Bars from John McLaughlin
163	1138	Point Prime
164	1141	$5 from Kurt
165	1143	V Fuel Gel from LaPrima Espresso
166	1144	Margie Bars from John McLaughlin
167	1149	$5 from Kurt
168	1154	V Fuel Gel from LaPrima Espresso
169	1154	$5 from Kurt
170	1156	Margie Bars from John McLaughlin
171	1158	Margie Bars from John McLaughlin
172	1160	$5 from Kurt
173	1161	Point Prime
174	1177	$1 from Tim Daigle
175	1177	$1 from Tim Daigle
176	1177	$5
177	1179	Point Prime
178	1179	$5
179	1181	$1 from Tim Daigle 
180	1187	$1 from Tim Daigle 
181	1190	$1 from Tim Daigle 
182	1190	$1 from Tim Daigle 
183	1192	$5 from Tim Daigle
184	1197	Point Prime
185	1216	Point Prime
186	1220	$5 from Kurt
187	1225	$5 from Kurt
188	1240	$5 from Kurt
189	1240	$5 from Kurt
190	1258	Point Prime
191	1261	$5 from Tim Daigle
192	1261	$5 from Pat Clair
193	1263	$5 from Tim Daigle
194	1273	Point Prime
195	1284	Point Prime
196	1286	six pack from JR Petsko
197	1287	$5 from Tim Daigle
198	1294	six pack from JR Petsko
199	1302	$5 from Kurt
200	1307	$5 from Jason Bair
201	1309	$5 from Kurt
202	1315	$5 from Pat Clair
203	1319	Point Prime
204	1321	$5 from Kurt
205	1335	Point Prime
206	1341	$5 from Jimn Sloan
207	1344	$5 from Jimn Sloan
208	1345	$5 from Jimn Sloan
209	1350	$5 from Jimn Sloan
210	1351	$5 from Tim Daigle
211	1352	Point Prime
212	1354	$5 from Tim Daigle
213	1356	$5 from Tim Daigle
214	1371	$5 from Kurt
215	1371	$5 from Bryan Routledge
216	1376	$5 from Bryan Routledge
217	1378	$5 from Kurt
218	1379	Point Prime
219	1384	$5 from Jason Hochreiter
220	1389	Point Prime
221	1390	$5 from Kurt
222	1392	$5 from Kurt
223	1409	Point Prime
224	1428	Point Prime
225	1428	$5 from Tim Daigle
226	1445	$5 from Drew Smorgul
227	1446	tshirt from Paul Carberry
228	1450	$5 from Kurt
229	1450	vfuel from LaPrima Espresso
230	1450	2 x Margie Bars from John McLaughlin
231	1451	vfuel from LaPrima Espresso
232	1451	$10 from Paul Carberry
233	1452	Point Prime
234	1459	$5 from Kurt
235	1462	vfuel from LaPrima Espresso
236	1465	2 x Margie Bars from John McLaughlin
237	1465	$10 from Paul Carberry
238	1467	$5 from Kurt
239	1467	vfuel from LaPrima Espresso
240	1468	Point Prime
241	1468	$5 from Kurt
242	1471	vfuel from LaPrima Espresso
243	1486	Point Prime
244	1489	$5 from Paul Carberry
245	1489	tshirt from Paul Carberry
246	1495	2 x $5 from Tim Daigle
247	1496	Cliff shots from Josh Friedman
248	1496	Cliff shots from Josh Friedman
249	1498	Point Prime
250	1498	Cliff shots from Josh Friedman
251	1498	Cliff shots from Josh Friedman
252	1506	$5 for 9th place from Jack Neyer
253	1512	Cliff shots from Josh Friedman
254	1517	tshirt from Paul Carberry
255	1517	$5 from Jack Neyer
256	1523	$5 from Kurt
257	1523	$5 from Mark Powder
258	1524	$5 from Kurt
259	1534	Point Prime
260	1538	$5 from Mark Powder
261	1538	Vfuel from LaPrima Espresso
262	1542	$5 from Kurt
263	1545	$5 from Kurt
264	1546	Point Prime
265	1552	Point Prime, but DQed
266	1561	$5 from Mark Powder
267	1558	$5 from Mark Powder
268	1582	$5 from Mark Powder
269	1583	$5 from Kurt
270	1606	hat from Fox Rothschild Law
271	1608	hat from Fox Rothschild Law
272	1608	$5 from Fox Rothschild Law
273	1617	$5 from Fox Rothschild Law
274	1619	$5 from Jim
275	1620	$5 from Jim
276	1618	$5 from Jim
277	1637	$5 frmo Kurt
278	1653	$5 from Kurt
279	1635	Hat from La Prima Espresso
281	1665	$5 from Kurt
282	1676	Hat from La Prima Espresso
283	1691	water bottle from Greta Daniels
284	1679	$5 from EJ Hubstenberger
285	1679	$3 from Jim
286	1709	$5 from Tim Daigle
287	1696	$5 from Tim Daigle
288	1709	Water Bottle from Greta Daniels
289	1713	$5 from Kurt
\.


--
-- Name: prime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('prime_id_seq', 289, true);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY race (id, date, class_id, duration, slow_lap, fast_lap, average_lap, weather, usac_permit, laps, starters) FROM stdin;
1	2014-08-26	1	\N	01:14:00	01:03:00	00:00:00	80 °F, hot	2014-1359	36	\N
2	2014-08-26	2	\N	01:25:00	01:03:00	01:14:00	80 °F, hot	2014-1359	40	\N
3	2014-08-27	3	\N	01:18:00	01:00:00	01:07:00	85 °F partly sunny, humid	2014-1360	45	\N
4	2014-08-27	4	\N	01:25:00	01:02:00	01:11:00	85 °F partly sunny, humid	2014-1360	40	\N
5	2015-04-14	1	\N	01:21:00	01:08:00	00:00:00	62 °F, cloudy	2015-617	28	\N
6	2015-04-14	2	\N	01:18:00	01:05:00	01:11:00	62 °F, cloudy	2015-617	25	\N
7	2015-04-15	3	\N	01:11:00	01:02:00	01:06:00	65 °F, sunny	2015-618	38	\N
8	2015-04-15	4	\N	01:26:00	01:05:00	01:13:00	65 °F, sunny	2015-618	35	\N
9	2015-04-21	1	\N	01:21:00	01:10:00	00:00:00	55 °F, cloudy, windy	2015-617	28	\N
10	2015-04-21	2	\N	01:19:00	01:10:00	00:00:00	55 °F, cloudy, windy	2015-617	35	\N
11	2015-04-22	3	\N	01:23:00	01:05:00	01:11:00	50 °F, cold, windy, wet	2015-618	36	\N
12	2015-04-22	4	\N	01:29:00	01:10:00	01:17:00	50 °F, cold, windy, wet	2015-618	31	\N
13	2015-04-28	1	\N	00:00:00	00:00:00	00:00:00	61 °F, sunny, breezy	2015-617	30	\N
14	2015-04-28	2	\N	00:00:00	00:00:00	00:00:00	61 °F, sunny, breezy	2015-617	40	\N
15	2015-04-29	3	\N	01:17:00	00:59:00	01:05:00	68 °F, mostly sunny	2015-618	40	\N
16	2015-04-29	4	\N	01:18:00	01:02:00	01:13:00	68 °F, mostly sunny	2015-618	35	\N
17	2015-05-05	1	\N	01:20:00	01:04:00	00:00:00	78 °F, sunny, breezy	2015-617	30	\N
18	2015-05-05	2	\N	01:17:00	00:00:59.65	00:00:00	78 °F, sunny, breezy	2015-617	40	\N
19	2015-05-06	3	\N	00:00:00	00:00:00	00:00:00	75 °F, mostly sunny	2015-618	40	\N
20	2015-05-06	4	\N	01:19:00	01:05:00	01:11:00	75 °F, mostly sunny	2015-618	35	\N
21	2015-05-12	1	\N	00:00:00	00:00:00	00:00:00	70 °F, sunny, windy	2015-617	32	\N
22	2015-05-12	2	\N	01:18:00	01:03:00	00:00:00	70 °F, sunny, windy	2015-617	42	\N
23	2015-05-13	3	\N	00:00:00	00:00:00	00:00:00	50 °F, cold, cloudy	2015-618	40	\N
24	2015-05-13	4	\N	01:22:00	01:02:00	01:14:00	50 °F, cold, cloudy	2015-618	35	\N
25	2015-05-19	1	\N	01:19:00	01:10:00	00:01:16.64	75 °F, sunny, windy	2015-617	32	\N
26	2015-05-19	2	\N	01:30:00	01:04:00	00:01:11.75	75 °F, sunny, windy	2015-617	44	\N
27	2015-05-20	3	\N	01:13:00	01:03:00	00:00:00	55 °F, cold, sunny	2015-618	37	\N
28	2015-05-20	4	\N	01:18:00	01:01:00	01:10:00	55 °F, cold, sunny	2015-618	32	\N
29	2015-05-26	1	\N	01:17:00	01:05:00	00:00:00	80 °F, sunny, breezy	2015-617	32	\N
30	2015-05-26	2	\N	01:19:00	01:03:00	00:00:00	80 °F, sunny, breezy	2015-617	45	\N
31	2015-05-27	3	\N	01:15:00	00:55:00	01:06:00	80 °F, hot, sunny	2015-618	45	\N
32	2015-05-27	4	\N	01:20:00	00:56:00	01:12:00	80 °F, hot, sunny	2015-618	40	\N
33	2015-06-02	1	\N	01:18:00	01:05:00	00:00:00	56 °F, cool, damp	2015-617	30	\N
34	2015-06-02	2	\N	01:16:00	01:03:00	00:01:10.73	56 °F, cool, damp	2015-617	46	\N
35	2015-06-03	3	\N	01:17:00	00:55:00	01:06:00	70 °F, cloudy and damp	2015-618	46	\N
36	2015-06-03	4	\N	01:15:00	01:05:00	01:09:00	70 °F, cloudy and damp	2015-618	40	\N
37	2015-06-09	1	\N	01:17:00	01:03:00	00:00:00	80 °F, warm, sunny	2015-617	32	\N
38	2015-06-09	2	\N	00:00:00	00:00:00	00:00:00	80 °F, warm, sunny	2015-617	48	\N
39	2015-06-10	3	\N	00:00:00	00:00:00	00:00:00	85 °F, hot and humid	2015-618	50	\N
40	2015-06-10	4	\N	01:17:00	01:03:00	00:01:10.1	85 °F, hot and humid	2015-618	40	\N
41	2015-06-16	1	\N	00:00:00	00:00:00	00:00:00	? °F	2015-617	24	\N
42	2015-06-16	2	\N	00:00:00	00:00:00	00:00:00	? °F	2015-617	38	\N
43	2015-06-16	5	\N	00:00:00	00:00:00	00:00:00	? °F	2015-617	23	\N
44	2015-06-17	3	\N	01:09:00	01:03:00	00:00:00	? °F 	2015-618	0	\N
45	2015-06-17	4	\N	01:15:00	01:04:00	00:00:00	? °F 	2015-618	38	\N
46	2015-06-23	1	\N	01:18:00	01:04:00	00:00:00	? °F	2015-617	33	\N
47	2015-06-23	2	\N	01:18:00	01:05:00	00:01:10.64	? °F	2015-617	50	\N
48	2015-06-24	3	\N	01:23:00	00:57:00	01:05:00	? °F, hot and humid	2015-618	55	\N
49	2015-06-24	4	\N	01:17:00	01:02:00	01:11:00	? °F, hot and humid	2015-618	45	\N
50	2015-06-30	1	\N	00:00:00	00:00:00	00:00:00	75 °F, rain, storms	2015-617	0	\N
51	2015-06-30	2	\N	01:09:00	01:02:00	00:00:00	75 °F, rain, storms	2015-617	17	\N
52	2015-07-01	3	\N	01:11:00	00:57:00	01:04:00	75 °F, sunny and nice	2015-618	35	\N
53	2015-07-01	4	\N	01:13:00	01:01:00	01:08:00	75 °F, sunny and nice	2015-618	25	\N
54	2015-07-01	1	\N	01:13:00	01:05:00	01:09:00	75 °F, sunny and nice	2015-618	15	\N
55	2015-07-01	2	\N	00:00:00	00:00:00	00:00:00	75 °F, sunny and nice	2015-618	20	\N
56	2015-07-07	1	\N	01:22:00	01:06:00	00:01:14.56	72 °F, cloudy, rain 	2015-617	32	\N
57	2015-07-07	2	\N	01:15:00	00:58:00	00:01:10.63	72 °F, cloudy, rain 	2015-617	46	\N
58	2015-07-08	3	\N	01:12:00	01:02:00	01:07:00	75 °F, cloudy, some rain	2015-618	50	\N
59	2015-07-08	4	\N	01:19:00	01:05:00	01:11:00	75 °F, cloudy, some rain	2015-618	40	\N
60	2015-07-14	1	\N	01:19:00	01:03:00	01:13:00	75 °F, cloudy, rainy, wet	2015-617	30	\N
61	2015-07-14	2	\N	01:18:00	01:04:00	00:01:10.76	75 °F, cloudy, rainy, wet	2015-617	50	\N
62	2015-07-15	3	\N	01:13:00	01:00:00	01:08:00	78 °F, sunny	2015-618	50	\N
63	2015-07-15	4	\N	01:11:00	01:05:00	00:01:07.23	78 °F, sunny	2015-618	40	\N
64	2015-07-21	1	\N	01:20:00	01:04:00	00:00:00	77 °F, clear and sunny	2015-617	30	\N
65	2015-07-21	2	\N	01:15:00	01:03:00	00:01:09.33	77 °F, clear and sunny	2015-617	45	\N
66	2015-07-22	3	\N	01:10:00	01:00:00	01:07:00	76 °F, sunny, nice	2015-618	55	\N
67	2015-07-22	4	\N	01:15:00	01:01:00	01:09:00	76 °F, sunny, nice	2015-618	45	\N
68	2015-07-28	1	\N	01:22:00	01:04:00	00:00:00	92 °F, hot and sunny	2015-617	0	\N
69	2015-07-28	2	\N	01:13:00	01:04:00	00:00:00	92 °F, hot and sunny	2015-617	45	\N
70	2015-07-29	3	\N	01:19:00	00:57:00	01:07:00	91 °F, sunny, hot, humid	2015-618	47	\N
71	2015-07-29	4	\N	01:22:00	01:05:00	01:11:00	91 °F, sunny, hot, humid	2015-618	40	\N
72	2015-08-04	1	\N	01:24:00	01:02:00	00:00:00	80 °F, warm and sunny	2015-617	32	\N
73	2015-08-04	2	\N	01:12:00	00:57:00	00:01:08.32	80 °F, warm and sunny	2015-617	46	\N
74	2015-08-05	3	\N	01:13:00	00:59:00	01:06:00	75 °F, sunny	2015-618	45	\N
75	2015-08-05	4	\N	01:17:00	00:56:00	01:10:00	75 °F, sunny	2015-618	40	\N
76	2015-08-11	1	\N	01:18:00	01:01:00	00:00:00	? °F	2015-617	30	\N
77	2015-08-11	2	\N	01:14:00	01:02:00	00:01:09.69	? °F	2015-617	42	\N
78	2015-08-12	3	\N	01:19:00	00:57:00	01:07:00	? °F	2015-618	42	\N
79	2015-08-12	4	\N	01:17:00	01:04:00	01:10:00	? °F	2015-618	37	\N
80	2015-08-18	1	\N	01:16:00	01:05:00	00:00:00	80 °F, warm and humid	2015-617	30	\N
81	2015-08-18	2	\N	01:17:00	01:02:00	00:00:00	80 °F, warm and humid	2015-617	40	\N
82	2015-08-19	3	\N	01:06:00	00:58:00	01:11:00	82 °F hot	2015-618	42	\N
83	2015-08-19	4	\N	01:15:00	01:04:00	01:08:00	82 °F hot	2015-618	35	\N
84	2015-08-25	1	\N	01:14:00	01:02:00	00:00:00	72 °F, overcast	2015-617	30	\N
85	2015-08-25	2	\N	01:16:00	00:59:00	00:01:08.16	72 °F, overcast	2015-617	42	\N
86	2015-08-26	3	\N	01:14:00	00:59:00	01:08:00	68 °F, cool, cloudy	2015-618	40	\N
87	2015-08-26	4	\N	01:13:00	01:03:00	01:10:00	68 °F, cool, cloudy	2015-618	35	\N
90	2016-04-13	3	\N	00:01:14	00:01:03	00:01:06	55 °F, cool	2016-746	36	32
91	2016-04-13	4	\N	00:01:15	00:01:05	00:01:09	55 °F, cool	2016-746	26	26
93	2016-04-12	2	\N	00:01:24	00:01:06	\N	50 °F, cool	2016-742	35	20
92	2016-04-12	1	\N	\N	\N	\N	50 °F, cool	2016-742	22	30
94	2016-04-20	3	\N	00:01:16	00:00:57	00:01:04	72 °F, warm	2016-746	38	33
95	2016-04-20	4	\N	00:01:18	00:01:07	00:01:11	72 °F, warm	2016-746	28	31
97	2016-04-19	2	\N	00:01:14	00:01:04	\N	70 °F, warm	2016-742	35	23
96	2016-04-19	1	\N	00:01:19	00:01:06	\N	70 °F, warm	2016-742	25	30
\.


--
-- Data for Name: race_class; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY race_class (id, name) FROM stdin;
1	C
2	Masters 40+/Women
3	A
4	B
5	Women
\.


--
-- Name: race_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('race_class_id_seq', 6, true);


--
-- Name: race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('race_id_seq', 97, true);


--
-- Data for Name: race_marshal; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY race_marshal (id, marshal_id, race_id) FROM stdin;
1	1	13
2	2	13
3	3	13
4	4	13
5	1	17
6	2	17
7	3	17
8	4	17
9	1	21
10	2	21
11	3	21
12	4	21
\.


--
-- Name: race_marshal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('race_marshal_id_seq', 13, true);


--
-- Data for Name: race_official; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY race_official (id, official_id, race_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	3	3
7	3	4
9	1	5
10	2	5
11	1	6
12	2	6
13	3	7
14	5	7
15	3	8
16	5	8
17	1	9
18	2	9
19	1	10
20	2	10
21	3	11
22	5	11
23	3	12
24	5	12
25	1	13
26	2	13
27	1	14
28	2	14
29	3	15
30	5	15
31	3	16
32	5	16
33	1	17
34	2	17
35	1	18
36	2	18
37	3	19
38	5	19
39	3	20
40	5	20
41	1	21
42	2	21
43	1	22
44	2	22
45	3	23
46	5	23
47	3	24
48	5	24
49	1	25
50	2	25
51	1	26
52	2	26
53	5	27
54	1	27
55	5	28
56	1	28
57	1	29
58	2	29
59	1	30
60	2	30
61	3	31
62	5	31
63	3	32
64	5	32
65	1	33
66	2	33
67	1	34
68	2	34
69	3	35
70	5	35
71	3	36
72	5	36
73	1	37
74	2	37
75	1	38
76	2	38
77	5	39
78	1	39
79	5	40
80	1	40
81	1	41
82	2	41
83	1	42
84	2	42
85	1	43
86	2	43
87	5	44
88	1	44
89	5	45
90	1	45
91	1	46
92	2	46
93	1	47
94	2	47
95	3	48
96	5	48
97	3	49
98	5	49
99	1	50
100	2	50
101	1	51
102	2	51
103	3	52
104	5	52
105	1	52
106	3	53
107	5	53
108	1	53
109	3	54
110	5	54
111	1	54
112	3	55
113	5	55
114	1	55
115	1	56
116	2	56
117	1	57
118	2	57
119	3	58
120	5	58
121	3	59
122	5	59
123	1	60
124	2	60
125	1	61
126	2	61
127	5	62
128	1	62
129	5	63
130	1	63
131	1	64
132	2	64
133	1	65
134	2	65
135	3	66
136	5	66
137	3	67
138	5	67
139	1	68
140	2	68
141	1	69
142	2	69
143	3	70
144	5	70
145	3	71
146	5	71
147	1	72
148	2	72
149	1	73
150	2	73
151	3	74
152	5	74
153	3	75
154	5	75
155	1	76
156	2	76
157	1	77
158	2	77
159	3	78
160	5	78
161	3	79
162	5	79
163	1	80
164	2	80
165	1	81
166	2	81
167	3	82
168	5	82
169	3	83
170	5	83
171	1	84
172	2	84
173	1	85
174	2	85
175	3	86
176	5	86
177	3	87
178	5	87
180	5	3
181	5	4
182	3	90
183	5	90
184	3	91
185	5	91
186	1	92
187	2	92
188	1	96
189	2	96
190	1	97
191	2	97
192	3	95
193	5	95
194	3	94
195	5	94
\.


--
-- Name: race_official_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('race_official_id_seq', 195, true);


--
-- Data for Name: racer; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY racer (id, name, usac_license, birthdate, current_team_id) FROM stdin;
1	Brandon Manns	\N	\N	\N
2	John McLaughlin	\N	\N	\N
3	Scott Diemert	\N	\N	\N
4	Chris Helbling	\N	\N	\N
5	Tim Daigle	\N	\N	\N
6	Matt Williams	\N	\N	\N
7	Matt Dolfi	\N	\N	\N
8	Matt Serechin	\N	\N	\N
9	Andreas Olshausen	\N	\N	\N
10	Ken Mowry	\N	\N	\N
11	Matt Braun	\N	\N	\N
12	Sean Jackson	\N	\N	\N
13	Patrick Beukema	\N	\N	\N
14	Adam Cohen	\N	\N	\N
15	Greg Akina	\N	\N	\N
17	Bob Gottlieb	\N	\N	\N
19	Frankie Ross	\N	\N	\N
20	Bryan Routledge	\N	\N	\N
21	Jason Zimmerman	\N	\N	\N
22	Jim Mock	\N	\N	\N
23	Skip Rogers	\N	\N	\N
24	Eric Hodos	\N	\N	\N
25	Jack Neyer	\N	\N	\N
26	Jim Doan	\N	\N	\N
27	Rachel Weaver	\N	\N	\N
28	Jay Williams	\N	\N	\N
29	Bill Ehler	\N	\N	\N
30	Dan Greene	\N	\N	\N
31	John Cotter	\N	\N	\N
32	Zachery Kovalcik	\N	\N	\N
33	Vinnie DePalma	\N	\N	\N
34	Steve Bedilion	\N	\N	\N
35	Stephen Smith	\N	\N	\N
37	Kyle Mihalik	\N	\N	\N
39	Devon Corboy	\N	\N	\N
40	Mike Appel	\N	\N	\N
41	Russ Dryer	\N	\N	\N
42	Dave Short	\N	\N	\N
43	Morgan Baker	\N	\N	\N
44	Mike Oltman	\N	\N	\N
45	Mike Quigley	\N	\N	\N
47	Marko Milojevic	\N	\N	\N
48	Mike Janeiro	\N	\N	\N
49	Rick Holzworth	\N	\N	\N
50	Christian Korey	\N	\N	\N
51	Jason Hochreiter	\N	\N	\N
53	Florian Lungu	\N	\N	\N
54	Ed Grystar	\N	\N	\N
55	Aaron Bovalino	\N	\N	\N
56	Josh Lewis	\N	\N	\N
57	Kurt Kearcher	\N	\N	\N
58	JD Day	\N	\N	\N
59	Al Meder	\N	\N	\N
60	George Pompura	\N	\N	\N
61	Matt Taylor	\N	\N	\N
62	Chris Cambell	\N	\N	\N
63	Roy Leonard	\N	\N	\N
64	Matt Bruhn	\N	\N	\N
65	Dennis Patton	\N	\N	\N
66	Grant Jackson	\N	\N	\N
67	Mark Runco	\N	\N	\N
68	Paul Carberry	\N	\N	\N
69	Jeff Griffin	\N	\N	\N
70	EJ Hubstenberger	\N	\N	\N
71	Jon Williams	\N	\N	\N
72	Jeff Gernert	\N	\N	\N
73	Jeff Huff	\N	\N	\N
74	Sean ?	\N	\N	\N
75	Melissa Hiller	\N	\N	\N
76	Jeff Paul	\N	\N	\N
77	Elise Rowe	\N	\N	\N
79	Josh Friedman	\N	\N	\N
81	Dave Friedman	\N	\N	\N
83	Jay Downs	\N	\N	\N
84	Michael Oltman	\N	\N	\N
85	Birk McGilvrey	\N	\N	\N
86	Ian Baun	\N	\N	\N
87	Hasan Baydoun	\N	\N	\N
88	Matt Brady	\N	\N	\N
89	Vince Pantloni	\N	\N	\N
90	James Knox	\N	\N	\N
91	Chris Yanakos	\N	\N	\N
92	Teddy Denman-Brice	\N	\N	\N
93	Drew Dorko	\N	\N	\N
94	JR Petsko	\N	\N	\N
95	Carl Lovejoy	\N	\N	\N
96	Brett Stana	\N	\N	\N
97	Greg Maier	\N	\N	\N
98	Shequaya Bailey	\N	\N	\N
100	Nathan Clair	\N	\N	\N
101	Jason Mount	\N	\N	\N
102	John Shepard	\N	\N	\N
103	Walt Impellicceiri	\N	\N	\N
104	Hy Simhan	\N	\N	\N
105	Heather Slater	\N	\N	\N
106	Colleen Grygier	\N	\N	\N
107	Fred Gohh	\N	\N	\N
108	Stacie Truszkowski	\N	\N	\N
109	Danny Wilson	\N	\N	\N
111	Jordan Villella	\N	\N	\N
112	Mike Mihalik	\N	\N	\N
113	Caleb Smith	\N	\N	\N
114	Hassan Beydoun	\N	\N	\N
115	Jeff Grimm	\N	\N	\N
116	Eric Burnett	\N	\N	\N
117	Fred Kliehm	\N	\N	\N
118	Joey Pershina	\N	\N	\N
119	Matt Guillon	\N	\N	\N
120	Kelly Haderlie	\N	\N	\N
121	Carl Hubel	\N	\N	\N
122	Caleb Wakely	\N	\N	\N
123	Shawn Geiger	\N	\N	\N
124	Xavier Szigethy	\N	\N	\N
125	Jeremy Holdorf	\N	\N	\N
126	Jason Bair	\N	\N	\N
127	Sam Carroll	\N	\N	\N
128	Dale Black	\N	\N	\N
129	Sebastian Scherer	\N	\N	\N
130	Dan Kyper	\N	\N	\N
131	Chris Butor	\N	\N	\N
132	Stephanie Swan	\N	\N	\N
133	Jacob McCrea	\N	\N	\N
134	Tom Senkevich	\N	\N	\N
135	Jon Shepard	\N	\N	\N
136	Matt Morehead	\N	\N	\N
137	Keith Dickerson	\N	\N	\N
138	Russell Boyd	\N	\N	\N
139	Erin Yanacek	\N	\N	\N
140	Megan Sybeldon	\N	\N	\N
141	Chas McFarland	\N	\N	\N
142	Alex Kovalik	\N	\N	\N
143	Ryan Moncheck	\N	\N	\N
144	Anna-Lena Kemper	\N	\N	\N
145	Scott Penzerella	\N	\N	\N
147	Jordan Snyder	\N	\N	\N
148	Mike Coumos	\N	\N	\N
149	Dave Roney	\N	\N	\N
150	Drew Smorul	\N	\N	\N
151	Ben Shutte	\N	\N	\N
152	Mark Bedel	\N	\N	\N
153	Andy Seitz	\N	\N	\N
154	Paul Carlson	\N	\N	\N
155	Tom Borner	\N	\N	\N
156	Andrew Reay	\N	\N	\N
157	Dan Rabe	\N	\N	\N
158	Isaac Samay	\N	\N	\N
159	Austin Bradley	\N	\N	\N
160	Ted McPherson	\N	\N	\N
161	Don Splitstone	\N	\N	\N
162	Gonzolo Escobar	\N	\N	\N
163	Elis Robinson	\N	\N	\N
164	Marcus McGuire	\N	\N	\N
165	Rich Shutte	\N	\N	\N
166	Hassan Baydoun	\N	\N	\N
167	Stephanie Lamb	\N	\N	\N
36	Steve Kurpiewski	\N	\N	6
78	Steve Cummings	\N	\N	6
110	Jared Babik	\N	\N	6
16	Mark Nicoll	\N	\N	6
99	John Heffner	\N	\N	6
80	Keith Hower	\N	\N	9
52	Dave Galati	\N	\N	14
18	Jeff Koontz	\N	\N	7
46	Willem deBoer	\N	\N	28
168	Don Dockerson	\N	\N	\N
169	Danielle Millet	\N	\N	\N
170	Nina Assimakopoules	\N	\N	\N
171	Jasmine Kemble	\N	\N	\N
172	John Rowley	\N	\N	\N
173	Jason Chari	\N	\N	\N
174	Andrey Rudemacher	\N	\N	\N
175	John Minturn	\N	\N	\N
177	Gunnar Shogren	\N	\N	\N
178	Eric McBride	\N	\N	\N
180	Mike Friedman	\N	\N	\N
181	Rob Wierzbowski	\N	\N	\N
182	Greg Ellis	\N	\N	\N
183	Dan Pellechio	\N	\N	\N
184	Ed Leonard	\N	\N	\N
185	Eric Lundgren	\N	\N	\N
186	Brett Rothmeyer	\N	\N	\N
188	Marcus Moore	\N	\N	\N
189	Maarten deBoer	\N	\N	\N
190	Todd Schoeni	\N	\N	\N
191	Jonathan Rafaeli	\N	\N	\N
192	Sarah Kovak	\N	\N	\N
193	Brian Haltenback	\N	\N	\N
194	Luke Gunnett	\N	\N	\N
195	Michael Sanders	\N	\N	\N
196	Kathleen Wulfkuhle	\N	\N	\N
197	Sam Hersick	\N	\N	\N
198	Creed Erdos	\N	\N	\N
199	Ben Keefer	\N	\N	\N
200	Gary Rodesta	\N	\N	\N
201	Mike Meehan	\N	\N	\N
202	Zack Wills	\N	\N	\N
203	Jon Leonard	\N	\N	\N
208	Aaron Shelmire	\N	\N	\N
209	Matt McKay	\N	\N	\N
210	Hayley Wickstrom	\N	\N	\N
211	Ryan Uber	\N	\N	\N
212	Daniel Rabe	\N	\N	\N
213	Matt Kitchen	\N	\N	\N
214	Gary Prunty	\N	\N	\N
215	Chris Henley	\N	\N	\N
216	Tom Bice	\N	\N	\N
217	Russ Manski	\N	\N	\N
219	Chris Taylor	\N	\N	\N
220	MIke Carroll	\N	\N	\N
221	Nate Manchin	\N	\N	\N
222	Ray Leonard	\N	\N	\N
223	Mark Perry	\N	\N	\N
224	Todd Diehl	\N	\N	\N
225	James Acklin	\N	\N	\N
226	Gray Patton	\N	\N	\N
187	Jake Lifson	\N	\N	6
146	Ed Krall	\N	\N	6
206	Jeremy Kirchin	\N	\N	13
207	Samson McHugh	\N	\N	13
179	Craig Merritts	\N	\N	13
176	Justin Kanter	\N	\N	13
82	Jacob Yundt	277281	1986-01-27	6
38	Shawn Litster	\N	\N	1
\.


--
-- Name: racer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('racer_id_seq', 226, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY role (id, name) FROM stdin;
1	superadmin
2	official
3	moderator
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('role_id_seq', 3, true);


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY team (id, name) FROM stdin;
1	NovaCare
2	East End Cycling Club
3	Team Citius
4	Pro Mountain Outfitters
5	CMU
6	GPOA
7	UPMC Cycling Performance
8	Sette Nove
9	Freddie Fu Cycling
10	Dynamic Physical Therapy
11	NuGo/Koeles
12	Iron City Bikes
13	CAT Racing
14	LaPrima Espresso
15	QCW Breakaway Bikes
16	Rare Diseases
17	Greenline Velo d/b/ Zipcar
18	Truefit Racing
19	VOLT Multisport
20	Top Gear Racing
21	Kelly Benefit Strategies Elite
22	Pitt
23	Bents Cycling
24	JBV Coaching
25	West Liberty Cycles
26	n+1 Cycling p/b BPU Financial
27	PMVC
28	Cyclus Sports
29	alleghenyVELO
\.


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('team_id_seq', 29, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: oval
--

COPY users (id, email, username, password_hash, confirmed, name) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oval
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: admin_email_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: admin_role_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY admin_role
    ADD CONSTRAINT admin_role_pkey PRIMARY KEY (id);


--
-- Name: admin_username_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_username_key UNIQUE (username);


--
-- Name: marshal_name_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY marshal
    ADD CONSTRAINT marshal_name_key UNIQUE (name);


--
-- Name: marshal_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY marshal
    ADD CONSTRAINT marshal_pkey PRIMARY KEY (id);


--
-- Name: official_name_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY official
    ADD CONSTRAINT official_name_key UNIQUE (name);


--
-- Name: official_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY official
    ADD CONSTRAINT official_pkey PRIMARY KEY (id);


--
-- Name: participant_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_pkey PRIMARY KEY (id);


--
-- Name: prime_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY prime
    ADD CONSTRAINT prime_pkey PRIMARY KEY (id);


--
-- Name: race_class_name_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY race_class
    ADD CONSTRAINT race_class_name_key UNIQUE (name);


--
-- Name: race_class_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY race_class
    ADD CONSTRAINT race_class_pkey PRIMARY KEY (id);


--
-- Name: race_marshal_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY race_marshal
    ADD CONSTRAINT race_marshal_pkey PRIMARY KEY (id);


--
-- Name: race_official_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY race_official
    ADD CONSTRAINT race_official_pkey PRIMARY KEY (id);


--
-- Name: race_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id);


--
-- Name: racer_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY racer
    ADD CONSTRAINT racer_pkey PRIMARY KEY (id);


--
-- Name: racer_usac_license_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY racer
    ADD CONSTRAINT racer_usac_license_key UNIQUE (usac_license);


--
-- Name: role_name_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: team_name_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_name_key UNIQUE (name);


--
-- Name: team_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: oval; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: admin_role_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY admin_role
    ADD CONSTRAINT admin_role_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES admin(id) ON DELETE CASCADE;


--
-- Name: admin_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY admin_role
    ADD CONSTRAINT admin_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- Name: participant_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_race_id_fkey FOREIGN KEY (race_id) REFERENCES race(id);


--
-- Name: participant_racer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_racer_id_fkey FOREIGN KEY (racer_id) REFERENCES racer(id);


--
-- Name: participant_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- Name: prime_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY prime
    ADD CONSTRAINT prime_participant_id_fkey FOREIGN KEY (participant_id) REFERENCES participant(id);


--
-- Name: race_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_class_id_fkey FOREIGN KEY (class_id) REFERENCES race_class(id);


--
-- Name: race_marshal_marshal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_marshal
    ADD CONSTRAINT race_marshal_marshal_id_fkey FOREIGN KEY (marshal_id) REFERENCES marshal(id);


--
-- Name: race_marshal_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_marshal
    ADD CONSTRAINT race_marshal_race_id_fkey FOREIGN KEY (race_id) REFERENCES race(id);


--
-- Name: race_official_official_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_official
    ADD CONSTRAINT race_official_official_id_fkey FOREIGN KEY (official_id) REFERENCES official(id);


--
-- Name: race_official_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY race_official
    ADD CONSTRAINT race_official_race_id_fkey FOREIGN KEY (race_id) REFERENCES race(id);


--
-- Name: racer_current_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oval
--

ALTER TABLE ONLY racer
    ADD CONSTRAINT racer_current_team_id_fkey FOREIGN KEY (current_team_id) REFERENCES team(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

