--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(8) NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT chk_email0 CHECK ((email ~~ '%_@__%.__%'::text))
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (23, 3, 'JwyOdHxcsMdCG4pRNGp_FianuzKWWba-32JyPQiHajbpah1MmB', '2022-12-18 16:36:07.557315');
INSERT INTO public.sessions VALUES (24, 3, 'oCerVfJRUTFb7QWtnUKaW-0kzW8COSsZrlF4c4CzK3nFL6JWXv', '2022-12-18 16:36:08.122235');
INSERT INTO public.sessions VALUES (25, 3, 'j6h0i9OcZ2EhbNNsdy8Pq5A_STd97HmQYIKZwFMMHtcCP7DxWy', '2022-12-18 16:36:08.904858');
INSERT INTO public.sessions VALUES (26, 5, 'leivUHBW8rGpLZovjtGpVM1rURpNxjxwXNbT4V1OeWtChVG70o', '2022-12-18 16:36:14.22315');
INSERT INTO public.sessions VALUES (27, 5, '_JCngPeVmYHzY52K5ai6EAKuorIF7eI2FzxFG8iRzLOSoHNum1', '2022-12-18 16:36:14.898609');
INSERT INTO public.sessions VALUES (28, 2, 'C9bi7-HI6pPN2pQpQdQOOjJz2vROD64Vb0UiLlYGCTCorSY1Uk', '2022-12-18 16:36:18.612098');
INSERT INTO public.sessions VALUES (29, 2, 'MaOC2PRmxs_ECLhtt1OW6fFUQe9S484UsX0cI_vXFiWu0-KWB8', '2022-12-18 16:36:19.220887');
INSERT INTO public.sessions VALUES (30, 3, '9f-2MXVR9LKL3V_7KN7pduq8oj7iPE2BhG-kR3QEheHD5R-AF3', '2022-12-18 16:36:25.83419');
INSERT INTO public.sessions VALUES (31, 3, '9odIUQU6wP8JBGD0yJktJoM9z92OSkcApLrwqN2HmKFBlToq5Z', '2022-12-18 16:36:26.439788');
INSERT INTO public.sessions VALUES (32, 3, 'qUK85a4HmS5430rBs1pvYszdXbeJI1atyf_CW25F9UXFTGcj4B', '2022-12-18 16:36:27.078843');
INSERT INTO public.sessions VALUES (33, 4, 'q-hlCkKAAE4_5tiwhecGDsUHiWsbIsSnOLyW_AK6FNz3uyWNe0', '2022-12-18 16:36:30.943578');
INSERT INTO public.sessions VALUES (34, 3, 'gl7OpOsfTplmVomHAFGcbX-V5jl1wVLvvQZo_FFSpI6Zkw3mmy', '2022-12-18 16:36:35.218449');
INSERT INTO public.sessions VALUES (35, 5, 'DY9tvkcPhjYJaK1yclEBGIr6u6XkBRCEOnF-bSrTBphlfH3JlU', '2022-12-18 16:36:40.765819');
INSERT INTO public.sessions VALUES (36, 4, '9KcBjgNUB3423r8liSyDFtP9Cmz15zS8gG2FTlqrnIgtq_uhpJ', '2022-12-18 16:40:11.641313');
INSERT INTO public.sessions VALUES (37, 1, '0Rfn8kr_rPQ6S0J_b0QOna2P5s-OlYGzzev43WPaCfTRrc6SsG', '2022-12-18 17:59:49.776946');
INSERT INTO public.sessions VALUES (38, 9, 'NkavcRKcBsGTW6n68CymCmkYyvn76AXSfFLuFdLxo5Ul-XSdH7', '2022-12-20 00:34:29.412273');
INSERT INTO public.sessions VALUES (39, 6, 'SPSuu9xsizv8a1Bj51bOV8IedNBW9peL35VoPgdT99udddN-m7', '2022-12-20 00:37:05.559582');
INSERT INTO public.sessions VALUES (40, 8, 'jKIN0OZPtmbwnIQBDNtlN_liArqqUSKkE5plB1HdGIypXaI1Ts', '2022-12-20 00:39:50.854244');
INSERT INTO public.sessions VALUES (41, 10, 'bunTZGCkIHk0BbsGZYQpRSt5ANLTBxEx_uRc1h8ynqXsswXa0w', '2022-12-20 00:41:30.824497');
INSERT INTO public.sessions VALUES (42, 10, 'MffuWFal68rQ12rQxptSN5HrbS98YmHwAOvwuEb3GceaXVtbED', '2022-12-21 01:06:51.512082');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 3, 'http://www.g1.com', 'sDOCA0qM', 2, '2022-12-18 17:58:33.578803');
INSERT INTO public.urls VALUES (5, 4, 'http://www.petrobras.com.br', 'ssA8Ls-m', 2, '2022-12-18 18:02:06.083274');
INSERT INTO public.urls VALUES (6, 2, 'https://erickssguerra.github.io/projeto3-driveneats/', 'RxZ82A2z', 5, '2022-12-18 20:34:36.43184');
INSERT INTO public.urls VALUES (7, 3, 'http://linkedin.com/in/erickssguerra', 'vPahEeAM', 0, '2022-12-18 21:57:39.27659');
INSERT INTO public.urls VALUES (8, 9, 'https://www.youtube.com/watch?v=Uc1ClDMoeJM', 'cq_raawz', 0, '2022-12-20 00:36:03.710751');
INSERT INTO public.urls VALUES (10, 6, 'https://www.youtube.com/watch?v=4QatmiF4GJM', 'pxQ2pt-t', 0, '2022-12-20 00:37:36.760466');
INSERT INTO public.urls VALUES (11, 6, 'https://app.sli.do/event/jBGFmixC2QGmjMV6AAMyz6/live/questions', 'TQh2Ftsr', 0, '2022-12-20 00:39:16.722472');
INSERT INTO public.urls VALUES (12, 8, 'https://www.notion.so/bootcampra/Materiais-5d1fe6e0d1764b0e94ed6b0a65827c98', 'QToEVErt', 0, '2022-12-20 00:40:19.405958');
INSERT INTO public.urls VALUES (13, 8, 'https://www.notion.so/bootcampra/Projeto-Shortly-API-3ef2afe78c254d069f862c036efa6f04', 'm8in9wpO', 0, '2022-12-20 00:40:42.123329');
INSERT INTO public.urls VALUES (15, 10, 'https://www.notion.so/bootcampra/Quinta-08-12-Postgres-Express-e-CRUD-completo-3744b20e8009462c83934bb047331998', 'zYdQ_fpa', 0, '2022-12-20 00:42:38.267099');
INSERT INTO public.urls VALUES (9, 9, 'https://www.youtube.com/watch?v=4QatmiF4GJM', 'ZGPv85ug', 3, '2022-12-20 00:36:50.981243');
INSERT INTO public.urls VALUES (14, 10, 'https://www.notion.so/bootcampra/Falha-na-cria-o-autom-tica-do-banco-de-dados-e-tabelas-e83ce3f4cef44a19a61a4fa82bd4742f', '_manQR1H', 12, '2022-12-20 00:42:00.193652');
INSERT INTO public.urls VALUES (4, 1, 'http://www.g1.com', 'wLvSlBu_', 8, '2022-12-18 18:00:21.382554');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Erika', 'erika@gmail.com', '$2b$10$2p2fPIsNlIa3zoWmsU/JF.Ooh.qI1jaIDEnkGQve.ZyoQ7Y56IzGy', '2022-12-18 15:06:25.242274');
INSERT INTO public.users VALUES (2, 'Jose', 'jose@gmail.com', '$2b$10$.QkFx0jUMZqzfey3PHHVV.CK1vh/HRsZBMoPa/xvrzYesW6DYiEDu', '2022-12-18 15:06:36.655751');
INSERT INTO public.users VALUES (3, 'Erick', 'erick@gmail.com', '$2b$10$ChibC.GflhPhm9q3NDKCQuBgw3Ye6D3yYjJsQLUExtFWlXk8qJafK', '2022-12-18 15:06:45.455576');
INSERT INTO public.users VALUES (4, 'Berg', 'berg@gmail.com', '$2b$10$rQkKlDyi7BSUCyBTQ1w5JO0XA9QoDuKiWLKffw/BghqdjU3wJmkCO', '2022-12-18 15:06:54.64018');
INSERT INTO public.users VALUES (5, 'Davi', 'davi@gmail.com', '$2b$10$5OIkkuzU8c0uxSyrrKeuPO54TOvM2YxlB86SL5eRYfr/R06.DhiaK', '2022-12-18 15:07:02.057156');
INSERT INTO public.users VALUES (6, 'Igor', 'igor@gmail.com', '$2b$10$GKzh/.8PNVbmU4dWnMVhrOqXavJkRrsibOpSPRjvetGMUnE24osFO', '2022-12-20 00:33:44.912547');
INSERT INTO public.users VALUES (7, 'Alysson', 'alysson@gmail.com', '$2b$10$pmciwTvb3YasxmsJI3jvCezC3ro7Rz1FPBLI1uAnfRBk6KA.w6wwO', '2022-12-20 00:34:04.804763');
INSERT INTO public.users VALUES (8, 'Esdras', 'esdras@gmail.com', '$2b$10$mRD3EHLHvYrEoPhb/soqIuPxq2uvlAmuzLQXapxKAx/05i0fiepc.', '2022-12-20 00:34:11.815139');
INSERT INTO public.users VALUES (9, 'Pedro', 'pedro@gmail.com', '$2b$10$DnOCnDkRPzmLm3WHcz.SmOraerSq91mlOwTKkeMYcN5NKfUBINMoa', '2022-12-20 00:34:18.978617');
INSERT INTO public.users VALUES (10, 'Lucas', 'lucas@gmail.com', '$2b$10$0XCNWcnP1mvGsyVUx/hxA.8UqKHnEajzQPbIEYvR7fzdExkUQeYCy', '2022-12-20 00:41:26.889894');
INSERT INTO public.users VALUES (11, 'Pedrola', 'pedrola@gmail.com', '$2b$10$dOvLsUXrxGUg/zyhlkClfOhwfHucRlAEBy5Cy57.6VYPKJdzvPmem', '2022-12-21 00:18:18.844093');
INSERT INTO public.users VALUES (12, 'Esdrinhas', 'esdrinhas@gmail.com', '$2b$10$Vq5py3ink8GtRVePFnwi3OV6YS/D9C9tCKSrNVk9doIkOidHTxwmO', '2022-12-21 00:42:25.562521');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 42, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

