--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-1.pgdg22.04+1)

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
-- Name: cards; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.cards (
    card_number character varying(20) NOT NULL,
    valid_until date NOT NULL,
    cvv integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.cards OWNER TO v_a_kuz;

--
-- Name: carts_users; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.carts_users (
    user_id integer,
    product_id integer,
    count smallint
);


ALTER TABLE public.carts_users OWNER TO v_a_kuz;

--
-- Name: genders; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.genders (
    id integer NOT NULL,
    gender character varying(15)
);


ALTER TABLE public.genders OWNER TO v_a_kuz;

--
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.genders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genders_id_seq OWNER TO v_a_kuz;

--
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.genders_id_seq OWNED BY public.genders.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    date_order timestamp without time zone,
    status_order_id integer,
    total_price integer
);


ALTER TABLE public.orders OWNER TO v_a_kuz;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO v_a_kuz;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.orders_products (
    order_id integer,
    product_id integer,
    count smallint
);


ALTER TABLE public.orders_products OWNER TO v_a_kuz;

--
-- Name: photo; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO v_a_kuz;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO v_a_kuz;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: photo_products; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.photo_products (
    product_id integer NOT NULL,
    photo_id integer NOT NULL
);


ALTER TABLE public.photo_products OWNER TO v_a_kuz;

--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    category character varying(50)
);


ALTER TABLE public.product_categories OWNER TO v_a_kuz;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO v_a_kuz;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL,
    description character varying(300),
    price integer NOT NULL
);


ALTER TABLE public.products OWNER TO v_a_kuz;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO v_a_kuz;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_reviews; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.products_reviews (
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    score smallint NOT NULL,
    advantages character varying(300),
    disadvantages character varying(300),
    comments character varying(300)
);


ALTER TABLE public.products_reviews OWNER TO v_a_kuz;

--
-- Name: products_video; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.products_video (
    product_id integer NOT NULL,
    video_id integer NOT NULL
);


ALTER TABLE public.products_video OWNER TO v_a_kuz;

--
-- Name: refunds; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.refunds (
    id integer NOT NULL,
    user_id integer,
    date_refund timestamp without time zone,
    total_price integer
);


ALTER TABLE public.refunds OWNER TO v_a_kuz;

--
-- Name: refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.refunds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refunds_id_seq OWNER TO v_a_kuz;

--
-- Name: refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.refunds_id_seq OWNED BY public.refunds.id;


--
-- Name: refunds_products; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.refunds_products (
    refund_id integer,
    product_id integer,
    count smallint
);


ALTER TABLE public.refunds_products OWNER TO v_a_kuz;

--
-- Name: status_orders; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.status_orders (
    id integer NOT NULL,
    status character varying(50)
);


ALTER TABLE public.status_orders OWNER TO v_a_kuz;

--
-- Name: status_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.status_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_orders_id_seq OWNER TO v_a_kuz;

--
-- Name: status_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.status_orders_id_seq OWNED BY public.status_orders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    gender integer,
    email character varying(120) NOT NULL,
    phone character varying(15) NOT NULL,
    main_photo_id integer,
    created_at timestamp without time zone,
    birthday date
);


ALTER TABLE public.users OWNER TO v_a_kuz;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO v_a_kuz;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: v_a_kuz
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO v_a_kuz;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: v_a_kuz
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO v_a_kuz;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v_a_kuz
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: genders id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.genders_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: refunds id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.refunds ALTER COLUMN id SET DEFAULT nextval('public.refunds_id_seq'::regclass);


--
-- Name: status_orders id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.status_orders ALTER COLUMN id SET DEFAULT nextval('public.status_orders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.cards (card_number, valid_until, cvv, owner_id) FROM stdin;
515 48677 37392 619	2023-10-19	372	13
552572 849566 6515	2023-02-14	418	43
553 86345 98226 873	2023-02-08	893	91
482592 323976 8514	2023-07-22	136	92
4929 777 22 5673	2023-06-30	919	53
4024007176873377	2023-03-13	637	5
492 92693 83567 582	2023-04-25	825	40
402400 7199883254	2023-09-22	262	13
525336 214498 6443	2023-07-09	481	25
529297 667355 7342	2022-10-05	266	33
455618 519666 4772	2022-07-18	570	6
5516 8167 4827 7734	2023-12-17	554	79
4716 257 24 6521	2022-05-22	202	2
5128 5972 9357 5330	2023-08-11	598	40
4916599114385879	2023-06-03	298	82
552412 2673487665	2022-08-28	490	69
5376636392645724	2023-08-22	856	41
491697 4227155750	2022-03-12	544	54
4485416666819	2023-02-01	905	83
515 55757 73546 761	2023-04-13	592	66
5524787626382435	2023-12-30	599	54
513876 3282661923	2022-12-04	456	90
5554 4842 8522 2259	2022-01-20	573	40
555579 3523532728	2023-02-19	135	58
5562149274364889	2022-06-10	168	25
491 63228 59967 318	2022-10-01	217	47
453 21863 33329 179	2022-02-19	204	57
4024 007 17 3677	2023-11-23	890	59
511586 264579 9821	2022-09-17	251	72
548415 685666 3260	2022-06-22	154	32
491658 4137167231	2022-08-16	200	13
4916694265427214	2023-07-08	201	31
4556272457557950	2023-01-28	598	61
5261528967356886	2022-07-26	687	22
491624 2828328238	2023-10-27	505	70
5328 2258 9379 1887	2023-08-31	734	13
5347 3763 3599 4576	2023-11-23	907	91
531513 4745277837	2023-09-18	528	64
4485 2763 6765 2138	2023-03-20	507	69
5467343553434275	2022-12-07	384	74
523817 5642882637	2022-02-10	620	10
4916649467278	2023-05-26	887	23
4539343334543	2023-09-13	620	64
4636 252 56 2971	2023-02-12	513	79
4556814628946982	2023-02-12	502	73
4916564761853	2022-12-17	428	19
5352 1717 4259 2143	2023-03-18	350	77
537458 6572789713	2022-07-07	248	100
536187 6455335659	2023-10-19	747	78
4556 478 94 6362	2023-03-10	494	68
453998 8637459757	2023-08-02	358	76
491 66825 27352 353	2022-12-28	660	40
448 59231 41783 834	2023-04-30	804	26
554 35747 66481 434	2023-11-28	470	31
5572626349128389	2023-03-16	386	66
4532 6133 3524 8636	2023-10-06	295	91
402400 716466 4572	2023-02-03	674	35
4024 007 16 4346	2022-03-18	876	27
548 62655 21664 427	2022-09-14	654	85
532 38933 79356 627	2022-04-15	620	58
471611 843632 7667	2022-01-26	186	47
542587 6898751326	2023-03-25	464	30
547 56816 53311 533	2022-12-11	160	70
5347 7912 7815 3461	2023-04-28	426	72
4929836898562223	2023-05-05	711	99
4532 1243 7188 7253	2023-04-09	679	24
5532 6471 6457 3565	2023-06-02	514	12
532551 3886532480	2022-04-11	258	32
518273 7863235328	2022-05-10	717	17
5558 4784 4885 6751	2023-09-21	676	20
517254 5844439386	2022-03-23	557	44
491 69535 35513 389	2022-04-03	828	83
5287662715845781	2023-09-05	791	86
4485665326875	2022-03-19	556	98
4539 782 73 5697	2023-04-26	180	73
4539712955415	2022-02-13	804	86
5361 1645 7378 7725	2023-06-08	650	5
547374 8479658751	2022-03-07	491	95
4556 341 42 3771	2023-03-20	615	13
557777 982335 5773	2023-09-24	715	90
4916833652638773	2023-01-05	634	39
4485 337 46 6620	2022-03-26	580	35
4716 587 57 5946	2023-04-03	626	44
4539854366292829	2023-05-13	873	48
453 22165 82749 312	2023-08-06	370	11
553866 377351 9729	2022-10-25	280	97
453 97536 74845 346	2022-08-28	280	37
4024 007 19 7536	2022-04-26	496	76
517158 687528 4151	2022-06-27	470	35
4485 2723 3522 6386	2023-07-02	229	27
4716886766116591	2023-04-12	412	11
4716 853 96 8973	2022-03-13	653	100
4556247189887271	2022-06-27	362	39
4929 844 52 8489	2022-06-09	589	59
557 78699 55793 972	2022-06-20	156	43
4539893253384125	2022-12-26	840	22
5542 3744 2347 8738	2022-02-10	264	38
4923227642952587	2022-12-23	237	87
4024 007 18 6554	2022-12-01	928	63
5448 3578 3258 7962	2022-10-18	141	21
\.


--
-- Data for Name: carts_users; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.carts_users (user_id, product_id, count) FROM stdin;
72	53	13
75	15	15
34	80	7
98	34	2
47	94	6
90	2	11
34	99	1
98	87	14
30	87	12
96	52	8
6	74	11
10	66	1
55	6	11
9	57	15
24	58	19
83	54	5
9	8	20
12	45	17
94	66	7
90	55	7
89	60	2
78	58	15
61	45	17
3	2	19
28	56	11
5	38	7
25	79	12
12	7	5
57	54	7
44	96	3
85	42	9
9	49	12
21	5	8
1	79	13
85	83	9
43	70	9
98	46	17
56	10	9
77	32	16
4	8	13
39	51	6
52	63	15
97	99	12
32	69	5
10	41	7
89	42	5
90	66	4
53	98	17
31	95	8
20	23	18
50	16	17
32	14	7
8	21	16
92	100	4
4	93	19
22	17	12
100	99	19
73	8	3
33	51	14
28	26	16
53	3	12
34	90	16
96	53	14
51	55	5
57	60	4
69	22	14
75	45	5
27	50	3
73	69	4
21	73	16
28	98	11
8	92	3
4	7	20
60	86	17
78	34	4
39	36	14
97	14	19
92	73	15
82	72	19
1	86	7
82	89	17
7	15	20
48	40	6
91	48	6
10	51	4
22	67	19
3	62	3
65	22	2
47	99	12
33	86	11
68	64	1
19	57	16
43	39	6
8	15	8
91	45	11
75	6	4
72	67	17
82	86	9
60	98	5
42	13	11
\.


--
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.genders (id, gender) FROM stdin;
1	Мужчина
2	Женщина
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.orders (id, user_id, date_order, status_order_id, total_price) FROM stdin;
1	84	2022-08-27 15:21:34	1	96477
2	28	2023-12-02 02:21:11	2	18148
3	88	2022-11-19 07:02:30	3	12846
4	26	2024-01-05 23:29:59	2	46338
5	63	2022-03-15 11:13:56	4	51453
6	22	2023-12-28 19:43:38	2	32306
7	2	2023-03-12 09:24:23	3	28076
8	20	2023-12-29 00:30:24	2	16878
9	13	2023-08-04 03:12:18	4	91998
10	46	2022-02-11 11:59:44	3	81229
11	48	2023-12-16 04:05:25	2	45851
12	90	2022-06-06 08:28:39	2	59974
13	6	2023-02-17 08:38:19	4	28010
14	76	2022-07-18 04:58:30	3	19883
15	98	2023-03-12 11:31:11	3	44630
16	45	2022-01-31 07:34:30	3	55580
17	37	2022-08-07 01:07:55	3	51942
18	35	2022-10-03 14:26:58	1	96775
19	62	2022-12-30 11:43:32	4	27106
20	48	2023-02-20 09:55:28	5	10286
21	33	2023-02-10 16:45:01	1	72247
22	74	2022-05-31 13:16:36	2	88553
23	90	2023-01-26 14:02:02	2	57440
24	62	2023-03-25 14:26:49	4	38610
25	34	2022-03-15 02:17:55	1	58279
26	56	2023-06-10 15:11:43	3	7854
27	61	2022-02-24 19:33:32	2	22886
28	33	2023-10-02 18:38:02	2	19350
29	25	2023-09-12 09:29:29	3	18592
30	23	2022-09-26 02:33:33	5	64998
31	66	2023-06-15 09:31:43	3	66294
32	4	2023-05-31 01:28:06	4	74928
33	36	2023-10-09 15:26:47	4	20531
34	56	2022-04-29 18:41:33	5	77983
35	26	2023-02-26 14:24:47	3	43009
36	37	2022-05-24 19:40:12	3	84572
37	28	2023-09-01 11:00:20	4	50555
38	3	2022-10-02 20:37:07	3	14225
39	2	2023-11-17 12:03:16	2	31830
40	38	2022-06-01 16:19:49	1	36230
41	56	2022-08-22 17:21:14	5	89454
42	41	2023-04-08 19:26:58	5	17966
43	69	2022-10-09 06:13:21	4	97350
44	59	2022-06-09 13:56:24	5	39353
45	36	2022-09-08 14:37:37	4	25057
46	68	2023-06-15 22:18:20	4	90432
47	15	2022-09-09 21:17:25	3	53218
48	49	2023-01-20 19:14:46	4	1416
49	28	2022-08-15 19:04:20	5	72144
50	9	2022-07-22 12:21:11	4	18958
51	25	2022-04-11 21:08:48	2	76831
52	71	2022-05-21 15:09:57	3	37903
53	12	2024-01-05 16:47:11	2	2250
54	31	2022-07-21 07:44:24	5	39652
55	90	2023-10-13 22:51:49	3	90214
56	50	2023-11-04 01:12:24	3	23554
57	61	2023-11-14 11:29:43	4	7605
58	71	2022-02-22 23:11:11	4	43464
59	83	2022-11-11 13:03:15	3	8362
60	25	2022-09-02 11:26:51	3	3700
61	27	2023-11-23 11:59:15	4	16671
62	70	2023-04-16 21:33:19	4	40992
63	13	2022-07-05 19:46:55	2	34914
64	18	2022-12-05 06:32:50	3	65401
65	98	2023-11-09 02:24:17	2	32103
66	56	2023-04-19 20:30:41	2	88291
67	89	2023-04-20 20:22:23	2	55896
68	21	2023-10-27 07:40:57	2	82164
69	19	2023-12-01 11:02:06	2	20179
70	2	2022-09-29 11:09:22	5	56176
71	94	2023-08-23 19:27:31	3	84225
72	32	2022-11-18 12:01:48	2	21880
73	46	2022-11-03 16:04:59	4	58167
74	14	2022-12-11 16:50:46	5	91031
75	36	2023-01-19 01:43:42	4	49297
76	41	2023-02-24 02:14:47	2	74863
77	69	2024-01-05 20:10:26	4	13767
78	86	2023-08-14 05:15:11	3	28614
79	92	2023-12-01 19:07:42	1	85542
80	30	2024-01-02 16:36:51	2	68387
81	55	2023-06-22 05:45:30	2	46415
82	72	2023-07-25 21:42:37	1	61090
83	69	2024-01-06 00:36:10	4	95954
84	34	2022-10-16 19:26:21	5	16075
85	2	2023-04-21 11:25:56	4	79559
86	90	2022-03-27 16:08:29	2	88155
87	50	2022-03-01 16:10:52	2	26145
88	85	2022-06-15 12:46:05	2	79214
89	33	2023-04-19 02:39:50	4	56861
90	13	2023-09-30 14:08:09	2	26118
91	41	2023-02-24 13:03:43	2	49441
92	89	2022-07-20 22:07:16	4	45145
93	56	2022-01-14 15:16:40	4	85952
94	15	2023-01-27 20:55:44	3	31734
95	88	2022-02-20 19:07:42	1	16573
96	57	2022-06-06 10:04:31	1	14272
97	62	2023-08-16 03:55:42	4	65097
98	58	2022-09-17 17:02:39	3	6172
99	50	2022-01-17 21:03:09	4	62644
100	95	2023-12-06 06:11:51	4	11765
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.orders_products (order_id, product_id, count) FROM stdin;
9	5	6
46	74	2
91	13	14
90	3	10
51	91	5
33	29	7
93	77	15
81	89	3
9	43	15
7	62	13
79	16	5
76	34	17
32	35	9
32	20	11
100	97	17
38	32	11
16	83	3
12	61	17
2	13	8
14	46	13
79	60	3
57	51	4
5	44	5
62	30	18
20	7	14
73	72	1
70	25	15
84	27	20
50	68	2
49	43	17
53	64	19
18	69	13
70	85	18
96	24	19
3	78	9
43	69	6
16	58	7
18	99	4
36	31	10
83	15	18
85	27	18
53	23	16
3	8	13
78	72	15
88	5	16
5	94	12
9	82	10
49	19	15
92	95	10
35	24	19
18	61	5
98	41	18
65	86	3
39	92	7
29	59	16
55	59	11
94	36	20
76	73	3
46	18	5
99	68	5
33	9	19
8	49	9
43	65	15
38	1	15
61	89	16
23	8	11
89	14	11
21	11	12
4	92	7
53	98	7
91	27	4
57	55	7
53	20	7
14	16	10
7	52	10
31	2	16
24	5	9
4	62	19
94	95	15
99	6	2
74	95	16
52	6	11
2	82	9
3	33	4
93	56	6
42	46	6
99	66	7
73	23	9
66	33	4
79	22	20
54	3	19
20	84	2
76	100	18
25	21	8
11	6	13
46	37	7
92	33	15
94	89	10
76	12	14
84	58	16
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
367	http://baidu.com/sub/cars?ab=441&aad=2	95	augue id ante dictum cursus. Nunc mauris elit, dictum	2023-03-26 20:36:36	3065
368	http://cnn.com/en-us?search=1	4	ligula. Nullam feugiat	2022-11-05 20:03:05	4716
369	http://whatsapp.com/user/110?str=se	7	a nunc. In at pede. Cras vulputate velit	2023-02-11 04:24:23	2385
370	http://netflix.com/group/9?q=test	9	tortor nibh sit amet orci. Ut	2022-01-22 19:04:15	1515
371	http://cnn.com/site?k=0	55	pellentesque. Sed dictum.	2022-05-26 02:36:14	2274
372	https://guardian.co.uk/en-us?q=11	8	dolor sit amet, consectetuer adipiscing elit. Curabitur sed	2022-11-28 12:30:59	2155
373	http://netflix.com/settings?g=1	88	ipsum. Phasellus vitae mauris sit amet lorem semper	2022-02-08 10:54:48	2450
374	https://walmart.com/one?k=0	35	faucibus lectus, a sollicitudin orci sem	2022-11-14 06:24:36	915
375	http://wikipedia.org/sub?search=1	33	sit amet massa.	2023-06-03 19:37:40	3255
376	http://twitter.com/settings?client=g	88	ornare, facilisis	2022-06-02 16:07:49	4279
377	https://facebook.com/sub/cars?q=11	48	vestibulum, neque sed dictum eleifend, nunc	2023-08-29 09:46:06	687
378	http://instagram.com/group/9?q=4	57	pede. Praesent eu dui. Cum sociis natoque	2023-10-20 18:01:36	4206
379	http://naver.com/sub?g=1	17	dui. Fusce aliquam, enim	2022-04-11 06:22:05	1636
380	http://pinterest.com/site?q=0	46	auctor velit. Aliquam nisl. Nulla eu neque pellentesque	2022-08-15 12:22:57	4676
381	https://nytimes.com/one?q=0	70	vulputate mauris sagittis placerat. Cras dictum ultricies	2023-02-12 01:40:15	887
382	http://netflix.com/sub/cars?q=test	10	molestie tellus. Aenean egestas hendrerit neque. In	2023-06-16 06:10:28	3806
383	https://reddit.com/fr?search=1	18	enim commodo hendrerit. Donec porttitor tellus non magna.	2022-08-23 19:13:58	2546
384	http://cnn.com/sub?gi=100	75	Cras lorem lorem,	2022-09-03 04:45:53	4772
385	http://whatsapp.com/en-us?ab=441&aad=2	49	luctus felis purus ac tellus.	2022-12-17 22:52:07	2855
386	http://ebay.com/en-us?g=1	80	tortor nibh sit amet orci. Ut	2023-10-01 22:15:33	3612
387	http://whatsapp.com/en-ca?q=test	19	Nulla aliquet. Proin velit.	2023-06-21 18:40:54	3253
388	https://cnn.com/group/9?q=4	35	Phasellus vitae mauris sit amet lorem semper auctor. Mauris	2022-01-17 00:25:48	1199
389	https://ebay.com/group/9?g=1	20	ante bibendum ullamcorper. Duis cursus,	2023-09-18 09:24:57	4774
390	http://wikipedia.org/group/9?p=8	42	Phasellus dolor elit, pellentesque a, facilisis	2022-02-11 12:01:19	1399
391	http://guardian.co.uk/sub/cars?page=1&offset=1	88	id, ante. Nunc	2023-09-17 12:50:57	4110
392	http://zoom.us/sub?client=g	83	consectetuer euismod est arcu ac orci. Ut semper	2023-07-31 02:53:11	3460
393	http://twitter.com/site?q=11	28	Nunc mauris sapien,	2023-09-22 18:38:46	1733
394	http://nytimes.com/fr?client=g	32	auctor, nunc nulla vulputate dui,	2023-10-02 15:47:32	1680
395	http://youtube.com/en-ca?client=g	24	Integer vitae nibh. Donec	2022-04-13 10:36:02	4911
396	https://netflix.com/fr?g=1	68	amet ultricies sem magna nec	2022-11-30 06:07:30	3514
397	http://ebay.com/sub/cars?search=1&q=de	3	Pellentesque habitant morbi tristique senectus et netus et malesuada	2023-01-24 14:54:26	495
398	http://wikipedia.org/sub/cars?q=4	4	eget ipsum. Suspendisse	2022-01-30 06:01:34	3548
399	https://wikipedia.org/fr?k=0	46	aliquet odio. Etiam	2023-08-27 18:47:31	4668
400	https://twitter.com/user/110?q=test	4	dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum	2022-11-11 12:40:20	2113
401	https://youtube.com/en-us?p=8	85	eu sem. Pellentesque ut ipsum ac mi	2022-05-27 21:09:42	2628
402	http://zoom.us/fr?q=11	70	tristique aliquet. Phasellus fermentum convallis ligula.	2022-08-30 07:23:49	2819
403	http://baidu.com/sub?page=1&offset=1	58	montes, nascetur	2022-09-23 10:41:13	3204
404	https://instagram.com/sub?q=4	90	elit, pretium et, rutrum	2022-06-17 10:07:14	2949
405	http://twitter.com/one?ad=115	19	non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper	2022-06-30 10:23:32	2972
406	http://naver.com/one?search=1	39	felis. Donec tempor, est ac mattis	2023-01-03 07:01:36	4421
407	http://google.com/user/110?g=1	12	condimentum eget, volutpat ornare, facilisis eget, ipsum.	2023-04-26 06:01:33	2257
408	https://whatsapp.com/en-ca?q=11	58	aliquam	2022-12-04 13:48:03	950
409	https://ebay.com/en-us?k=0	14	aliquet magna a	2022-01-08 17:54:22	1531
410	https://google.com/sub?client=g	79	non, luctus sit amet, faucibus ut, nulla. Cras	2022-10-03 11:29:39	2579
411	http://zoom.us/user/110?gi=100	72	Cras convallis convallis dolor. Quisque tincidunt pede ac	2023-12-02 18:36:12	2423
412	http://wikipedia.org/settings?search=1	19	Vivamus sit amet	2023-04-17 19:25:51	3362
413	http://bbc.co.uk/site?p=8	57	elit fermentum	2023-09-16 16:43:22	1682
414	https://guardian.co.uk/fr?gi=100	3	mauris a nunc.	2023-01-02 19:50:29	2025
415	http://cnn.com/one?q=0	85	diam nunc,	2022-03-19 17:23:09	4851
416	https://wikipedia.org/one?ad=115	55	dui. Cum sociis natoque penatibus et magnis dis	2023-03-20 12:47:05	2658
417	https://nytimes.com/fr?search=1&q=de	54	dictum ultricies ligula. Nullam enim.	2023-10-20 02:31:49	1880
418	http://cnn.com/sub?q=test	6	ultrices posuere cubilia Curae	2023-12-16 04:24:23	4061
419	https://whatsapp.com/user/110?page=1&offset=1	30	Donec at arcu. Vestibulum ante ipsum primis in	2023-04-04 07:40:03	3782
420	https://nytimes.com/sub?p=8	36	venenatis vel, faucibus id, libero. Donec consectetuer	2022-12-04 11:54:41	3904
421	https://cnn.com/one?gi=100	12	parturient montes, nascetur ridiculus	2023-03-19 01:44:23	4952
422	http://walmart.com/user/110?search=1	36	sapien, cursus	2023-11-19 17:03:40	135
423	https://youtube.com/group/9?search=1	4	mauris sit amet lorem semper	2023-08-26 15:17:19	2521
424	https://baidu.com/group/9?g=1	22	Pellentesque habitant morbi tristique senectus	2022-06-30 03:20:03	1030
425	https://twitter.com/one?ab=441&aad=2	97	nec tempus mauris erat	2023-12-05 09:47:43	2022
426	https://bbc.co.uk/sub?client=g	25	rhoncus. Donec	2022-10-19 08:59:06	1919
427	https://twitter.com/sub/cars?q=4	44	ornare placerat,	2023-01-11 10:24:41	3797
428	https://facebook.com/en-us?client=g	53	fermentum fermentum arcu. Vestibulum ante	2022-01-29 16:23:16	3215
429	https://whatsapp.com/en-us?search=1&q=de	80	Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,	2023-06-16 05:32:43	3856
430	http://walmart.com/settings?k=0	83	gravida	2022-04-02 11:39:06	1473
431	http://wikipedia.org/sub/cars?ab=441&aad=2	81	vulputate velit eu sem. Pellentesque ut ipsum	2023-06-12 07:10:49	3340
432	https://youtube.com/one?q=0	72	tellus. Aenean egestas hendrerit neque. In ornare sagittis	2023-01-03 16:20:31	4253
433	http://naver.com/en-ca?q=11	30	dis parturient montes, nascetur	2023-08-07 14:32:27	3656
434	https://facebook.com/settings?k=0	61	ut odio vel est	2022-08-10 03:59:39	3851
435	https://reddit.com/en-us?g=1	42	Aliquam gravida mauris	2022-04-13 15:17:11	895
436	https://youtube.com/group/9?client=g	4	gravida. Praesent eu nulla at sem molestie sodales.	2023-10-06 17:21:23	4049
437	https://cnn.com/sub/cars?q=0	29	vulputate, nisi sem semper	2023-01-29 23:22:22	4646
438	https://whatsapp.com/en-ca?q=test	76	Proin non massa non ante	2022-01-24 00:23:19	4895
439	http://youtube.com/site?search=1	32	quam a	2023-09-14 12:55:20	3546
440	https://whatsapp.com/one?q=4	90	vulputate ullamcorper magna. Sed eu eros. Nam	2023-09-13 03:45:35	1153
441	http://guardian.co.uk/fr?q=11	50	ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,	2023-11-23 22:48:39	1994
442	http://walmart.com/fr?q=0	25	velit dui, semper et, lacinia	2023-03-11 18:15:38	3000
443	http://naver.com/en-ca?page=1&offset=1	49	arcu eu odio tristique pharetra. Quisque ac libero	2023-09-08 11:55:33	1413
444	http://ebay.com/sub?p=8	76	eleifend non, dapibus rutrum, justo. Praesent	2023-05-24 17:14:38	203
445	https://baidu.com/en-ca?p=8	9	vel sapien imperdiet ornare. In faucibus.	2022-04-27 16:26:23	3789
446	http://youtube.com/sub?k=0	66	est tempor bibendum. Donec felis orci, adipiscing non, luctus	2022-03-17 08:08:10	49
447	https://reddit.com/en-ca?page=1&offset=1	40	lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,	2022-02-19 21:15:38	297
448	http://walmart.com/fr?k=0	26	morbi tristique senectus et netus et malesuada fames	2023-07-28 07:45:20	2649
449	http://nytimes.com/fr?search=1	74	Suspendisse aliquet, sem ut	2023-05-05 09:01:10	2416
450	http://bbc.co.uk/sub?q=test	83	dis parturient montes, nascetur ridiculus	2022-07-28 18:24:06	3677
451	http://walmart.com/sub?client=g	28	sodales at, velit. Pellentesque ultricies dignissim lacus.	2023-04-06 02:12:17	607
452	https://ebay.com/fr?ab=441&aad=2	25	fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.	2023-08-22 07:16:25	980
453	https://youtube.com/sub/cars?search=1&q=de	26	convallis, ante	2022-04-13 22:48:09	2094
454	https://ebay.com/user/110?q=0	98	vitae,	2023-11-14 23:32:54	1290
455	http://walmart.com/sub?g=1	51	venenatis vel, faucibus id,	2023-02-16 03:13:39	4344
456	https://twitter.com/sub/cars?p=8	90	Nam interdum enim non nisi.	2022-06-06 12:21:11	3008
457	https://google.com/en-ca?search=1&q=de	36	fringilla purus mauris a nunc. In at pede. Cras vulputate	2023-07-14 10:22:37	1874
458	http://instagram.com/en-ca?str=se	87	Donec vitae erat vel pede blandit congue. In scelerisque	2023-03-07 23:56:27	3761
459	http://pinterest.com/one?q=0	5	Donec est. Nunc ullamcorper, velit	2022-07-10 16:56:18	1102
460	http://youtube.com/fr?gi=100	97	id ante dictum cursus. Nunc mauris elit, dictum	2022-06-27 13:15:30	2818
461	http://whatsapp.com/sub/cars?gi=100	45	sagittis felis. Donec tempor,	2022-10-08 21:19:13	3019
462	https://guardian.co.uk/sub/cars?q=11	76	ligula. Aenean euismod mauris eu	2023-10-10 07:03:06	120
463	https://reddit.com/fr?ad=115	70	mollis non, cursus non, egestas a, dui. Cras	2023-06-26 10:06:51	538
464	http://yahoo.com/site?ad=115	31	lobortis. Class	2023-04-29 06:04:44	955
465	http://twitter.com/en-us?ab=441&aad=2	60	parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique	2023-10-23 12:30:25	4733
466	http://instagram.com/sub?q=11	23	quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper	2022-01-11 11:10:49	4502
\.


--
-- Data for Name: photo_products; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.photo_products (product_id, photo_id) FROM stdin;
77	93
76	23
17	21
22	34
87	15
65	67
27	15
34	13
28	29
79	94
2	1
49	61
9	80
52	68
44	43
10	37
32	54
67	90
53	100
3	46
77	23
3	14
24	12
94	54
74	59
58	36
89	34
29	7
49	88
15	73
20	51
65	90
96	87
6	78
11	86
89	95
56	60
61	84
12	40
91	14
30	16
7	83
68	26
96	37
86	60
15	88
62	19
39	100
29	52
37	21
6	98
57	6
61	9
62	78
66	62
82	33
54	49
8	21
62	15
90	97
55	94
90	44
28	82
22	69
31	11
66	27
52	13
79	40
44	35
7	99
49	82
3	77
42	23
87	52
43	37
21	23
57	30
82	28
15	16
57	56
94	32
88	70
96	86
80	61
72	5
54	40
42	71
94	16
22	23
18	70
80	62
13	63
76	70
28	80
7	82
46	8
93	8
57	20
77	37
13	5
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.product_categories (id, category) FROM stdin;
1	Duis
2	imperdiet
3	Etiam bibendum fermentum metus. Aenean
4	auctor,
5	adipiscing ligula.
6	eget magna. Suspendisse
7	euismod et,
8	Duis at lacus.
9	elit elit fermentum risus, at
10	aliquam adipiscing lacus. Ut nec
11	lacus. Cras
12	enim. Etiam gravida molestie arcu.
13	lorem ut aliquam iaculis, lacus
14	Nam interdum
15	nulla.
16	augue eu
17	ipsum primis
18	non quam. Pellentesque
19	tortor.
20	pharetra. Nam
21	Ut tincidunt orci
22	et nunc. Quisque ornare tortor
23	justo
24	bibendum. Donec felis
25	in, hendrerit consectetuer, cursus
26	tellus id nunc
27	eu, eleifend nec, malesuada ut,
28	malesuada fringilla est.
29	sodales at, velit. Pellentesque ultricies
30	Vestibulum ante ipsum
31	vehicula aliquet libero.
32	metus
33	magnis dis parturient
34	vel quam dignissim pharetra. Nam
35	a, scelerisque sed, sapien.
36	Aenean euismod
37	Vestibulum ante ipsum primis
38	ac mattis semper,
39	sed dui.
40	Duis sit amet
41	tristique senectus et
42	dui.
43	tincidunt
44	Nunc
45	ac metus vitae
46	viverra.
47	nunc. In at
48	fermentum arcu. Vestibulum
49	ac mi eleifend
50	sit amet,
51	Lorem ipsum dolor sit amet,
52	ornare. In
53	sit amet
54	Mauris quis turpis
55	dapibus id, blandit at,
56	Donec
57	sit amet, consectetuer
58	nec, cursus
59	ipsum dolor sit amet,
60	mollis lectus pede et
61	elementum, dui quis
62	Etiam
63	tellus. Nunc lectus
64	sed sem egestas blandit.
65	lectus convallis est,
66	massa non ante
67	nec enim. Nunc
68	arcu. Curabitur ut
69	Ut
70	tortor.
71	augue. Sed
72	Integer
73	Morbi quis urna. Nunc
74	scelerisque sed, sapien.
75	magna. Lorem ipsum
76	risus quis diam luctus lobortis.
77	hendrerit consectetuer,
78	Nullam lobortis quam a
79	Nulla facilisis. Suspendisse commodo tincidunt
80	cursus purus. Nullam scelerisque neque
81	erat. Sed
82	dictum ultricies
83	dolor. Fusce feugiat. Lorem
84	nec, imperdiet nec, leo.
85	malesuada id, erat. Etiam
86	diam.
87	et malesuada fames ac
88	mi
89	sit
90	a
91	sagittis
92	Phasellus dolor elit, pellentesque
93	risus. Donec
94	amet, consectetuer adipiscing
95	sed turpis nec mauris
96	nisi. Mauris
97	amet orci. Ut sagittis
98	placerat. Cras dictum ultricies ligula.
99	pede. Suspendisse dui. Fusce diam
100	orci lacus
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.products (id, name, category_id, description, price) FROM stdin;
1	mi fringilla	95	ridiculus mus.	2255
2	sit	25	blandit at, nisi.	6072
3	nec metus facilisis lorem tristique	41	tincidunt congue turpis.	2512
4	ultricies ligula.	54	molestie tellus. Aenean egestas hendrerit neque. In ornare	1959
5	tristique senectus et netus	20	velit eu sem. Pellentesque ut	4617
6	libero et	21	vel sapien imperdiet ornare. In	629
7	sociis	10	diam eu dolor egestas rhoncus. Proin	7800
8	nibh. Quisque	3	neque venenatis lacus. Etiam	2279
9	ac urna. Ut tincidunt	61	egestas.	8650
10	neque tellus,	27	turpis. Aliquam adipiscing lobortis	1069
11	dis parturient montes, nascetur	98	aliquet	9071
12	morbi tristique senectus	5	mi, ac mattis	2714
13	Vivamus sit	78	iaculis enim, sit amet ornare lectus	5432
14	luctus, ipsum	22	vehicula et, rutrum eu,	9867
15	mollis	79	mi fringilla mi lacinia mattis. Integer eu	8567
16	nunc	56	neque vitae semper egestas, urna justo faucibus lectus,	3566
17	nec ante	39	aliquet magna a neque. Nullam ut nisi	9424
18	semper tellus id nunc	68	Curabitur	1305
19	ultrices iaculis odio. Nam	38	dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu	1827
20	Ut tincidunt vehicula	15	mus. Proin	7129
21	Nunc ut erat.	34	ut ipsum ac mi eleifend	7837
22	Ut	72	Aliquam nec enim. Nunc ut erat. Sed nunc est,	2538
23	Sed nec metus	80	nec, euismod in, dolor.	799
24	rutrum magna. Cras convallis	57	porttitor tellus non magna. Nam ligula elit, pretium et, rutrum	9575
25	Sed eu	89	cubilia Curae	1798
26	ac	91	eu tempor erat neque non quam. Pellentesque	8669
27	neque sed sem egestas	26	est, mollis non, cursus non, egestas a,	3101
28	Pellentesque ut	77	elit, pretium et, rutrum non, hendrerit id,	2069
29	lectus pede,	72	montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse	7704
30	orci quis	17	tortor nibh sit amet orci. Ut	9061
31	Vestibulum	47	eu eros. Nam consequat	7044
32	ac ipsum. Phasellus vitae	34	vitae dolor.	6490
33	ac risus. Morbi	52	Proin eget odio.	5849
34	eget magna. Suspendisse	62	sagittis augue, eu tempor erat neque non quam.	2458
35	montes, nascetur ridiculus mus. Donec	49	imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt	6891
36	mollis. Integer tincidunt	71	ipsum dolor sit amet,	1870
37	sodales purus,	47	Cras dictum ultricies ligula. Nullam enim.	4883
38	consectetuer rhoncus. Nullam velit	67	et, euismod et, commodo at, libero. Morbi accumsan laoreet	8189
39	eu tellus	19	sed pede	8024
40	sollicitudin adipiscing	65	In condimentum. Donec at arcu. Vestibulum ante	5257
41	Suspendisse sagittis. Nullam	83	Fusce aliquam, enim nec tempus	6933
42	dignissim pharetra. Nam	41	Aliquam ornare, libero	9277
43	quam dignissim pharetra. Nam ac	13	elit, dictum eu, eleifend nec,	9325
44	penatibus	43	et pede. Nunc sed orci lobortis augue scelerisque	671
45	egestas lacinia. Sed congue,	23	Proin nisl sem, consequat nec, mollis	7463
46	elit sed consequat auctor,	11	interdum enim non nisi. Aenean	5249
47	at	39	Proin dolor. Nulla semper	9745
48	eget	14	et ultrices posuere	3581
49	Nunc mauris. Morbi	23	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus	5916
50	non massa non ante	36	Vivamus	6342
51	lacus. Nulla tincidunt, neque vitae	36	lacus. Mauris non dui nec urna suscipit nonummy. Fusce	8775
52	vulputate ullamcorper magna. Sed	99	fames ac turpis egestas. Fusce aliquet	4288
53	vitae	23	lacus. Quisque	4749
54	Integer urna. Vivamus molestie	8	vel arcu eu odio tristique pharetra. Quisque ac	5923
55	adipiscing fringilla,	33	Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet	9061
56	egestas.	26	at, nisi. Cum sociis natoque penatibus et magnis dis	1199
57	enim consequat purus. Maecenas	23	tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse	7036
58	mi eleifend egestas.	17	ut, pharetra sed, hendrerit a, arcu. Sed et	468
59	neque pellentesque massa	13	tempus risus.	5546
60	netus	18	sit amet risus. Donec egestas. Aliquam nec enim.	9219
61	amet massa. Quisque	96	rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac	1875
62	auctor. Mauris vel turpis.	8	Ut sagittis	7384
63	non, bibendum	42	auctor velit. Aliquam nisl. Nulla eu neque pellentesque	1615
64	aliquet molestie tellus. Aenean egestas	69	diam. Pellentesque habitant morbi tristique senectus et netus et	5606
65	dui quis	46	Integer aliquam adipiscing	8915
66	ultrices a, auctor	76	nisi sem semper erat, in consectetuer ipsum nunc id	4992
67	tempus risus. Donec	59	ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius.	6041
68	a felis	95	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.	6589
69	Nunc mauris. Morbi non sapien	84	eu metus. In lorem. Donec	8798
70	at, velit. Cras	87	orci lacus vestibulum lorem, sit amet ultricies sem	6843
71	elit erat	79	aliquet magna	6586
72	neque.	94	non leo. Vivamus nibh dolor,	3138
73	interdum. Nunc sollicitudin	6	accumsan sed, facilisis vitae, orci. Phasellus	4173
74	fringilla purus mauris	25	vestibulum, neque sed dictum eleifend,	8405
75	cursus a,	48	at sem molestie sodales. Mauris blandit enim consequat purus.	3868
76	orci	30	arcu. Aliquam ultrices iaculis odio. Nam interdum	1506
77	ligula.	80	ipsum leo elementum sem, vitae aliquam eros turpis non	2499
78	lorem ut aliquam iaculis,	59	mollis. Duis sit amet diam	8434
79	tempor	48	libero mauris,	625
80	metus urna convallis erat, eget	4	Sed nunc est, mollis	5237
81	vestibulum nec, euismod in,	91	dolor, tempus non, lacinia	9285
82	Suspendisse commodo	23	sed turpis	2319
83	Etiam vestibulum massa rutrum	47	mauris. Morbi non sapien molestie orci tincidunt adipiscing.	4145
84	rhoncus. Nullam	30	auctor quis,	7143
85	scelerisque	35	facilisi. Sed neque. Sed eget lacus. Mauris non dui nec	6369
86	id, libero. Donec	33	Nulla eu neque	3102
87	velit in	96	dui. Suspendisse ac metus vitae velit	6346
88	molestie sodales.	49	adipiscing lacus. Ut nec urna et arcu	5682
89	Proin dolor. Nulla	81	tempor diam dictum	7042
90	risus a	4	urna. Ut tincidunt vehicula	9279
91	Nulla eu neque pellentesque	20	eu tempor erat neque	338
92	facilisis. Suspendisse commodo tincidunt	42	Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus.	189
93	rutrum	72	est, congue a,	3668
94	rutrum non, hendrerit id,	62	amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet	2325
95	ac arcu. Nunc mauris.	37	mauris sagittis placerat. Cras dictum	6723
96	ante, iaculis nec, eleifend	79	sed libero. Proin sed turpis	6732
97	ac sem ut dolor	12	dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed	6757
98	vitae diam. Proin dolor. Nulla	98	Etiam ligula tortor, dictum	7262
99	et, rutrum eu, ultrices sit	76	Lorem ipsum	7461
100	luctus lobortis. Class	62	neque et nunc.	5437
\.


--
-- Data for Name: products_reviews; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.products_reviews (user_id, product_id, score, advantages, disadvantages, comments) FROM stdin;
11	45	3	laoreet, libero	nec tellus. Nunc lectus pede, ultrices	velit dui, semper et,
28	58	4	sed libero. Proin sed turpis nec mauris blandit	elementum, dui quis accumsan convallis, ante lectus	malesuada augue ut lacus. Nulla tincidunt,
62	82	3	Phasellus ornare. Fusce mollis. Duis sit amet	Pellentesque ultricies dignissim lacus. Aliquam	ante, iaculis nec, eleifend non, dapibus
51	53	3	nunc. In at pede. Cras vulputate velit eu sem.	Cras eget nisi dictum augue malesuada malesuada.	orci sem eget massa. Suspendisse eleifend. Cras sed
74	42	4	habitant morbi tristique senectus et netus et malesuada fames ac	vitae dolor. Donec fringilla. Donec feugiat	nunc sed pede. Cum
9	11	4	lobortis,	lacus, varius et, euismod et, commodo at, libero. Morbi accumsan	Cum sociis
22	24	4	Nunc laoreet lectus quis massa.	volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.	Aliquam gravida mauris ut mi. Duis
58	61	4	non enim. Mauris quis	imperdiet nec, leo.	nec, eleifend non,
85	9	3	Morbi sit amet	molestie arcu. Sed eu	congue
4	22	4	velit. Aliquam nisl. Nulla eu neque pellentesque	suscipit	est tempor
21	55	2	lorem lorem, luctus	dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula	enim nec tempus scelerisque, lorem ipsum sodales
50	71	2	varius. Nam porttitor	fringilla mi lacinia mattis. Integer	odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.
98	54	5	consequat nec, mollis vitae,	elit, pretium et, rutrum non, hendrerit id, ante. Nunc	felis eget varius ultrices, mauris ipsum porta elit, a
79	28	5	justo nec ante. Maecenas mi felis,	sed turpis nec mauris blandit mattis.	mollis lectus pede et risus. Quisque libero lacus,
30	77	2	Donec est mauris, rhoncus id,	cursus luctus, ipsum leo elementum sem, vitae	non, bibendum sed, est. Nunc
96	29	4	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,	elit. Etiam	malesuada vel, convallis in, cursus et, eros. Proin
15	50	1	per inceptos hymenaeos. Mauris ut	sed consequat auctor, nunc nulla vulputate dui, nec tempus	Quisque porttitor eros
91	6	2	sed sem egestas blandit. Nam nulla magna,	ullamcorper eu, euismod ac, fermentum	ridiculus mus. Donec dignissim
76	81	4	purus. Nullam scelerisque neque sed sem egestas	nisl arcu iaculis enim, sit	a, magna. Lorem
66	87	1	mollis dui, in sodales elit erat vitae risus. Duis	ligula eu enim. Etiam imperdiet dictum magna. Ut	Sed nec metus facilisis lorem tristique aliquet.
81	2	4	rhoncus.	dignissim lacus. Aliquam rutrum lorem	tellus justo sit amet nulla. Donec non justo. Proin non
74	41	3	fringilla purus	montes, nascetur	parturient montes, nascetur ridiculus
69	9	3	laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi	tincidunt orci quis lectus. Nullam suscipit, est ac	magnis dis parturient montes, nascetur ridiculus mus. Aenean eget
65	65	3	amet lorem semper auctor.	auctor. Mauris vel turpis.	Integer in magna. Phasellus dolor elit, pellentesque a, facilisis
78	89	4	est, mollis non, cursus non, egestas	egestas lacinia. Sed congue, elit sed	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing
52	100	3	mollis vitae, posuere at, velit. Cras lorem lorem,	non ante bibendum	in, hendrerit consectetuer, cursus
10	27	4	odio sagittis semper. Nam tempor diam	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse	vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum
47	48	4	mauris eu elit. Nulla facilisi. Sed neque. Sed eget	mus. Proin vel arcu eu odio tristique pharetra.	nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante
47	92	2	aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus	at pretium aliquet, metus
56	70	4	odio semper cursus. Integer mollis. Integer tincidunt aliquam	semper auctor. Mauris vel turpis. Aliquam adipiscing	lacus. Mauris non dui nec urna suscipit
13	17	2	sed pede nec ante blandit viverra.	mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam	lorem fringilla ornare
84	12	5	orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam	auctor quis, tristique ac, eleifend vitae, erat. Vivamus	vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue
94	61	4	odio a purus. Duis elementum, dui quis accumsan convallis,	condimentum eget, volutpat ornare, facilisis eget, ipsum.	purus. Nullam scelerisque neque sed sem
84	11	1	pellentesque eget, dictum placerat, augue.	Aenean eget metus. In nec orci. Donec nibh.	vel, convallis in, cursus et,
79	82	2	dui,	ipsum. Curabitur consequat, lectus sit amet luctus vulputate,	sapien. Nunc pulvinar arcu et pede. Nunc sed
22	50	3	lobortis quam a felis ullamcorper	aliquam adipiscing lacus. Ut nec urna et	lorem ac risus.
10	23	4	eu eros. Nam consequat dolor vitae dolor. Donec	ullamcorper. Duis at lacus. Quisque purus	sapien, cursus in, hendrerit consectetuer, cursus et, magna.
91	70	1	nascetur ridiculus mus. Proin vel nisl.	sed,	tempus mauris erat eget ipsum.
26	18	2	tortor, dictum eu, placerat eget,	orci. Ut	lectus.
97	26	2	a neque. Nullam ut	ut eros non enim commodo	malesuada id, erat. Etiam vestibulum massa rutrum magna.
19	40	1	tincidunt, neque vitae semper egestas, urna	ante bibendum ullamcorper. Duis cursus, diam at pretium	eros turpis non enim. Mauris quis turpis vitae purus
13	54	3	sapien, gravida non, sollicitudin a, malesuada	sociis natoque penatibus	pretium neque.
76	60	3	Proin sed turpis nec mauris blandit mattis.	ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	semper erat, in consectetuer
67	28	5	sagittis. Nullam vitae diam.	eu, odio. Phasellus at augue	tristique ac, eleifend
66	46	4	pede, malesuada vel, venenatis vel, faucibus id, libero. Donec	non sapien molestie orci tincidunt adipiscing. Mauris	non nisi.
45	63	5	dui nec urna suscipit nonummy. Fusce	arcu.	ultrices, mauris ipsum porta elit, a feugiat tellus
63	73	1	Nunc pulvinar arcu et	Cras	Cras interdum. Nunc sollicitudin commodo
40	27	2	Duis dignissim tempor arcu. Vestibulum ut eros non enim	tristique	et, magna. Praesent interdum ligula eu enim. Etiam
25	41	1	risus quis	ultricies ligula. Nullam	malesuada. Integer id magna et ipsum cursus vestibulum. Mauris
67	76	3	Aliquam erat volutpat.	Nulla tempor augue ac ipsum. Phasellus	tristique neque venenatis
78	73	2	sed, est. Nunc laoreet lectus quis massa.	imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,	tempor arcu. Vestibulum ut
53	89	3	luctus ut, pellentesque eget, dictum placerat, augue.	sed orci lobortis	nulla. Integer vulputate, risus a ultricies
60	74	2	enim mi tempor lorem, eget mollis	lectus sit amet luctus vulputate, nisi sem semper erat,	egestas lacinia. Sed congue,
91	65	3	molestie tellus. Aenean egestas hendrerit neque. In	nulla at sem molestie sodales.	Sed neque. Sed eget lacus.
4	16	3	Proin vel arcu eu	augue malesuada malesuada. Integer id	aliquet diam. Sed diam lorem, auctor quis,
81	64	3	magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam	amet ante. Vivamus non lorem vitae odio sagittis	placerat. Cras
24	29	4	tempor, est ac mattis semper, dui lectus rutrum urna,	lobortis. Class aptent taciti sociosqu ad litora torquent per	facilisis vitae, orci. Phasellus dapibus quam quis diam.
7	62	1	dolor vitae dolor. Donec fringilla. Donec	dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum	lobortis mauris. Suspendisse aliquet molestie
15	95	4	cursus in, hendrerit consectetuer, cursus	dolor. Nulla	lobortis, nisi nibh lacinia
70	56	5	Cras eget nisi dictum augue malesuada malesuada.	sodales. Mauris blandit enim consequat purus. Maecenas libero	aliquam adipiscing lacus.
87	32	2	facilisi. Sed neque. Sed	dictum	gravida non, sollicitudin a, malesuada id,
45	66	4	arcu. Curabitur ut odio vel	In tincidunt congue turpis. In condimentum. Donec at	a purus. Duis elementum, dui
82	56	4	Maecenas mi felis, adipiscing	eros. Nam consequat dolor vitae dolor. Donec fringilla.	ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.
72	74	5	lectus justo	luctus et ultrices posuere cubilia Curae	nunc ac mattis
53	44	2	neque non quam. Pellentesque	lacinia at,	sem
52	55	3	sollicitudin a, malesuada	leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod	nulla magna, malesuada vel, convallis in, cursus et, eros.
44	56	2	et malesuada fames ac turpis egestas.	Sed molestie. Sed id risus quis diam luctus	Quisque ornare tortor at risus. Nunc ac sem ut dolor
73	61	3	vulputate mauris sagittis placerat.	Aliquam adipiscing lobortis risus. In mi pede,	mus. Proin vel arcu eu
14	17	2	egestas hendrerit neque. In	Nam tempor diam dictum sapien.	orci. Ut semper
14	12	5	tortor nibh sit	molestie tortor nibh	dui nec urna suscipit nonummy. Fusce fermentum fermentum
22	52	5	malesuada ut, sem. Nulla interdum. Curabitur dictum.	metus sit	dis parturient montes, nascetur ridiculus mus. Aenean eget magna.
46	26	5	sem, consequat nec, mollis vitae, posuere at, velit.	dolor dolor, tempus non,	Duis
30	92	2	posuere cubilia Curae Donec tincidunt.	Donec tempus, lorem fringilla ornare	vel lectus. Cum sociis natoque penatibus
74	64	5	urna suscipit nonummy. Fusce fermentum fermentum arcu.	sagittis. Nullam vitae diam. Proin dolor. Nulla	nibh sit amet orci. Ut
93	29	4	Morbi sit amet massa. Quisque porttitor eros	morbi tristique senectus	Curae Phasellus ornare. Fusce mollis.
37	67	1	scelerisque dui. Suspendisse ac metus vitae velit	Phasellus in felis. Nulla tempor	risus. Duis
5	10	4	suscipit, est ac facilisis facilisis, magna tellus	imperdiet, erat	elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non
95	67	3	id risus quis diam luctus lobortis. Class	ac mattis	faucibus leo, in lobortis tellus justo sit
75	34	4	in magna. Phasellus	ac tellus. Suspendisse	blandit at, nisi. Cum sociis natoque penatibus et magnis dis
12	97	4	Donec tincidunt. Donec	Nulla semper tellus id nunc	tristique senectus et netus et malesuada fames ac
66	99	3	non quam.	odio a purus. Duis elementum, dui quis accumsan	eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra
98	31	2	sem, vitae aliquam eros turpis non enim.	cursus. Integer mollis. Integer tincidunt aliquam arcu.	Curabitur massa. Vestibulum accumsan neque et nunc. Quisque
78	3	3	purus. Maecenas	malesuada fames ac turpis egestas. Fusce aliquet magna	nisi magna sed dui. Fusce aliquam, enim nec
2	76	2	elementum at, egestas a, scelerisque	vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris	congue. In scelerisque scelerisque dui. Suspendisse ac
58	58	1	volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.	Phasellus vitae mauris	magna, malesuada vel, convallis in, cursus
18	49	3	Suspendisse sed	metus. In lorem. Donec elementum, lorem ut	mauris sit amet lorem semper
41	14	5	lacus vestibulum lorem, sit	ornare egestas ligula. Nullam feugiat	sociosqu ad litora torquent per
69	55	2	arcu. Vestibulum ante ipsum primis in faucibus orci	quam, elementum at,	Vestibulum accumsan neque et nunc. Quisque ornare
20	20	3	Maecenas mi felis,	dis parturient montes,	vitae, posuere
30	22	2	eu enim. Etiam imperdiet dictum magna. Ut tincidunt	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor	lectus justo eu arcu. Morbi
21	27	3	nec, diam. Duis mi enim, condimentum eget, volutpat	Donec felis orci, adipiscing non,	velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum
57	2	2	cursus, diam	eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur	purus ac tellus. Suspendisse sed dolor. Fusce mi
23	59	4	ac, feugiat non,	Sed molestie. Sed id risus quis diam luctus lobortis. Class	vitae odio sagittis
22	13	3	Donec egestas.	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet	non magna.
32	54	2	Quisque varius. Nam	Proin nisl sem, consequat nec, mollis vitae,	Proin velit. Sed malesuada augue ut lacus. Nulla
81	1	1	risus, at	hendrerit. Donec porttitor tellus	dolor dolor, tempus non, lacinia
3	99	2	est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada	magna. Ut tincidunt orci quis	Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.
71	43	3	velit egestas lacinia. Sed congue,	nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.	amet, consectetuer
98	46	4	Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien	arcu. Morbi sit amet	mattis semper, dui lectus rutrum urna, nec luctus felis
5	35	1	ac turpis egestas. Fusce aliquet magna	nascetur ridiculus mus. Proin vel arcu eu	neque non quam. Pellentesque habitant morbi tristique senectus
\.


--
-- Data for Name: products_video; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.products_video (product_id, video_id) FROM stdin;
62	4
29	12
49	84
51	53
8	50
77	89
13	66
88	29
22	22
92	54
9	43
72	89
64	68
11	48
90	62
12	49
89	93
5	80
83	79
46	38
70	11
9	80
34	15
10	43
4	59
32	9
41	32
41	2
81	72
31	75
7	14
87	45
98	79
2	9
63	8
99	16
29	75
76	40
67	58
74	71
35	67
27	56
93	44
47	54
56	90
90	4
43	92
50	41
4	24
76	13
73	91
1	3
17	7
50	95
40	88
55	98
54	81
59	96
62	27
21	57
16	37
91	32
78	63
34	74
98	78
4	33
96	49
77	68
16	11
33	67
74	62
18	83
7	99
43	88
1	20
40	31
75	99
32	82
73	77
78	68
13	8
11	39
91	25
89	10
50	55
72	56
10	98
52	86
50	21
28	26
49	87
8	81
49	46
81	51
96	4
91	95
33	4
20	63
17	49
9	81
\.


--
-- Data for Name: refunds; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.refunds (id, user_id, date_refund, total_price) FROM stdin;
1	7	2023-04-16 07:19:32	98683
2	94	2022-05-26 02:17:44	84869
3	94	2022-10-23 04:50:54	11145
4	16	2023-08-31 10:12:38	11289
5	33	2023-05-19 12:44:00	11463
6	83	2022-10-14 04:12:36	19310
7	47	2022-04-19 04:13:37	7850
8	17	2022-10-02 00:56:13	34976
9	59	2022-07-16 05:29:18	39019
10	3	2022-07-24 19:16:08	75729
11	45	2022-06-04 00:09:01	55100
12	10	2023-06-12 22:34:42	38071
13	81	2023-06-11 22:26:31	46066
14	7	2023-09-03 21:33:55	97382
15	53	2022-01-08 04:29:40	48188
16	17	2023-11-09 04:30:29	64790
17	4	2022-09-26 16:00:44	39390
18	8	2022-07-31 22:42:08	92419
19	65	2023-04-29 18:23:17	67909
20	34	2023-08-06 14:04:33	28932
21	91	2023-04-05 18:08:46	32048
22	20	2022-12-20 12:39:42	2790
23	67	2023-09-27 01:34:51	50427
24	15	2022-05-27 13:06:45	23229
25	92	2023-06-11 10:52:41	30766
26	73	2023-10-12 14:42:46	33473
27	98	2022-07-28 01:33:42	32133
28	86	2022-11-11 12:24:03	1848
29	89	2022-11-20 22:59:25	15416
30	52	2022-12-07 13:53:19	9827
31	23	2023-10-07 20:16:34	23944
32	83	2022-04-16 05:05:27	97520
33	76	2023-04-11 05:52:55	70802
34	94	2023-11-14 19:59:03	27210
35	43	2022-03-24 15:52:13	40542
36	55	2023-06-23 07:02:52	90676
37	76	2022-11-19 23:25:58	2024
38	39	2022-01-19 14:27:31	58253
39	90	2022-07-12 06:43:05	601
40	86	2023-12-07 14:16:17	61449
41	95	2022-11-03 07:29:12	18484
42	30	2023-03-10 09:08:51	81665
43	79	2022-12-22 19:05:16	89814
44	63	2022-05-10 23:44:46	17751
45	83	2022-12-06 20:04:44	88321
46	99	2022-09-13 20:42:38	27538
47	17	2023-05-01 02:03:46	38677
48	19	2023-04-02 13:56:47	41354
49	16	2022-06-17 09:09:57	87164
50	55	2023-07-02 23:01:42	50259
51	24	2023-08-13 15:37:58	83208
52	12	2022-10-05 10:44:36	45768
53	57	2022-11-11 02:00:39	63826
54	10	2023-06-10 19:48:42	16053
55	48	2022-11-21 12:14:35	18386
56	89	2023-06-28 09:03:46	35064
57	36	2023-08-09 03:20:21	67109
58	60	2022-09-28 10:07:36	82548
59	76	2023-07-02 14:09:16	41757
60	62	2022-05-14 02:36:51	83236
61	26	2022-10-16 21:14:41	38942
62	24	2022-10-01 16:21:48	47876
63	68	2022-10-26 22:39:01	15094
64	34	2022-05-24 14:20:05	87056
65	100	2022-07-26 10:37:20	26617
66	27	2023-08-25 19:02:49	99375
67	21	2023-04-16 02:51:18	76056
68	47	2022-09-20 22:26:11	77179
69	9	2023-02-18 06:16:20	29325
70	88	2022-10-07 16:07:32	66685
71	83	2023-12-26 16:44:14	55286
72	77	2023-10-03 03:25:05	15866
73	27	2023-10-17 14:49:25	10351
74	34	2022-02-09 18:43:03	45040
75	52	2023-10-20 20:29:51	78535
76	70	2022-09-29 01:59:55	35180
77	68	2023-07-26 14:26:59	17195
78	57	2022-09-22 04:10:35	93410
79	86	2023-04-12 19:00:13	67708
80	83	2023-05-03 00:31:42	45766
81	35	2022-08-22 10:23:09	61285
82	31	2023-11-18 15:49:53	10559
83	84	2023-09-01 14:07:03	739
84	86	2023-08-10 09:32:44	99693
85	64	2022-12-11 00:32:49	71966
86	99	2022-04-01 08:21:15	69886
87	48	2023-07-24 09:41:29	84148
88	75	2023-09-26 16:17:26	42062
89	54	2024-01-03 01:49:45	58276
90	77	2023-12-25 17:46:09	85913
91	59	2022-03-11 03:32:14	60637
92	63	2023-12-21 09:56:08	73212
93	83	2023-02-07 01:52:37	77675
94	28	2022-11-28 05:42:56	4102
95	65	2023-01-18 18:50:17	8922
96	41	2023-03-19 10:48:45	2683
97	1	2023-03-10 20:39:45	70526
98	33	2022-01-27 19:11:15	76672
99	73	2023-12-18 15:21:42	63085
100	28	2023-04-02 08:07:39	81649
\.


--
-- Data for Name: refunds_products; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.refunds_products (refund_id, product_id, count) FROM stdin;
38	79	3
64	52	9
20	23	3
70	6	14
14	53	7
79	7	4
31	80	19
31	90	14
34	30	20
73	42	4
55	44	19
25	35	5
58	34	15
81	67	11
32	53	8
59	27	8
28	48	12
65	18	3
16	38	3
74	26	18
50	98	16
99	63	20
99	74	17
93	94	10
67	20	5
30	70	18
2	35	4
74	20	4
66	78	3
86	42	19
70	65	13
79	95	5
87	68	9
92	37	5
53	32	11
32	25	4
31	11	16
91	91	15
34	60	18
40	100	19
39	29	17
82	50	15
24	53	8
64	81	13
92	99	4
70	89	5
59	74	8
95	51	16
21	44	17
27	70	19
36	98	14
82	67	16
53	29	13
29	30	2
78	1	5
55	96	5
42	21	9
64	39	4
85	30	7
95	93	7
47	6	11
69	98	10
95	15	11
33	16	4
66	6	7
100	10	10
55	29	18
20	58	11
62	33	12
33	21	11
44	80	17
78	19	2
5	5	16
37	72	19
88	87	15
92	49	4
43	24	18
22	42	5
71	59	18
87	9	17
8	97	9
89	51	17
35	14	3
74	74	10
22	75	15
19	75	7
9	33	17
62	72	11
54	68	16
33	6	18
30	24	7
23	3	17
5	42	9
79	17	3
13	90	19
33	66	9
90	68	18
5	32	7
2	31	11
83	33	4
\.


--
-- Data for Name: status_orders; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.status_orders (id, status) FROM stdin;
1	СОЗДАНО
2	ПРИНЯТО В РАБОТУ
3	ПЕРЕДАНО В ДОСТАВКУ
4	ОЖИДАЕТ В ПУНКТЕ ВЫДАЧИ
5	ПОЛУЧЕНО
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.users (id, first_name, last_name, gender, email, phone, main_photo_id, created_at, birthday) FROM stdin;
101	Xenos	Barnett	1	ipsum@protonmail.edu	1-555-614-8843	93	2023-06-08 00:00:00	2013-08-26
102	Quintessa	Silva	2	donec.nibh@protonmail.ca	(664) 340-2862	85	2023-10-16 00:00:00	2001-10-28
103	Jessamine	Joyner	1	non.egestas@yahoo.edu	1-518-755-8133	71	2022-08-29 00:00:00	2014-07-13
104	Edan	Carpenter	1	vel.pede@protonmail.couk	(693) 574-3382	2	2023-02-14 00:00:00	1991-05-13
105	Nero	Chavez	2	sit.amet@outlook.edu	(508) 853-1609	59	2022-03-29 00:00:00	1997-07-04
106	Sasha	Orr	1	eu.elit.nulla@aol.couk	1-148-248-9517	66	2023-06-08 00:00:00	2004-07-31
107	Cairo	Christensen	2	ac@yahoo.couk	(466) 273-2858	84	2023-10-10 00:00:00	1998-11-27
108	Tyrone	Noble	2	integer@aol.com	1-834-544-7915	34	2023-01-03 00:00:00	2002-09-26
109	Clementine	Travis	1	feugiat.non.lobortis@google.edu	1-623-172-8443	58	2022-06-21 00:00:00	1998-08-28
110	Alfonso	Thomas	2	tristique.ac@hotmail.net	(751) 345-2245	35	2022-10-31 00:00:00	1999-03-11
111	Lysandra	Castaneda	2	nullam@aol.edu	1-637-829-7963	90	2023-02-03 00:00:00	1998-02-22
112	Aiko	Bullock	1	hendrerit.donec.porttitor@protonmail.org	(713) 192-4903	62	2023-09-29 00:00:00	2006-06-01
113	Porter	Wilkerson	1	posuere.enim@outlook.ca	(243) 454-7154	32	2023-04-17 00:00:00	1993-06-03
114	Tiger	Dickerson	2	tempus.mauris@icloud.org	1-854-513-4390	36	2023-09-29 00:00:00	2007-03-15
115	Kaye	Swanson	2	nunc.pulvinar@aol.edu	(719) 864-3317	28	2023-11-21 00:00:00	1992-02-06
116	Abdul	Bender	1	diam.eu.dolor@google.ca	1-384-843-3232	80	2022-02-14 00:00:00	2000-12-13
117	Elizabeth	Calderon	2	netus.et@protonmail.org	(540) 919-8802	50	2023-03-28 00:00:00	2012-06-26
118	Karen	Maddox	1	orci.adipiscing.non@hotmail.couk	1-881-243-7727	47	2023-05-23 00:00:00	1995-11-12
119	Kelly	Gates	2	eget.nisi@icloud.edu	1-599-665-4747	35	2022-09-12 00:00:00	2004-05-11
120	Alfreda	Gill	1	metus.vitae.velit@icloud.couk	1-412-818-4736	56	2022-05-29 00:00:00	2000-06-08
121	Aaron	Callahan	2	sed.eget@protonmail.com	(367) 490-3661	31	2023-09-23 00:00:00	2010-07-28
122	Inga	Sanford	2	lectus.pede@outlook.couk	(468) 819-8753	87	2022-04-09 00:00:00	2007-11-23
123	Prescott	Morgan	2	nonummy@protonmail.net	1-345-245-4879	57	2022-05-03 00:00:00	2014-10-28
124	Xyla	Hines	1	ante@icloud.ca	(262) 137-7716	6	2023-11-09 00:00:00	1991-04-19
125	Meredith	Atkins	2	sagittis.nullam@hotmail.ca	(846) 813-0424	82	2023-02-10 00:00:00	2008-05-12
126	Cyrus	Schroeder	2	fusce.aliquam@yahoo.ca	1-669-814-8873	96	2022-11-16 00:00:00	2015-01-12
127	Aimee	Armstrong	1	vitae.velit.egestas@icloud.org	1-214-840-4513	94	2022-04-22 00:00:00	2002-05-25
128	Craig	Gill	1	odio.tristique.pharetra@hotmail.net	1-853-772-8677	87	2022-07-09 00:00:00	2008-08-06
129	Shelley	Young	1	augue@outlook.com	1-805-388-1494	56	2023-08-24 00:00:00	2011-11-23
130	Armando	Rodgers	1	ac.facilisis@yahoo.couk	(775) 916-1839	4	2022-12-26 00:00:00	1999-09-16
131	Lacey	Owens	1	a@icloud.org	(529) 294-2552	87	2023-11-11 00:00:00	2009-02-07
132	Courtney	Holmes	1	consequat.lectus.sit@protonmail.com	(605) 892-1780	37	2023-08-11 00:00:00	2010-02-13
133	Farrah	James	1	malesuada.fames@yahoo.com	1-611-843-8194	3	2023-04-10 00:00:00	2015-09-18
134	Freya	Tyson	1	diam@outlook.edu	(775) 716-2058	41	2022-11-23 00:00:00	2000-11-12
135	Abbot	Leach	2	suspendisse@hotmail.couk	1-135-564-5681	51	2023-11-12 00:00:00	2008-01-28
136	Oliver	Welch	2	non.vestibulum@icloud.com	1-647-801-2344	17	2023-11-16 00:00:00	2015-05-15
137	Elmo	Crane	2	dictum.magna@hotmail.edu	(358) 667-8783	67	2023-01-13 00:00:00	1997-07-31
138	Hasad	Baxter	2	nunc.quis@icloud.org	1-534-456-7686	4	2022-08-01 00:00:00	1998-04-07
139	Burke	Flynn	2	fusce.aliquet@hotmail.org	(991) 184-6614	30	2022-05-06 00:00:00	2001-02-17
140	Victoria	Horn	1	sit.amet.ante@icloud.org	(683) 321-3363	72	2022-02-05 00:00:00	2003-11-01
141	Colleen	Stone	1	fringilla.cursus@google.net	1-571-613-9954	4	2022-08-05 00:00:00	1997-11-15
142	Denton	Ellison	1	a.malesuada@protonmail.couk	(846) 331-8421	22	2023-08-18 00:00:00	2003-11-30
143	Callie	Vance	2	at.velit.cras@aol.edu	(675) 811-8637	93	2022-07-22 00:00:00	2004-02-19
144	Declan	Pierce	1	proin@yahoo.org	1-723-630-5267	54	2022-06-01 00:00:00	1991-03-20
145	Hadassah	Mcknight	1	morbi.tristique.senectus@outlook.edu	(670) 592-4115	21	2023-08-28 00:00:00	2011-10-02
146	Charlotte	Davenport	1	gravida.mauris@icloud.org	1-789-782-6625	80	2023-12-10 00:00:00	2006-12-07
147	Isabella	Thomas	2	eu.arcu.morbi@yahoo.org	(898) 412-2438	48	2022-06-02 00:00:00	2014-01-04
148	Keane	Hopper	1	vitae.dolor.donec@outlook.org	1-114-274-5423	71	2022-07-07 00:00:00	2011-03-14
149	Stephen	Berry	2	non.arcu@protonmail.edu	1-845-257-3208	30	2022-09-12 00:00:00	2012-02-23
150	Clarke	Collins	1	non.enim@hotmail.couk	1-739-236-3758	61	2022-09-07 00:00:00	1995-08-28
151	Walker	Pratt	1	tempor.augue@yahoo.org	(416) 669-1512	100	2022-09-29 00:00:00	2008-03-29
152	Lucius	Sharpe	1	lectus.quis@google.couk	(632) 813-7036	45	2022-07-02 00:00:00	2007-12-17
153	Melvin	Gomez	1	adipiscing.elit@hotmail.ca	(993) 643-5283	60	2023-09-09 00:00:00	2007-05-30
154	Alfonso	Armstrong	1	dui.augue@icloud.net	1-364-763-3822	98	2023-09-06 00:00:00	1995-03-31
155	Phillip	Mayer	1	mauris.elit@hotmail.couk	1-184-473-1923	35	2022-12-27 00:00:00	2006-10-11
156	Piper	Hardy	1	dolor.nulla.semper@google.ca	1-480-603-4575	69	2022-07-12 00:00:00	2012-10-06
157	Harrison	Evans	2	consequat@outlook.com	(927) 753-7536	12	2023-11-03 00:00:00	2005-12-11
158	Beau	Rivera	1	justo.eu@icloud.couk	1-265-766-8041	89	2022-10-24 00:00:00	2014-05-08
159	Deanna	Gilbert	1	tempus.mauris@protonmail.ca	(179) 287-1014	52	2023-03-11 00:00:00	1997-07-19
160	Kibo	Mccullough	1	euismod.ac.fermentum@outlook.edu	(282) 767-6512	9	2022-12-15 00:00:00	1992-12-19
161	Ian	Riggs	2	luctus.ipsum@outlook.net	1-828-827-9310	65	2023-04-17 00:00:00	2011-11-27
162	Robert	Stafford	2	ullamcorper.duis@aol.couk	1-496-525-5288	69	2023-05-15 00:00:00	1995-09-03
163	Len	Cole	1	malesuada.integer.id@protonmail.com	(650) 482-6851	11	2022-07-04 00:00:00	2009-02-14
164	Jolene	Hunter	2	et.lacinia@yahoo.org	1-881-585-0439	80	2023-04-26 00:00:00	1993-12-31
165	Desirae	Durham	1	enim.condimentum.eget@outlook.edu	(257) 654-4805	78	2022-03-13 00:00:00	1997-12-13
166	Jonas	Tucker	1	enim.commodo@google.com	(821) 135-4347	53	2022-01-13 00:00:00	1991-12-03
167	Dorian	Flores	1	aliquet.molestie@yahoo.ca	(760) 464-1816	88	2022-10-18 00:00:00	2009-05-16
168	Alec	Strickland	2	mollis@aol.org	(445) 746-6463	68	2022-04-09 00:00:00	2015-05-14
169	Sydney	Peters	1	erat@protonmail.com	1-233-646-2366	54	2023-08-13 00:00:00	1992-08-07
170	Paula	Bauer	1	arcu.vestibulum@google.com	(420) 897-7347	5	2022-10-26 00:00:00	2009-10-07
171	Alisa	Henson	1	velit.eget@aol.net	(498) 656-6862	3	2022-07-27 00:00:00	2004-02-27
172	Orlando	Cervantes	2	ut.quam@outlook.net	(987) 448-2780	57	2023-09-16 00:00:00	2014-07-11
173	Keane	Daniels	1	tellus.eu@google.couk	(155) 636-4855	13	2022-04-21 00:00:00	2011-02-23
174	Fitzgerald	Pickett	1	mauris@hotmail.com	(663) 855-8927	38	2023-07-30 00:00:00	2002-03-24
175	Aidan	Briggs	1	libero.nec@aol.net	1-827-237-7138	29	2022-07-30 00:00:00	2001-01-27
176	Orla	Serrano	2	facilisis.eget@icloud.ca	1-482-483-8475	74	2022-12-29 00:00:00	2010-09-24
177	Chase	Cruz	2	ante.dictum@hotmail.com	1-438-570-7965	34	2023-12-10 00:00:00	2002-05-11
178	Autumn	Adkins	1	sapien.gravida@protonmail.edu	(771) 742-4651	57	2023-03-04 00:00:00	1996-11-11
179	Alec	Mills	1	a.magna@icloud.couk	1-643-212-1441	44	2024-01-04 00:00:00	1997-05-19
180	Carly	Harding	2	augue.id@outlook.ca	1-415-430-4526	52	2023-07-25 00:00:00	1997-12-15
181	Pamela	Bush	1	vivamus.nisi.mauris@hotmail.org	1-277-778-2756	29	2022-05-17 00:00:00	2007-07-31
182	Jolene	Baker	1	nisi@hotmail.couk	1-635-926-4415	8	2023-06-27 00:00:00	1992-11-02
183	Cassady	Garcia	1	luctus.et@outlook.com	1-144-660-1877	45	2023-10-19 00:00:00	1997-11-15
184	Patricia	Lindsay	2	venenatis.a@protonmail.net	(636) 928-7534	10	2022-03-02 00:00:00	2009-04-17
185	Lani	Willis	2	eget.massa@outlook.com	1-701-727-7616	43	2022-12-31 00:00:00	1992-12-01
186	Lane	Blair	2	class.aptent@hotmail.edu	(665) 587-3667	70	2023-08-17 00:00:00	1994-05-07
187	Fatima	Farrell	1	nunc.sit@hotmail.couk	1-144-447-4684	95	2022-01-24 00:00:00	2010-06-29
188	Chaim	Hampton	1	nunc.sed@yahoo.com	(233) 673-7715	26	2023-08-04 00:00:00	1997-12-10
189	Ahmed	Ross	1	quisque@yahoo.com	1-595-131-7178	98	2023-01-02 00:00:00	1999-06-26
190	Zephania	Woodward	1	cras.sed.leo@hotmail.couk	1-575-533-6437	57	2023-09-08 00:00:00	1995-04-06
191	Amal	Macdonald	1	nullam.vitae@protonmail.com	1-516-177-5578	79	2022-08-25 00:00:00	1997-11-08
192	Piper	Rasmussen	2	molestie@aol.com	1-883-115-7772	3	2023-06-05 00:00:00	1991-03-28
193	Denton	Douglas	1	arcu.curabitur@hotmail.couk	(614) 688-0016	76	2022-11-18 00:00:00	1993-09-25
194	Ora	Holmes	2	euismod.est.arcu@aol.org	1-810-687-2192	46	2023-07-11 00:00:00	2009-06-14
195	Mikayla	Delaney	2	auctor@icloud.net	(171) 192-6363	23	2022-04-23 00:00:00	2008-06-12
196	Avram	Shaffer	2	sagittis.nullam.vitae@protonmail.couk	(564) 514-6924	73	2023-05-18 00:00:00	2004-01-16
197	Wylie	Richards	2	malesuada.malesuada@hotmail.org	(487) 462-8435	37	2022-01-11 00:00:00	1999-11-14
198	Nasim	Greene	1	risus@yahoo.couk	1-503-830-7823	22	2023-12-05 00:00:00	1997-12-03
199	Murphy	Dunlap	1	ullamcorper.duis.cursus@google.edu	(147) 885-2464	66	2023-10-15 00:00:00	2007-09-24
200	Solomon	Valdez	1	ac@aol.org	1-786-969-4611	83	2023-12-22 00:00:00	1999-09-01
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: v_a_kuz
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://wikipedia.org/sub/cars?ab=441&aad=2	80	semper egestas, urna justo	2022-09-04 19:11:25	1982
2	https://youtube.com/sub/cars?p=8	98	Fusce aliquet magna a neque. Nullam ut	2023-08-18 13:19:59	4211
3	http://twitter.com/site?str=se	17	ut quam vel sapien imperdiet ornare. In faucibus.	2023-11-01 01:12:38	1578
4	http://reddit.com/group/9?client=g	13	Cras convallis convallis dolor. Quisque tincidunt pede ac urna.	2022-07-07 16:11:39	2638
5	http://twitter.com/user/110?q=11	97	sollicitudin a, malesuada	2022-11-06 10:01:51	3149
6	http://walmart.com/sub/cars?p=8	50	natoque penatibus et magnis dis parturient montes, nascetur	2022-11-18 03:05:15	994
7	https://google.com/en-us?q=11	16	nunc. Quisque ornare tortor at risus. Nunc ac sem ut	2023-04-24 15:40:01	2039
8	https://twitter.com/site?q=4	91	sed, facilisis	2023-08-16 14:07:14	3426
9	https://whatsapp.com/fr?search=1	37	sem eget	2022-06-02 11:31:48	3756
10	https://guardian.co.uk/site?page=1&offset=1	92	tincidunt adipiscing. Mauris	2023-03-13 14:48:16	4037
11	http://pinterest.com/en-ca?str=se	86	nascetur ridiculus mus. Donec dignissim magna a	2022-05-10 03:33:05	4306
12	https://zoom.us/sub?ab=441&aad=2	78	eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.	2022-05-30 20:23:22	4207
13	https://google.com/user/110?ad=115	4	ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed	2022-02-25 03:05:58	4475
14	http://cnn.com/sub?q=11	7	eu eros. Nam	2022-09-07 07:30:08	3336
15	http://whatsapp.com/en-us?p=8	79	In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.	2023-06-25 19:49:18	1365
16	http://facebook.com/settings?g=1	16	dolor sit	2023-01-10 03:23:57	3977
17	http://walmart.com/sub/cars?search=1&q=de	95	nulla ante, iaculis nec,	2023-07-21 18:07:08	305
18	http://nytimes.com/sub?k=0	20	diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.	2023-07-06 09:54:21	3111
19	https://guardian.co.uk/group/9?str=se	77	ligula tortor, dictum eu,	2022-09-28 10:50:35	3058
20	https://facebook.com/sub?q=0	69	sociis natoque	2022-01-16 13:44:38	1260
21	http://baidu.com/sub?q=11	20	nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim	2023-12-22 16:01:57	3947
22	https://guardian.co.uk/sub?str=se	65	facilisis vitae, orci. Phasellus dapibus quam	2022-09-07 02:51:13	1282
23	https://facebook.com/settings?ad=115	38	Proin dolor. Nulla semper	2023-08-08 16:11:35	4463
24	http://pinterest.com/en-us?q=0	12	convallis dolor. Quisque tincidunt	2022-12-05 05:12:00	293
25	http://whatsapp.com/group/9?search=1&q=de	81	Nunc quis arcu vel quam dignissim pharetra. Nam ac	2022-08-23 23:05:37	3953
26	https://google.com/group/9?q=test	87	mollis lectus pede et risus.	2023-10-29 22:22:19	4657
27	http://nytimes.com/en-us?q=0	5	vitae mauris sit amet lorem semper	2023-03-24 09:25:06	215
28	http://baidu.com/fr?client=g	34	nec luctus felis purus ac tellus. Suspendisse sed	2022-02-11 19:24:38	432
29	https://bbc.co.uk/fr?page=1&offset=1	1	neque sed dictum eleifend, nunc risus varius orci, in	2023-10-16 07:42:13	587
30	http://google.com/fr?q=11	60	sed sem egestas blandit. Nam nulla magna, malesuada vel,	2023-03-17 13:22:57	4907
31	https://facebook.com/sub?search=1&q=de	87	vitae odio sagittis semper. Nam tempor	2022-02-28 02:39:36	3934
32	http://yahoo.com/site?gi=100	3	est, vitae sodales nisi magna sed dui. Fusce	2022-10-04 01:37:29	956
33	https://google.com/group/9?client=g	12	Donec tempus, lorem fringilla ornare placerat, orci lacus	2022-12-14 13:34:24	597
34	http://nytimes.com/group/9?p=8	86	ac arcu. Nunc mauris. Morbi non sapien	2023-03-18 11:37:33	2078
35	http://nytimes.com/one?q=11	5	Sed neque. Sed eget lacus. Mauris	2022-06-24 22:40:14	4314
36	https://bbc.co.uk/site?search=1&q=de	61	ornare,	2023-11-14 11:25:30	675
37	http://whatsapp.com/settings?str=se	99	at augue id ante dictum	2023-03-03 08:15:12	244
38	https://twitter.com/group/9?page=1&offset=1	67	Nam tempor diam dictum	2022-08-25 01:08:25	3081
39	https://google.com/one?str=se	24	porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla	2023-06-02 19:48:41	1752
40	https://walmart.com/sub?g=1	63	Integer tincidunt aliquam arcu.	2022-05-15 16:40:18	219
41	http://walmart.com/group/9?k=0	84	purus ac	2022-07-13 06:49:17	2686
42	https://guardian.co.uk/group/9?q=0	25	mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,	2023-10-09 16:32:24	3253
43	https://walmart.com/user/110?ab=441&aad=2	15	nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque	2023-01-20 00:00:59	3899
44	http://netflix.com/sub?q=11	80	semper,	2022-11-30 16:01:26	3466
45	http://ebay.com/site?q=test	90	metus. Aliquam erat volutpat. Nulla facilisis.	2023-07-06 15:28:13	2730
46	https://facebook.com/site?g=1	37	id ante dictum cursus. Nunc mauris elit, dictum eu,	2023-03-30 16:32:45	2241
47	https://ebay.com/group/9?p=8	73	malesuada vel, convallis in, cursus et, eros. Proin ultrices.	2023-04-30 07:07:55	3937
48	http://naver.com/en-us?ad=115	88	amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer	2023-07-13 10:02:55	315
49	https://whatsapp.com/en-us?q=4	94	consectetuer, cursus et, magna. Praesent interdum ligula eu enim.	2022-01-14 18:27:28	2877
50	https://google.com/site?client=g	8	cursus et, eros. Proin ultrices. Duis volutpat nunc	2023-10-02 14:37:54	2309
51	https://bbc.co.uk/user/110?page=1&offset=1	24	arcu.	2023-10-02 04:56:11	2726
52	http://nytimes.com/one?q=4	96	orci sem eget massa. Suspendisse eleifend. Cras sed	2022-03-01 17:08:42	2877
53	http://baidu.com/user/110?g=1	60	vitae dolor. Donec fringilla. Donec feugiat metus sit amet	2022-11-06 19:04:19	2044
54	https://whatsapp.com/en-us?p=8	9	ante dictum mi, ac mattis velit justo nec	2022-02-16 05:32:47	3081
55	https://google.com/settings?q=11	79	scelerisque scelerisque dui. Suspendisse	2022-03-17 18:59:32	2293
56	http://whatsapp.com/fr?q=test	40	vestibulum. Mauris magna. Duis dignissim tempor arcu.	2023-03-25 18:34:14	1435
57	http://yahoo.com/site?g=1	53	Fusce aliquet magna a	2022-02-14 01:39:01	624
58	http://cnn.com/user/110?k=0	5	ut, molestie in, tempus eu,	2022-02-11 04:14:00	16
59	https://guardian.co.uk/en-ca?search=1&q=de	61	Sed nulla ante, iaculis	2022-12-23 02:04:11	1223
60	http://instagram.com/en-ca?str=se	32	ac	2022-10-18 13:28:59	1914
61	http://pinterest.com/sub/cars?ab=441&aad=2	88	nec mauris blandit mattis. Cras eget nisi dictum augue malesuada	2023-09-15 20:04:11	4205
62	https://twitter.com/group/9?ad=115	68	mauris eu elit. Nulla facilisi. Sed neque. Sed eget	2022-08-31 04:41:44	2607
63	https://walmart.com/en-us?str=se	6	vitae purus gravida	2023-05-18 23:45:04	1728
64	http://nytimes.com/site?q=11	48	ornare placerat, orci	2023-07-14 03:08:38	2660
65	http://reddit.com/en-us?g=1	7	convallis erat, eget tincidunt dui augue eu tellus. Phasellus	2022-05-10 17:49:34	4245
66	http://instagram.com/one?k=0	85	Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.	2023-09-10 05:29:36	3162
67	http://reddit.com/site?g=1	68	ut, molestie in,	2024-01-03 11:55:24	445
68	http://baidu.com/group/9?search=1	27	augue scelerisque	2023-07-13 12:28:39	3142
69	http://facebook.com/en-ca?client=g	10	ante, iaculis nec, eleifend non, dapibus rutrum, justo.	2022-03-13 04:39:06	1476
70	https://bbc.co.uk/en-us?p=8	91	mauris id sapien. Cras	2022-08-05 02:15:53	1436
71	http://reddit.com/site?search=1	63	lorem tristique aliquet. Phasellus fermentum convallis ligula.	2023-07-11 11:27:46	549
72	http://bbc.co.uk/sub/cars?q=test	39	vel lectus. Cum sociis	2023-11-28 02:51:49	1955
73	https://zoom.us/sub/cars?p=8	81	scelerisque, lorem ipsum sodales purus, in	2023-08-29 23:56:25	3866
74	https://zoom.us/sub?q=test	27	at arcu. Vestibulum ante	2023-08-12 13:15:21	1405
75	http://zoom.us/user/110?page=1&offset=1	100	tempus eu, ligula.	2022-07-12 06:18:11	2426
76	http://walmart.com/user/110?k=0	36	mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus	2022-07-22 20:04:52	4896
77	http://facebook.com/site?p=8	35	augue eu tellus. Phasellus elit pede, malesuada	2022-04-25 14:42:40	3010
78	https://nytimes.com/fr?gi=100	1	ultricies dignissim lacus. Aliquam rutrum lorem ac risus.	2022-03-03 06:28:20	1782
79	https://nytimes.com/en-us?k=0	12	ultricies ligula. Nullam enim. Sed	2023-07-19 20:50:51	4639
80	https://pinterest.com/settings?client=g	64	congue turpis. In condimentum. Donec at	2022-06-13 08:43:29	3792
81	https://instagram.com/sub?q=test	62	vitae semper egestas, urna justo faucibus	2022-05-06 12:54:09	1555
82	https://facebook.com/user/110?client=g	85	eu erat semper rutrum.	2022-03-16 02:06:36	4182
83	http://wikipedia.org/one?search=1&q=de	74	ipsum. Donec sollicitudin adipiscing ligula.	2023-02-03 22:48:48	2564
84	https://zoom.us/group/9?search=1&q=de	35	pede, ultrices a, auctor non, feugiat nec,	2022-05-04 19:35:57	2514
85	https://nytimes.com/sub/cars?q=0	6	nec, leo. Morbi neque tellus, imperdiet non,	2022-11-22 04:21:31	1139
86	https://ebay.com/one?q=0	85	non massa non	2022-08-12 11:56:33	321
87	https://yahoo.com/fr?str=se	89	Suspendisse eleifend. Cras sed leo.	2022-08-05 00:10:40	1208
88	https://zoom.us/en-us?ab=441&aad=2	49	mus. Proin vel nisl. Quisque fringilla euismod	2022-02-19 20:50:33	3050
89	https://guardian.co.uk/fr?q=test	57	id enim. Curabitur	2022-08-22 04:11:34	4277
90	http://zoom.us/en-us?p=8	85	in faucibus orci luctus et ultrices posuere cubilia	2023-01-23 11:25:03	4497
91	http://instagram.com/en-ca?ad=115	89	et netus et malesuada fames ac turpis egestas. Aliquam fringilla	2022-06-06 21:46:03	608
92	http://guardian.co.uk/site?ab=441&aad=2	13	aliquam adipiscing lacus. Ut nec urna et arcu imperdiet	2023-08-01 04:22:55	1927
93	https://wikipedia.org/en-us?page=1&offset=1	42	dolor dapibus gravida. Aliquam tincidunt, nunc	2023-01-22 14:31:08	101
94	http://twitter.com/en-us?p=8	87	nisi a odio semper cursus. Integer mollis.	2022-02-02 09:06:58	3727
95	http://pinterest.com/group/9?g=1	1	amet risus. Donec egestas. Aliquam nec enim. Nunc ut	2023-02-19 02:45:50	3323
96	http://facebook.com/group/9?search=1	48	lectus. Cum	2023-04-16 21:46:30	4058
97	https://whatsapp.com/sub?p=8	71	nunc ac mattis ornare, lectus	2022-04-29 00:34:02	4807
98	http://cnn.com/one?gi=100	68	hendrerit neque. In ornare sagittis felis. Donec tempor,	2022-10-02 22:10:37	4617
99	http://zoom.us/one?search=1	50	erat semper rutrum. Fusce dolor quam,	2022-10-13 00:40:36	1581
100	https://baidu.com/sub?ad=115	40	Nunc commodo auctor velit. Aliquam nisl.	2023-07-17 14:02:46	3810
\.


--
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.genders_id_seq', 2, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.orders_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.photo_id_seq', 466, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 100, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.products_id_seq', 100, true);


--
-- Name: refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.refunds_id_seq', 100, true);


--
-- Name: status_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.status_orders_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.users_id_seq', 200, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v_a_kuz
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_number, owner_id);


--
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo_products photo_products_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.photo_products
    ADD CONSTRAINT photo_products_pkey PRIMARY KEY (product_id, photo_id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_reviews products_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.products_reviews
    ADD CONSTRAINT products_reviews_pkey PRIMARY KEY (user_id, product_id);


--
-- Name: products_video products_video_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.products_video
    ADD CONSTRAINT products_video_pkey PRIMARY KEY (product_id, video_id);


--
-- Name: refunds refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);


--
-- Name: status_orders status_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.status_orders
    ADD CONSTRAINT status_orders_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: v_a_kuz
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

