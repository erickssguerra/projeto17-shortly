--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 15.0

-- Started on 2022-12-21 01:47:46 -03

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

DROP DATABASE "shortly";
--
-- TOC entry 3624 (class 1262 OID 17668)
-- Name: shortly; Type: DATABASE; Schema: -; Owner: erickguerra
--

CREATE DATABASE "shortly" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "shortly" OWNER TO "erickguerra";

\connect "shortly"

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: erickguerra
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA "public" OWNER TO "erickguerra";

--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: erickguerra
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- TOC entry 212 (class 1259 OID 17682)
-- Name: sessions; Type: TABLE; Schema: public; Owner: erickguerra
--

CREATE TABLE "public"."sessions" (
    "id" integer NOT NULL,
    "userId" integer NOT NULL,
    "token" "text" NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."sessions" OWNER TO "erickguerra";

--
-- TOC entry 211 (class 1259 OID 17681)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: erickguerra
--

CREATE SEQUENCE "public"."sessions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."sessions_id_seq" OWNER TO "erickguerra";

--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 211
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erickguerra
--

ALTER SEQUENCE "public"."sessions_id_seq" OWNED BY "public"."sessions"."id";


--
-- TOC entry 214 (class 1259 OID 17697)
-- Name: urls; Type: TABLE; Schema: public; Owner: erickguerra
--

CREATE TABLE "public"."urls" (
    "id" integer NOT NULL,
    "userId" integer NOT NULL,
    "url" "text" NOT NULL,
    "shortUrl" character varying(8) NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."urls" OWNER TO "erickguerra";

--
-- TOC entry 213 (class 1259 OID 17696)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: erickguerra
--

CREATE SEQUENCE "public"."urls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."urls_id_seq" OWNER TO "erickguerra";

--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 213
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erickguerra
--

ALTER SEQUENCE "public"."urls_id_seq" OWNED BY "public"."urls"."id";


--
-- TOC entry 210 (class 1259 OID 17670)
-- Name: users; Type: TABLE; Schema: public; Owner: erickguerra
--

CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    "email" "text" NOT NULL,
    "password" "text" NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "chk_email0" CHECK (("email" ~~ '%_@__%.__%'::"text"))
);


ALTER TABLE "public"."users" OWNER TO "erickguerra";

--
-- TOC entry 209 (class 1259 OID 17669)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: erickguerra
--

CREATE SEQUENCE "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."users_id_seq" OWNER TO "erickguerra";

--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erickguerra
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- TOC entry 3458 (class 2604 OID 17685)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."sessions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."sessions_id_seq"'::"regclass");


--
-- TOC entry 3460 (class 2604 OID 17700)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."urls" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."urls_id_seq"'::"regclass");


--
-- TOC entry 3456 (class 2604 OID 17673)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- TOC entry 3616 (class 0 OID 17682)
-- Dependencies: 212
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: erickguerra
--

INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (23, 3, 'JwyOdHxcsMdCG4pRNGp_FianuzKWWba-32JyPQiHajbpah1MmB', '2022-12-18 16:36:07.557315');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (24, 3, 'oCerVfJRUTFb7QWtnUKaW-0kzW8COSsZrlF4c4CzK3nFL6JWXv', '2022-12-18 16:36:08.122235');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (25, 3, 'j6h0i9OcZ2EhbNNsdy8Pq5A_STd97HmQYIKZwFMMHtcCP7DxWy', '2022-12-18 16:36:08.904858');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (26, 5, 'leivUHBW8rGpLZovjtGpVM1rURpNxjxwXNbT4V1OeWtChVG70o', '2022-12-18 16:36:14.22315');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (27, 5, '_JCngPeVmYHzY52K5ai6EAKuorIF7eI2FzxFG8iRzLOSoHNum1', '2022-12-18 16:36:14.898609');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (28, 2, 'C9bi7-HI6pPN2pQpQdQOOjJz2vROD64Vb0UiLlYGCTCorSY1Uk', '2022-12-18 16:36:18.612098');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (29, 2, 'MaOC2PRmxs_ECLhtt1OW6fFUQe9S484UsX0cI_vXFiWu0-KWB8', '2022-12-18 16:36:19.220887');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (30, 3, '9f-2MXVR9LKL3V_7KN7pduq8oj7iPE2BhG-kR3QEheHD5R-AF3', '2022-12-18 16:36:25.83419');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (31, 3, '9odIUQU6wP8JBGD0yJktJoM9z92OSkcApLrwqN2HmKFBlToq5Z', '2022-12-18 16:36:26.439788');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (32, 3, 'qUK85a4HmS5430rBs1pvYszdXbeJI1atyf_CW25F9UXFTGcj4B', '2022-12-18 16:36:27.078843');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (33, 4, 'q-hlCkKAAE4_5tiwhecGDsUHiWsbIsSnOLyW_AK6FNz3uyWNe0', '2022-12-18 16:36:30.943578');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (34, 3, 'gl7OpOsfTplmVomHAFGcbX-V5jl1wVLvvQZo_FFSpI6Zkw3mmy', '2022-12-18 16:36:35.218449');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (35, 5, 'DY9tvkcPhjYJaK1yclEBGIr6u6XkBRCEOnF-bSrTBphlfH3JlU', '2022-12-18 16:36:40.765819');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (36, 4, '9KcBjgNUB3423r8liSyDFtP9Cmz15zS8gG2FTlqrnIgtq_uhpJ', '2022-12-18 16:40:11.641313');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (37, 1, '0Rfn8kr_rPQ6S0J_b0QOna2P5s-OlYGzzev43WPaCfTRrc6SsG', '2022-12-18 17:59:49.776946');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (38, 9, 'NkavcRKcBsGTW6n68CymCmkYyvn76AXSfFLuFdLxo5Ul-XSdH7', '2022-12-20 00:34:29.412273');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (39, 6, 'SPSuu9xsizv8a1Bj51bOV8IedNBW9peL35VoPgdT99udddN-m7', '2022-12-20 00:37:05.559582');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (40, 8, 'jKIN0OZPtmbwnIQBDNtlN_liArqqUSKkE5plB1HdGIypXaI1Ts', '2022-12-20 00:39:50.854244');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (41, 10, 'bunTZGCkIHk0BbsGZYQpRSt5ANLTBxEx_uRc1h8ynqXsswXa0w', '2022-12-20 00:41:30.824497');
INSERT INTO "public"."sessions" ("id", "userId", "token", "createdAt") VALUES (42, 10, 'MffuWFal68rQ12rQxptSN5HrbS98YmHwAOvwuEb3GceaXVtbED', '2022-12-21 01:06:51.512082');


--
-- TOC entry 3618 (class 0 OID 17697)
-- Dependencies: 214
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: erickguerra
--

INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (3, 3, 'http://www.g1.com', 'sDOCA0qM', 2, '2022-12-18 17:58:33.578803');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (5, 4, 'http://www.petrobras.com.br', 'ssA8Ls-m', 2, '2022-12-18 18:02:06.083274');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (6, 2, 'https://erickssguerra.github.io/projeto3-driveneats/', 'RxZ82A2z', 5, '2022-12-18 20:34:36.43184');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (7, 3, 'http://linkedin.com/in/erickssguerra', 'vPahEeAM', 0, '2022-12-18 21:57:39.27659');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (8, 9, 'https://www.youtube.com/watch?v=Uc1ClDMoeJM', 'cq_raawz', 0, '2022-12-20 00:36:03.710751');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (10, 6, 'https://www.youtube.com/watch?v=4QatmiF4GJM', 'pxQ2pt-t', 0, '2022-12-20 00:37:36.760466');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (11, 6, 'https://app.sli.do/event/jBGFmixC2QGmjMV6AAMyz6/live/questions', 'TQh2Ftsr', 0, '2022-12-20 00:39:16.722472');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (12, 8, 'https://www.notion.so/bootcampra/Materiais-5d1fe6e0d1764b0e94ed6b0a65827c98', 'QToEVErt', 0, '2022-12-20 00:40:19.405958');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (13, 8, 'https://www.notion.so/bootcampra/Projeto-Shortly-API-3ef2afe78c254d069f862c036efa6f04', 'm8in9wpO', 0, '2022-12-20 00:40:42.123329');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (15, 10, 'https://www.notion.so/bootcampra/Quinta-08-12-Postgres-Express-e-CRUD-completo-3744b20e8009462c83934bb047331998', 'zYdQ_fpa', 0, '2022-12-20 00:42:38.267099');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (9, 9, 'https://www.youtube.com/watch?v=4QatmiF4GJM', 'ZGPv85ug', 3, '2022-12-20 00:36:50.981243');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (14, 10, 'https://www.notion.so/bootcampra/Falha-na-cria-o-autom-tica-do-banco-de-dados-e-tabelas-e83ce3f4cef44a19a61a4fa82bd4742f', '_manQR1H', 12, '2022-12-20 00:42:00.193652');
INSERT INTO "public"."urls" ("id", "userId", "url", "shortUrl", "visitCount", "createdAt") VALUES (4, 1, 'http://www.g1.com', 'wLvSlBu_', 8, '2022-12-18 18:00:21.382554');


--
-- TOC entry 3614 (class 0 OID 17670)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: erickguerra
--

INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (1, 'Erika', 'erika@gmail.com', '$2b$10$2p2fPIsNlIa3zoWmsU/JF.Ooh.qI1jaIDEnkGQve.ZyoQ7Y56IzGy', '2022-12-18 15:06:25.242274');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (2, 'Jose', 'jose@gmail.com', '$2b$10$.QkFx0jUMZqzfey3PHHVV.CK1vh/HRsZBMoPa/xvrzYesW6DYiEDu', '2022-12-18 15:06:36.655751');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (3, 'Erick', 'erick@gmail.com', '$2b$10$ChibC.GflhPhm9q3NDKCQuBgw3Ye6D3yYjJsQLUExtFWlXk8qJafK', '2022-12-18 15:06:45.455576');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (4, 'Berg', 'berg@gmail.com', '$2b$10$rQkKlDyi7BSUCyBTQ1w5JO0XA9QoDuKiWLKffw/BghqdjU3wJmkCO', '2022-12-18 15:06:54.64018');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (5, 'Davi', 'davi@gmail.com', '$2b$10$5OIkkuzU8c0uxSyrrKeuPO54TOvM2YxlB86SL5eRYfr/R06.DhiaK', '2022-12-18 15:07:02.057156');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (6, 'Igor', 'igor@gmail.com', '$2b$10$GKzh/.8PNVbmU4dWnMVhrOqXavJkRrsibOpSPRjvetGMUnE24osFO', '2022-12-20 00:33:44.912547');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (7, 'Alysson', 'alysson@gmail.com', '$2b$10$pmciwTvb3YasxmsJI3jvCezC3ro7Rz1FPBLI1uAnfRBk6KA.w6wwO', '2022-12-20 00:34:04.804763');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (8, 'Esdras', 'esdras@gmail.com', '$2b$10$mRD3EHLHvYrEoPhb/soqIuPxq2uvlAmuzLQXapxKAx/05i0fiepc.', '2022-12-20 00:34:11.815139');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (9, 'Pedro', 'pedro@gmail.com', '$2b$10$DnOCnDkRPzmLm3WHcz.SmOraerSq91mlOwTKkeMYcN5NKfUBINMoa', '2022-12-20 00:34:18.978617');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (10, 'Lucas', 'lucas@gmail.com', '$2b$10$0XCNWcnP1mvGsyVUx/hxA.8UqKHnEajzQPbIEYvR7fzdExkUQeYCy', '2022-12-20 00:41:26.889894');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (11, 'Pedrola', 'pedrola@gmail.com', '$2b$10$dOvLsUXrxGUg/zyhlkClfOhwfHucRlAEBy5Cy57.6VYPKJdzvPmem', '2022-12-21 00:18:18.844093');
INSERT INTO "public"."users" ("id", "name", "email", "password", "createdAt") VALUES (12, 'Esdrinhas', 'esdrinhas@gmail.com', '$2b$10$Vq5py3ink8GtRVePFnwi3OV6YS/D9C9tCKSrNVk9doIkOidHTxwmO', '2022-12-21 00:42:25.562521');


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 211
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erickguerra
--

SELECT pg_catalog.setval('"public"."sessions_id_seq"', 42, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 213
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erickguerra
--

SELECT pg_catalog.setval('"public"."urls_id_seq"', 15, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erickguerra
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 12, true);


--
-- TOC entry 3469 (class 2606 OID 17690)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3471 (class 2606 OID 17706)
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."urls"
    ADD CONSTRAINT "urls_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3465 (class 2606 OID 17680)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_email_key" UNIQUE ("email");


--
-- TOC entry 3467 (class 2606 OID 17678)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3472 (class 2606 OID 17691)
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id");


--
-- TOC entry 3473 (class 2606 OID 17707)
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erickguerra
--

ALTER TABLE ONLY "public"."urls"
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id");


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA "public"; Type: ACL; Schema: -; Owner: erickguerra
--

REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
GRANT ALL ON SCHEMA "public" TO PUBLIC;


-- Completed on 2022-12-21 01:47:47 -03

--
-- PostgreSQL database dump complete
--

