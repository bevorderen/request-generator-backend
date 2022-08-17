--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO request;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO request;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO request;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO request;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO request;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO request;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO request;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO request;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO request;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO request;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO request;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO request;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO request;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO request;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO request;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO request;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO request;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO request;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO request;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO request;

--
-- Name: order_order; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.order_order (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    certificate_owner_id bigint NOT NULL,
    stock_id bigint,
    request_data jsonb
);


ALTER TABLE public.order_order OWNER TO request;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO request;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: person_person; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.person_person (
    id bigint NOT NULL,
    last_name character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    phone character varying(50),
    snils character varying(50) NOT NULL,
    inn character varying(12),
    user_id integer NOT NULL
);


ALTER TABLE public.person_person OWNER TO request;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO request;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person_person.id;


--
-- Name: stock_stock; Type: TABLE; Schema: public; Owner: request
--

CREATE TABLE public.stock_stock (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    short_description text,
    price integer NOT NULL,
    discount integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.stock_stock OWNER TO request;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: request
--

CREATE SEQUENCE public.stock_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_stock_id_seq OWNER TO request;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: request
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock_stock.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: person_person id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.person_person ALTER COLUMN id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: stock_stock id; Type: DEFAULT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.stock_stock ALTER COLUMN id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add person	9	add_person
34	Can change person	9	change_person
35	Can delete person	9	delete_person
36	Can view person	9	view_person
37	Can add stock	10	add_stock
38	Can change stock	10	change_stock
39	Can delete stock	10	delete_stock
40	Can view stock	10	view_stock
41	Can add order	11	add_order
42	Can change order	11	change_order
43	Can delete order	11	delete_order
44	Can view order	11	view_order
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$joj6anGBjq93oan50HtmBQ$FDzC0davFPCwshTL7FbM7SfrYcmXNqbOJ1A9IG3W5S0=	2022-08-11 20:05:22.18217+07	t	admin			a@mail.ru	t	t	2022-08-11 19:00:05.728191+07
2	pbkdf2_sha256$320000$6teBoyoWMoOxuFtPxfns5k$DoVrlqq7D86h0tqgEm2Mj1O8I/3S4tJ/jFxuxMEH4/A=	\N	f	123456789	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:20:43.883358+07
4	pbkdf2_sha256$320000$9p6ZmqUo0u9bQu5XeDxklz$mZr1vIU716NmVyvUP1xdMqrVEF9ToHS5nu6ZvnXBIVE=	\N	f	jzkl	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:27:17.880715+07
5	pbkdf2_sha256$320000$3tSL9tpGxhiToVCnpIiTHi$PQydHhth0rGRp5nfTIQPjYac+pDRaLqBg94L5xA2h3Y=	\N	f	5ppd	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:28:25.70046+07
6	pbkdf2_sha256$320000$WrR7exfpE2VKH5N1VJHjkW$aWCKmkBAIF99nf76evR+i76sRb4M3m3hAUgG60EdBuI=	\N	f	8sxw	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:29:14.876701+07
7	pbkdf2_sha256$320000$tPt2L65JFxjP20e3JVxqNk$87iGRw4kBVagcoF0z7dKeBgiKS4p35s0F7Gf/UJtN1c=	\N	f	qi49	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:33:01.618435+07
8	pbkdf2_sha256$320000$lM8OX8MS9Vml7w4Se4Ot5g$ZCpcmxlMz3Zkz1JxZWvcTz1W2I41qLjlg/zPbjNfCGw=	\N	f	7hxy	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:33:50.287305+07
9	pbkdf2_sha256$320000$oXVcUqS1ryfWvqAQntlvPe$yO9gnrBf1Bl0WRJD2O+a1DRli8wGJrWY/QumciSY9RE=	\N	f	mgfh	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:36:47.562332+07
10	pbkdf2_sha256$320000$RcvPluuwgywb4rmBA4LkZC$BhQAjJeWx9ynj3LXPvjWFU3UKJYZc+K0ueIMWqCvO1o=	\N	f	rhwm	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:37:02.866765+07
11	pbkdf2_sha256$320000$S58HbUUh0iCavCsMS4EKtK$zkFNgWxK4hVUTS3prkPs/vDnrOHwpgW6OytntITCyuU=	\N	f	hjt1	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:37:05.200563+07
12	pbkdf2_sha256$320000$UrkcREGyxEkhCGTbqXjOjt$B+k3IWEZyTKNQiUyYmGpJNtYR+6zTh9IsKMk9zZyLBg=	\N	f	wabh	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:37:44.670612+07
13	pbkdf2_sha256$320000$eqQl6S66sOTQFpGhmGSSUl$tpz8fp0lwqF2QId6TbP23tzKfarWginP0tQbdgVyIDI=	2022-08-11 20:45:29.822756+07	f	2npz	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:42:46.213443+07
14	pbkdf2_sha256$320000$y1SUphB1SgnIv98kYqNocj$UBua2TD8LFz2ZhNAHhSEbgHzspJQEsRuBz7xGqvKLc8=	\N	f	3gpp	first_name	last_name	a@mail.ru	f	t	2022-08-11 20:45:32.510151+07
15	pbkdf2_sha256$320000$wYQT1Ixy3aL6ygZKMNxmXm$oSpZPZSqpyw++BlMDBm0tkCLiyPfajccSyZTAGhdgkA=	\N	f	cdsv	first_name	last_name	a@mail.ru	f	t	2022-08-13 20:17:36.039067+07
16	pbkdf2_sha256$320000$0Vj6wg6mlGYglORYTK5JzV$HL7+JmnVjhTKmI9hSzisnNHdtYfkCDAtApA6kHLi9vg=	\N	f	cdco	q	q	a@mail.ru	f	t	2022-08-13 20:18:32.691064+07
17	pbkdf2_sha256$320000$lisG36CmdtU7XwwHICJeoZ$vtU/etALuKMT7udisqkjvSWUKdxAanRquedyEPdg9Zk=	2022-08-15 21:15:00.708284+07	f	c74m	first_name	last_name	a@mail.ru	f	t	2022-08-15 21:13:24.812569+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
c566ceb516d0dac5362a692a4587293493b53cfa	2022-08-11 20:44:20.478597+07	13
6ca418b8d15b14d4b7e09252082a20bd004eb8a7	2022-08-15 21:15:00.696393+07	17
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-08-15 14:17:05.787613+07	1	Stock object (1)	1	[{"added": {}}]	10	1
2	2022-08-15 14:18:15.159222+07	2	Stock object (2)	1	[{"added": {}}]	10	1
3	2022-08-15 20:40:31.743716+07	1	Order object (1)	1	[{"added": {}}]	11	1
4	2022-08-15 21:09:30.949769+07	1	1 DV certificate	2	[{"changed": {"fields": ["\\u0422\\u0438\\u043f \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\\u0430"]}}]	10	1
5	2022-08-15 21:30:42.437217+07	2	2 OV crtificate	2	[{"changed": {"fields": ["\\u0422\\u0438\\u043f \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\\u0430"]}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	authtoken	tokenproxy
9	person	person
10	stock	stock
11	order	order
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-11 18:58:59.184658+07
2	auth	0001_initial	2022-08-11 18:58:59.246141+07
3	admin	0001_initial	2022-08-11 18:58:59.261089+07
4	admin	0002_logentry_remove_auto_add	2022-08-11 18:58:59.475281+07
5	admin	0003_logentry_add_action_flag_choices	2022-08-11 18:58:59.481761+07
6	contenttypes	0002_remove_content_type_name	2022-08-11 18:58:59.495014+07
7	auth	0002_alter_permission_name_max_length	2022-08-11 18:58:59.503776+07
8	auth	0003_alter_user_email_max_length	2022-08-11 18:58:59.510797+07
9	auth	0004_alter_user_username_opts	2022-08-11 18:58:59.516638+07
10	auth	0005_alter_user_last_login_null	2022-08-11 18:58:59.52277+07
11	auth	0006_require_contenttypes_0002	2022-08-11 18:58:59.52454+07
12	auth	0007_alter_validators_add_error_messages	2022-08-11 18:58:59.529924+07
13	auth	0008_alter_user_username_max_length	2022-08-11 18:58:59.539696+07
14	auth	0009_alter_user_last_name_max_length	2022-08-11 18:58:59.546981+07
15	auth	0010_alter_group_name_max_length	2022-08-11 18:58:59.553769+07
16	auth	0011_update_proxy_permissions	2022-08-11 18:58:59.561008+07
17	auth	0012_alter_user_first_name_max_length	2022-08-11 18:58:59.567263+07
18	sessions	0001_initial	2022-08-11 18:58:59.579157+07
19	authtoken	0001_initial	2022-08-11 19:07:37.229324+07
20	authtoken	0002_auto_20160226_1747	2022-08-11 19:07:37.246538+07
21	authtoken	0003_tokenproxy	2022-08-11 19:07:37.248928+07
22	person	0001_initial	2022-08-11 19:50:35.524388+07
23	stock	0001_initial	2022-08-11 19:50:35.530697+07
24	stock	0002_stock_type_alter_stock_description_and_more	2022-08-15 14:48:26.397948+07
25	order	0001_initial	2022-08-15 15:30:55.034816+07
26	stock	0003_alter_stock_type	2022-08-15 20:40:10.712853+07
27	order	0002_order_request_data	2022-08-15 21:09:15.647564+07
28	stock	0004_alter_stock_type	2022-08-15 21:09:15.651322+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xecy8142enaxef9vwvyczd7rum8re7yz	.eJxVjEEOwiAQRe_C2hAGCgWX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWIE6_W0744LYDuqd2myXObV2mLHdFHrTL60z8vBzu30FNvX5rC8E4BQHQKp_1iGSQadQmgEINjo0pFvLAGSBxxuQHdM5TCSYowiLeH8IFN8Q:1oM7dH:6VDhvELduSKNyixl8F_xIiaT-NAyS35wC7vUDRXdJhw	2022-08-25 19:49:51.749351+07
1kuyikov30l2bk0l4r9wx9tz4pmby9iw	.eJxVjEEOwiAQRe_C2hAGCgWX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWIE6_W0744LYDuqd2myXObV2mLHdFHrTL60z8vBzu30FNvX5rC8E4BQHQKp_1iGSQadQmgEINjo0pFvLAGSBxxuQHdM5TCSYowiLeH8IFN8Q:1oM7ku:QKC7yF8qo-Uwpuh0n_2lR7s0joV7rIIMS8SFJKKhctY	2022-08-25 19:57:44.127943+07
l6qcioyl4ot21es9cg3943nilazie2wy	.eJxVjEEOwiAQRe_C2hAGCgWX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWIE6_W0744LYDuqd2myXObV2mLHdFHrTL60z8vBzu30FNvX5rC8E4BQHQKp_1iGSQadQmgEINjo0pFvLAGSBxxuQHdM5TCSYowiLeH8IFN8Q:1oM7sI:ttV6C_l2P4H5wsBL9oorumEuYXqXgWbI5ORfF0MECPs	2022-08-25 20:05:22.183733+07
hz36oav6iypols15acqxe5x4d768dd5f	.eJxVjDEOAiEQRe9CbUhGZgQs7T0DgRmQVQPJslsZ766bbKHtf-_9lwpxXWpYR57DJOqswKrD75giP3LbiNxju3XNvS3zlPSm6J0Ofe2Sn5fd_TuocdRvXQTkSN47ASCXpRCXjOyNicJkyRqkSMjF2xMCMAEmApPEOMJivHp_ABCqN74:1oNars:_IqvE88b2-keFNHBg4fYW8hjxEcM1ibo5w4QdAZEYjs	2022-08-29 21:15:00.710821+07
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.order_order (id, created, updated, certificate_owner_id, stock_id, request_data) FROM stdin;
1	2022-08-15 20:40:31.742851+07	2022-08-15 20:40:31.742861+07	1	1	\N
9	2022-08-15 21:22:10.757288+07	2022-08-15 21:22:10.7573+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
10	2022-08-15 21:23:20.479743+07	2022-08-15 21:23:20.479755+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
11	2022-08-15 21:24:47.844369+07	2022-08-15 21:24:47.844386+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
12	2022-08-15 21:25:33.846555+07	2022-08-15 21:25:33.846567+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
13	2022-08-15 21:31:33.620167+07	2022-08-15 21:31:33.620179+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
14	2022-08-15 21:32:25.230628+07	2022-08-15 21:32:25.23064+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
15	2022-08-15 21:32:53.544936+07	2022-08-15 21:32:53.544951+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
16	2022-08-15 21:33:37.396106+07	2022-08-15 21:33:37.39612+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
17	2022-08-15 21:34:58.763634+07	2022-08-15 21:34:58.76365+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
18	2022-08-15 21:35:34.231238+07	2022-08-15 21:35:34.231254+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
19	2022-08-15 21:36:43.850109+07	2022-08-15 21:36:43.850121+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
20	2022-08-15 21:38:08.331899+07	2022-08-15 21:38:08.331912+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
21	2022-08-15 21:38:42.399856+07	2022-08-15 21:38:42.399871+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
22	2022-08-15 21:39:10.416262+07	2022-08-15 21:39:10.416283+07	13	1	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"]}, "stock_id": 1, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
23	2022-08-15 21:39:30.107603+07	2022-08-15 21:39:30.107616+07	13	2	{"subject": {"commonName": "www.nuc.ru", "countryName": "RU", "localityName": "г. Москва", "streetAddress": "улица Удальцова, дом 85", "subjectAltName": ["DNS:www.nuc.ru", "DNS:www.xn--m1amj.xn--p1ai"], "organizationName": "Romashka", "stateOrProvinceName": "77 г. Москва"}, "keyUsage": ["digitalSignature", "keyEncipherment"], "stock_id": 2, "extKeyUsage": ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]}
\.


--
-- Data for Name: person_person; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.person_person (id, last_name, first_name, middle_name, phone, snils, inn, user_id) FROM stdin;
1	last_name	first_name	\N	\N	123456789	\N	5
2	last_name	first_name	\N	\N	123456789	\N	6
3	last_name	first_name	\N	\N	123456789	\N	7
4	last_name	first_name	\N	\N	123456789	\N	8
5	last_name	first_name	\N	\N	123456789	\N	9
6	last_name	first_name	\N	\N	123456789	\N	10
7	last_name	first_name	\N	\N	123456789	\N	11
8	last_name	first_name	\N	\N	123456789	\N	12
9	last_name	first_name	\N	\N	123456789	\N	13
10	last_name	first_name	\N	\N	123456789	\N	14
11	last_name	first_name	\N	\N	123456789	\N	15
12	q	q	qq	\N	q	q	16
13	last_name	first_name	\N	\N	123456789	\N	17
\.


--
-- Data for Name: stock_stock; Type: TABLE DATA; Schema: public; Owner: request
--

COPY public.stock_stock (id, title, description, short_description, price, discount, type) FROM stdin;
1	DV certificate	Domain Validation	Доменный сертификат для любого пользователя	1000	0	Domain Validation
2	OV crtificate	Organization Validation сертификат для	Доменный сертификат для компании	1500	0	Organization Validation
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 17, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.order_order_id_seq', 23, true);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.person_person_id_seq', 13, true);


--
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: request
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: person_person person_person_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_pkey PRIMARY KEY (id);


--
-- Name: person_person person_person_user_id_key; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_user_id_key UNIQUE (user_id);


--
-- Name: stock_stock stock_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.stock_stock
    ADD CONSTRAINT stock_stock_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: order_order_certificate_owner_id_2196e5a2; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX order_order_certificate_owner_id_2196e5a2 ON public.order_order USING btree (certificate_owner_id);


--
-- Name: order_order_stock_id_85ae831a; Type: INDEX; Schema: public; Owner: request
--

CREATE INDEX order_order_stock_id_85ae831a ON public.order_order USING btree (stock_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_certificate_owner_id_2196e5a2_fk_person_person_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_certificate_owner_id_2196e5a2_fk_person_person_id FOREIGN KEY (certificate_owner_id) REFERENCES public.person_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_stock_id_85ae831a_fk_stock_stock_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_stock_id_85ae831a_fk_stock_stock_id FOREIGN KEY (stock_id) REFERENCES public.stock_stock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_person person_person_user_id_da0d911e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: request
--

ALTER TABLE ONLY public.person_person
    ADD CONSTRAINT person_person_user_id_da0d911e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

