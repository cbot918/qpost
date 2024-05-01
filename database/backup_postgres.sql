--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Debian 12.15-1.pgdg120+1)
-- Dumped by pg_dump version 12.15 (Debian 12.15-1.pgdg120+1)

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
-- Name: comment_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_like (
    id bigint NOT NULL,
    liked_user uuid NOT NULL,
    target_comment uuid NOT NULL
);


ALTER TABLE public.comment_like OWNER TO postgres;

--
-- Name: comment_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_like_id_seq OWNER TO postgres;

--
-- Name: comment_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_like_id_seq OWNED BY public.comment_like.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id uuid NOT NULL,
    texts character varying NOT NULL,
    posted_by uuid NOT NULL,
    target_post uuid NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    id bigint NOT NULL,
    from_user uuid NOT NULL,
    to_user uuid NOT NULL
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follow_id_seq OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follow_id_seq OWNED BY public.follow.id;


--
-- Name: post_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_like (
    id bigint NOT NULL,
    liked_user uuid NOT NULL,
    target_post uuid NOT NULL
);


ALTER TABLE public.post_like OWNER TO postgres;

--
-- Name: post_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_like_id_seq OWNER TO postgres;

--
-- Name: post_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_like_id_seq OWNED BY public.post_like.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id uuid NOT NULL,
    title character varying NOT NULL,
    body character varying NOT NULL,
    posted_by uuid NOT NULL,
    photo character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL,
    pic character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: comment_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_like ALTER COLUMN id SET DEFAULT nextval('public.comment_like_id_seq'::regclass);


--
-- Name: follow id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow ALTER COLUMN id SET DEFAULT nextval('public.follow_id_seq'::regclass);


--
-- Name: post_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_like ALTER COLUMN id SET DEFAULT nextval('public.post_like_id_seq'::regclass);


--
-- Data for Name: comment_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_like (id, liked_user, target_comment) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, texts, posted_by, target_post) FROM stdin;
60e2a66d-a6d3-6600-22f0-35e800000000	test	60e2a5e5-a6d3-6600-22f0-35e700000000	60ccb056-8e68-9018-44d0-929300000000
60f51329-eeb7-3700-225b-265800000000	6666	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60f5132e-eeb7-3700-225b-265900000000	<6666	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60f51333-eeb7-3700-225b-265a00000000	&lt	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60f51346-eeb7-3700-225b-265b00000000	&#x3C;&#x69;&#x6D;&#x67;&#x3E;	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60f5134c-eeb7-3700-225b-265c00000000	\\<5123	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60f51352-eeb7-3700-225b-265d00000000	{{1*1}}	60f5101e-eeb7-3700-225b-265600000000	60ccb06a-8e68-9018-44d0-929400000000
60cd8da6-ba2b-ee00-226f-847300000000	姊：手機桌面整理 / 當主控播放影片及投影片 / 影片製作 / 投影片製作	60cd8c80-ba2b-ee00-226f-847100000000	60cd8d0b-ba2b-ee00-226f-847200000000
60cd8dc3-ba2b-ee00-226f-847400000000	施姊：macbook 操作	60cd8c80-ba2b-ee00-226f-847100000000	60cd8d0b-ba2b-ee00-226f-847200000000
60cf166a-f506-4500-2269-d08900000000	周一 課程：macbook操作 / 姊的課程進度 1) 螢幕白板 2) 投影片製作 3) 影片製作 4) 圖片 5) 直播 6) 唱歌軟體 7) 美國行前整理	60ce798f-7a1d-c200-222f-5ca200000000	60cd8d0b-ba2b-ee00-226f-847200000000
60ce7a8b-7a1d-c200-222f-5ca400000000	 6/20 vue https://book.vue.tw/	60ce798f-7a1d-c200-222f-5ca200000000	60ce7a63-7a1d-c200-222f-5ca300000000
60ce7a9b-7a1d-c200-222f-5ca500000000	 tailwind https://hackmd.io/@lalarabbits/vitawind1-1-in-vite-tailwind	60ce798f-7a1d-c200-222f-5ca200000000	60ce7a63-7a1d-c200-222f-5ca300000000
60ce801f-7a1d-c200-222f-5ca600000000	 tailwind O-site https://tailwindcss.com/docs 	60ccae67-fcd2-c732-9ca3-96c000000000	60ce7a63-7a1d-c200-222f-5ca300000000
60ce8021-7a1d-c200-222f-5ca700000000	 tailwind O-site https://tailwindcss.com/docs 	60ccae67-fcd2-c732-9ca3-96c000000000	60ce7a63-7a1d-c200-222f-5ca300000000
60cea365-5955-6500-22d6-d45700000000	 W3C free-space https://www.w3schools.com/spaces/	60ccae67-fcd2-c732-9ca3-96c000000000	60ce7a63-7a1d-c200-222f-5ca300000000
60cec1b8-df70-6d00-2290-682e00000000	    plain js SPA:  ❶ <a href="profile"> Profile</a> ❷ e.preventDefault()  ❸ history.pushState(null,null,url) ❹ view.innerHTML = profile.getHtml()   // view是 element, profile是 module html 	60ce798f-7a1d-c200-222f-5ca200000000	60cebdf1-df70-6d00-2290-682d00000000
60cefc41-a1cb-b800-22e4-cc5000000000	AppleSheep>   a serverless app, site on gitpage	60ce798f-7a1d-c200-222f-5ca200000000	60cebdf1-df70-6d00-2290-682d00000000
60ddeacc-5fd2-f300-2221-c7b600000000	  玩minecraft好像寫程式，蓋生怪塔要設計架構，先做最小可行test，然後一步一步implement&debug，還要看結構(程式)是否safe。真的是遊戲中學習，這次是第二次蓋生怪塔，比第一次熟練了，就是不確定，樹葉做為base到底生不生怪，我太快改成泥土了...。總之是個很開心的24H RUN	60ccae67-fcd2-c732-9ca3-96c000000000	60dde9da-5fd2-f300-2221-c7b500000000
60e054f3-3b59-4200-224c-145e00000000	 1樓	60ce798f-7a1d-c200-222f-5ca200000000	60e050bf-3b59-4200-224c-145d00000000
60e0562a-3b59-4200-224c-145f00000000	2樓陽台	60ccae67-fcd2-c732-9ca3-96c000000000	60e050bf-3b59-4200-224c-145d00000000
60e30af1-85f2-f000-22b8-613e00000000	 2021 / 7 / 5	60ce798f-7a1d-c200-222f-5ca200000000	60e30ad2-85f2-f000-22b8-613d00000000
6100b0c2-e100-d700-2282-1b7a00000000	123456	6100b08c-e100-d700-2282-1b7600000000	60e30ad2-85f2-f000-22b8-613d00000000
6100b0c3-e100-d700-2282-1b7b00000000	123456	6100b08c-e100-d700-2282-1b7600000000	60e30ad2-85f2-f000-22b8-613d00000000
60e6a3b6-fdf4-7200-22ba-08a000000000	 填坑很累，填黑洞就不會累了 xD 	60ccae67-fcd2-c732-9ca3-96c000000000	60e6a02b-fdf4-7200-22ba-089f00000000
60e9939d-3b08-8100-22fb-f6ca00000000	 吃!!!!!!!!	60ccae67-fcd2-c732-9ca3-96c000000000	60e94444-ef00-1f00-22bb-80cf00000000
60e9682b-d446-8d00-22ee-0e5000000000	 撒嬌鬼	60ccae67-fcd2-c732-9ca3-96c000000000	60e967b5-d446-8d00-22ee-0e4f00000000
60ec08c6-c5b2-2000-2299-3caa00000000	以上達成7成 獎勵自己可以自製一個遊戲引擎 以及 刻一個AI社群模擬器	60ce798f-7a1d-c200-222f-5ca200000000	60ec083f-c5b2-2000-2299-3ca900000000
60ecd7d1-7666-eb00-2207-e32a00000000	 vue >> chatapp 視窗問題 https://book.vue.tw/CH1/1-7-lifecycle.html	60ce798f-7a1d-c200-222f-5ca200000000	60ec4c4f-a6dc-a100-22f0-520c00000000
60ecdb59-7666-eb00-2207-e32b00000000	 idea >> 社群模擬器 | 論壇筆記	60ce798f-7a1d-c200-222f-5ca200000000	60ec4c4f-a6dc-a100-22f0-520c00000000
60ee6adb-7a70-3d00-22ae-ffad00000000	 紀錄 Go GDE > https://reurl.cc/dG9MEV	60ccae67-fcd2-c732-9ca3-96c000000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
60ee6af9-7a70-3d00-22ae-ffae00000000	 紀錄真的 Go GDE > https://www.evanlin.com/gde-go/	60ccae67-fcd2-c732-9ca3-96c000000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
60ee6b05-7a70-3d00-22ae-ffaf00000000	 export default 差別：https://www.itread01.com/content/1542084847.html	60ccae67-fcd2-c732-9ca3-96c000000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
6100b0b3-e100-d700-2282-1b7900000000	gggg	6100b08c-e100-d700-2282-1b7600000000	60ef7f4d-8cd8-9900-220d-af8f00000000
6100b0a8-e100-d700-2282-1b7700000000	xxxxxxx	6100b08c-e100-d700-2282-1b7600000000	60f1562e-c040-b000-22ca-99dd00000000
6100b0ac-e100-d700-2282-1b7800000000	ggggg	6100b08c-e100-d700-2282-1b7600000000	60f1562e-c040-b000-22ca-99dd00000000
60f3bed1-ff48-af05-c896-f58400000000	 早起紀錄一下stack:   puppeteer(headless抓圖) > travis(自動測試 not yet)	60ce798f-7a1d-c200-222f-5ca200000000	60f3be4c-ff48-af05-c896-f58300000000
60f4af30-0546-7800-2228-0a2600000000	 每天都會遇到問題，但解決問題後我將更強！	60ccae67-fcd2-c732-9ca3-96c000000000	60f4adb5-0546-7800-2228-0a2500000000
60f5a334-921a-6235-3c95-bea900000000	 哈哈 拷貝忍者卡卡西	60ce798f-7a1d-c200-222f-5ca200000000	60f57c4a-91bc-ea00-2294-ad9a00000000
6106128d-ef8a-1b00-2292-698300000000	 非置入...	60ccae67-fcd2-c732-9ca3-96c000000000	6106127b-ef8a-1b00-2292-698200000000
61288979-50c6-4200-223f-af0a00000000	哈哈哈哈哈	612888f2-50c6-4200-223f-af0800000000	6106127b-ef8a-1b00-2292-698200000000
6135a507-ffbe-2300-2231-c6fe00000000	累累的周一	60ccae67-fcd2-c732-9ca3-96c000000000	6135a06d-ffbe-2300-2231-c6fd00000000
615a62b9-0ab1-a700-22e7-693f00000000	擅....	60ccae67-fcd2-c732-9ca3-96c000000000	615a6298-0ab1-a700-22e7-693e00000000
616ef3d7-b47b-1d00-22be-119600000000	 還是熊	60ccae67-fcd2-c732-9ca3-96c000000000	616ee011-d558-2000-22e6-e1e600000000
616ef4b6-b47b-1d00-22be-119800000000	 你是想當女友那個無可取代的那個吧 哈哈哈	60ccae67-fcd2-c732-9ca3-96c000000000	616ef442-b47b-1d00-22be-119700000000
6174235e-4fa6-6000-2265-548400000000	 https://drive.google.com/file/d/1-U1aTzUChhxfpm4W2JsHoW206uX85nLN/view?usp=sharing	60ccae67-fcd2-c732-9ca3-96c000000000	61742340-4fa6-6000-2265-548300000000
6176d54c-72ae-ae00-22f1-4bef00000000	 上面連結錯誤	60ccae67-fcd2-c732-9ca3-96c000000000	61742340-4fa6-6000-2265-548300000000
6176d557-72ae-ae00-22f1-4bf000000000	 https://drive.google.com/file/d/1fil8GumzrwY5HQ5Ewa-rnP0TwdyTFyja/view?usp=sharing	60ccae67-fcd2-c732-9ca3-96c000000000	61742340-4fa6-6000-2265-548300000000
64245c1b-c716-a905-545b-776800000000	123	60ccae67-fcd2-c732-9ca3-96c000000000	64208a79-b4cb-dc00-1e06-4a1a00000000
\.


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow (id, from_user, to_user) FROM stdin;
1	60cca023-6684-bf1e-5c6f-068600000000	60e2ad5d-a6d3-6600-22f0-35e900000000
2	60ccae67-fcd2-c732-9ca3-96c000000000	60ce798f-7a1d-c200-222f-5ca200000000
3	60ccae67-fcd2-c732-9ca3-96c000000000	6100b08c-e100-d700-2282-1b7600000000
4	60ccae67-fcd2-c732-9ca3-96c000000000	612888f2-50c6-4200-223f-af0800000000
5	60ccae67-fcd2-c732-9ca3-96c000000000	61512c52-aca8-e600-221d-bd9a00000000
6	60cd8c80-ba2b-ee00-226f-847100000000	60ccae67-fcd2-c732-9ca3-96c000000000
7	60ce798f-7a1d-c200-222f-5ca200000000	60ccae67-fcd2-c732-9ca3-96c000000000
8	60f5101e-eeb7-3700-225b-265600000000	60ccae67-fcd2-c732-9ca3-96c000000000
9	60e93dc3-ef00-1f00-22bb-80cd00000000	60ccae67-fcd2-c732-9ca3-96c000000000
10	60f5255f-eeb7-3700-225b-266b00000000	60ccae67-fcd2-c732-9ca3-96c000000000
11	61512c52-aca8-e600-221d-bd9a00000000	60ccae67-fcd2-c732-9ca3-96c000000000
12	60ccd50a-2148-2500-2271-b4af00000000	60ccd50a-2148-2500-2271-b4af00000000
13	60ccd50a-2148-2500-2271-b4af00000000	60ccd50a-2148-2500-2271-b4af00000000
14	60cd8c80-ba2b-ee00-226f-847100000000	60ccae67-fcd2-c732-9ca3-96c000000000
15	60ce798f-7a1d-c200-222f-5ca200000000	60ccae67-fcd2-c732-9ca3-96c000000000
16	60ccae67-fcd2-c732-9ca3-96c000000000	60ce798f-7a1d-c200-222f-5ca200000000
17	60cca023-6684-bf1e-5c6f-068600000000	60e2ad5d-a6d3-6600-22f0-35e900000000
18	60e966eb-d446-8d00-22ee-0e4e00000000	60e301f9-85f2-f000-22b8-613800000000
19	60e93dc3-ef00-1f00-22bb-80cd00000000	60ccae67-fcd2-c732-9ca3-96c000000000
20	60e966eb-d446-8d00-22ee-0e4e00000000	60e301f9-85f2-f000-22b8-613800000000
21	60f5101e-eeb7-3700-225b-265600000000	60ccae67-fcd2-c732-9ca3-96c000000000
22	60f5255f-eeb7-3700-225b-266b00000000	60ccae67-fcd2-c732-9ca3-96c000000000
23	60ccae67-fcd2-c732-9ca3-96c000000000	6100b08c-e100-d700-2282-1b7600000000
24	60ccae67-fcd2-c732-9ca3-96c000000000	612888f2-50c6-4200-223f-af0800000000
25	61512c52-aca8-e600-221d-bd9a00000000	60ccae67-fcd2-c732-9ca3-96c000000000
26	60ccae67-fcd2-c732-9ca3-96c000000000	61512c52-aca8-e600-221d-bd9a00000000
\.


--
-- Data for Name: post_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_like (id, liked_user, target_post) FROM stdin;
1	60f5101e-eeb7-3700-225b-265600000000	60ccb056-8e68-9018-44d0-929300000000
2	60ccae67-fcd2-c732-9ca3-96c000000000	60ccdb95-bf06-a800-22a1-ca3e00000000
3	60ce798f-7a1d-c200-222f-5ca200000000	60ce7a63-7a1d-c200-222f-5ca300000000
4	60ccae67-fcd2-c732-9ca3-96c000000000	60d2a121-eae6-7f00-22fb-b5b000000000
5	60d1e7a0-64ff-8000-22f3-160200000000	60d2a121-eae6-7f00-22fb-b5b000000000
6	60ce798f-7a1d-c200-222f-5ca200000000	60d2a121-eae6-7f00-22fb-b5b000000000
7	60e2ad5d-a6d3-6600-22f0-35e900000000	60de99ea-6e4f-f900-22cf-1fb800000000
8	60ccae67-fcd2-c732-9ca3-96c000000000	60e050bf-3b59-4200-224c-145d00000000
9	60e2ad5d-a6d3-6600-22f0-35e900000000	60e050bf-3b59-4200-224c-145d00000000
10	60ce798f-7a1d-c200-222f-5ca200000000	60e30ad2-85f2-f000-22b8-613d00000000
11	60ccae67-fcd2-c732-9ca3-96c000000000	60e7cae5-e1f7-a900-220d-eea600000000
12	60ccae67-fcd2-c732-9ca3-96c000000000	60e94444-ef00-1f00-22bb-80cf00000000
13	60ccae67-fcd2-c732-9ca3-96c000000000	60e96472-d446-8d00-22ee-0e4d00000000
14	60ccae67-fcd2-c732-9ca3-96c000000000	60e967b5-d446-8d00-22ee-0e4f00000000
15	60ccae67-fcd2-c732-9ca3-96c000000000	60e967b5-d446-8d00-22ee-0e4f00000000
16	60ccae67-fcd2-c732-9ca3-96c000000000	60ea80ac-7fb0-5500-224a-55d700000000
17	60ce798f-7a1d-c200-222f-5ca200000000	60ec083f-c5b2-2000-2299-3ca900000000
18	60ccae67-fcd2-c732-9ca3-96c000000000	60ec083f-c5b2-2000-2299-3ca900000000
19	60ce798f-7a1d-c200-222f-5ca200000000	60ec4c4f-a6dc-a100-22f0-520c00000000
20	60ccae67-fcd2-c732-9ca3-96c000000000	60ec4c4f-a6dc-a100-22f0-520c00000000
21	60ccae67-fcd2-c732-9ca3-96c000000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
22	612888f2-50c6-4200-223f-af0800000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
23	612888f2-50c6-4200-223f-af0800000000	60ee6ac7-7a70-3d00-22ae-ffac00000000
24	60ccae67-fcd2-c732-9ca3-96c000000000	60ef7f4d-8cd8-9900-220d-af8f00000000
25	60ccae67-fcd2-c732-9ca3-96c000000000	60f06830-f241-de00-22cc-e81f00000000
26	60f27ba5-5153-982f-34e5-ba2900000000	60f1562e-c040-b000-22ca-99dd00000000
27	60ccae67-fcd2-c732-9ca3-96c000000000	60f1562e-c040-b000-22ca-99dd00000000
28	6100b08c-e100-d700-2282-1b7600000000	60f1562e-c040-b000-22ca-99dd00000000
29	60f27ba5-5153-982f-34e5-ba2900000000	60f242fc-cc4d-6d00-2252-cae700000000
30	60ccae67-fcd2-c732-9ca3-96c000000000	60f242fc-cc4d-6d00-2252-cae700000000
31	60ce798f-7a1d-c200-222f-5ca200000000	60f3be4c-ff48-af05-c896-f58300000000
32	60ccae67-fcd2-c732-9ca3-96c000000000	60f3be4c-ff48-af05-c896-f58300000000
33	60f5101e-eeb7-3700-225b-265600000000	60f4adb5-0546-7800-2228-0a2500000000
34	60f5101e-eeb7-3700-225b-265600000000	60f4adb5-0546-7800-2228-0a2500000000
35	60f5101e-eeb7-3700-225b-265600000000	60f4adb5-0546-7800-2228-0a2500000000
36	60ccae67-fcd2-c732-9ca3-96c000000000	60f4adb5-0546-7800-2228-0a2500000000
37	60ce798f-7a1d-c200-222f-5ca200000000	60f57c4a-91bc-ea00-2294-ad9a00000000
38	60ccae67-fcd2-c732-9ca3-96c000000000	60f57c4a-91bc-ea00-2294-ad9a00000000
39	60ce798f-7a1d-c200-222f-5ca200000000	61026d8d-7aae-470c-f83b-de9200000000
40	60ccae67-fcd2-c732-9ca3-96c000000000	61026d8d-7aae-470c-f83b-de9200000000
41	60ce798f-7a1d-c200-222f-5ca200000000	6106127b-ef8a-1b00-2292-698200000000
42	60ccd50a-2148-2500-2271-b4af00000000	6117347c-639a-0400-22fd-8a4e00000000
43	60ccae67-fcd2-c732-9ca3-96c000000000	61320ddf-cd7c-6100-22a3-abc800000000
44	60ccae67-fcd2-c732-9ca3-96c000000000	6135a06d-ffbe-2300-2231-c6fd00000000
45	60ccae67-fcd2-c732-9ca3-96c000000000	615a6298-0ab1-a700-22e7-693e00000000
46	60ccae67-fcd2-c732-9ca3-96c000000000	6161d44a-63bd-5700-22b0-a8be00000000
47	60ccae67-fcd2-c732-9ca3-96c000000000	616ef442-b47b-1d00-22be-119700000000
48	61512c52-aca8-e600-221d-bd9a00000000	616ef442-b47b-1d00-22be-119700000000
49	60ccae67-fcd2-c732-9ca3-96c000000000	61742340-4fa6-6000-2265-548300000000
50	60ccae67-fcd2-c732-9ca3-96c000000000	617e7391-c7c3-f900-226e-ede300000000
51	632ef947-d862-5200-2226-efe800000000	61966a3c-6993-bc00-22e5-feae00000000
52	632ef947-d862-5200-2226-efe800000000	61966a92-6993-bc00-22e5-feaf00000000
53	60ccae67-fcd2-c732-9ca3-96c000000000	62769149-0632-7600-2211-483400000000
54	60ccae67-fcd2-c732-9ca3-96c000000000	6406f9c2-7eb6-9100-3426-806400000000
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, body, posted_by, photo, created_at, updated_at) FROM stdin;
60ccb056-8e68-9018-44d0-929300000000	1	牛嘎糖	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1624027221/efd6dqakbgswqlyzrukv.jpg	2021-06-18 14:40:22.76+00	2021-07-19 05:52:31.94+00
60ccb06a-8e68-9018-44d0-929400000000	2	超好喝蛋白拿鐵	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1624027241/is1pso1dc1fb50dtkuoa.jpg	2021-06-18 14:40:42.55+00	2021-07-19 05:53:22.31+00
60ccdaa0-bf06-a800-22a1-ca3d00000000	蘋果好吃	朋友下午去買了蘋果M1	60ccc6ac-03d6-551d-00f6-06c600000000	http://res.cloudinary.com/yalecloud/image/upload/v1624038047/jagcncx42exu65jmcwce.jpg	2021-06-18 17:40:48.59+00	2021-06-18 17:40:48.59+00
60ccdb95-bf06-a800-22a1-ca3e00000000	SheepCloud 上架	類似IG的社群媒體，目前網頁版，更多功能及手機APP邊開發	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1624038291/gwq72y0yjwhqnbjxuhqx.jpg	2021-06-18 17:44:53.06+00	2021-06-18 17:44:58.74+00
60cce2b0-125c-4800-223d-a42600000000	一言不合	就PO文	60cce275-125c-4800-223d-a42500000000	http://res.cloudinary.com/yalecloud/image/upload/v1624040110/lyw1iz626xxvrsmotppy.jpg	2021-06-18 18:15:12.08+00	2021-06-18 18:15:12.08+00
60cd8d0b-ba2b-ee00-226f-847200000000	課程進度	as title	60cd8c80-ba2b-ee00-226f-847100000000	http://res.cloudinary.com/yalecloud/image/upload/v1624083721/sqlkrebk8z6wo49ovrvs.jpg	2021-06-19 06:22:03.54+00	2021-06-20 10:20:26.89+00
60cde524-fa74-9900-22fc-d36400000000	好吃的晚餐😋	謝謝姐賜我食	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1624106275/vkzpil0gzhw383a9ymvy.jpg	2021-06-19 12:37:56.63+00	2021-06-19 12:37:56.63+00
60ce7a63-7a1d-c200-222f-5ca300000000	工作紀錄 PAD	日期 / 內容 / 網址 	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1624144480/rpqmsyappzdpqy9peekv.jpg	2021-06-19 23:14:43.2+00	2021-06-20 02:09:41.19+00
60cebdf1-df70-6d00-2290-682d00000000	web design	筆記整理	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1624161776/idskx2yb8dxmgnqlujje.jpg	2021-06-20 04:02:57.74+00	2021-06-20 08:28:49.12+00
60d2a121-eae6-7f00-22fb-b5b000000000	birthday	happy	60d2a070-eae6-7f00-22fb-b5af00000000	http://res.cloudinary.com/yalecloud/image/upload/v1624416544/yqecmwekibzzyiwliz2i.jpg	2021-06-23 02:49:05.32+00	2021-06-24 13:42:31.86+00
60dde9da-5fd2-f300-2221-c7b500000000	24H Minecraft Hard Mode  死4次 奔饋	蓋了主堡/生怪塔/目前等30等附魔幸運III	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625156056/ztpwaituvsbcicbabh7e.png	2021-07-01 16:14:18.38+00	2021-07-01 16:18:20.11+00
60de809c-b758-3c00-22ce-aec000000000	剛好好的，突然怪物塔開始漏水	用鷹架查看了一下，原來是有塊泥土，被怪物拔掉了阿，看來兇手只有尼德大大了xD	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625194650/fyiktseflpsxupuntmvm.png	2021-07-02 02:57:32.59+00	2021-07-02 02:57:32.59+00
60de99ac-6e4f-f900-22cf-1fb700000000	手癢打尼德	哭~~~~(笑死	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625201046/qefdpke9c4aqgo0avfu5.jpg	2021-07-02 04:44:28.6+00	2021-07-02 04:44:28.6+00
60de99ea-6e4f-f900-22cf-1fb800000000	等等2點上課囉	投影片製作	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1625201128/eidhhfuhlubx863ekhf4.png	2021-07-02 04:45:30.2+00	2021-07-05 06:58:03.08+00
60e050bf-3b59-4200-224c-145d00000000	換個燈管把自己手割了	原來這就是發出劍氣的感覺	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625313470/dh5dsz1mcakbjgenlajs.jpg	2021-07-03 11:57:51.58+00	2021-07-05 06:58:10.48+00
60e30ad2-85f2-f000-22b8-613d00000000	網站對外開放	紀念一下	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1625492176/jtl9hsfqrfwyf8b0bxyp.jpg	2021-07-05 13:36:18.32+00	2021-07-28 01:20:03.15+00
60e6a02b-fdf4-7200-22ba-089f00000000	累到豹	報稅一下	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625727017/tnpu57u8jozo9wln5avm.jpg	2021-07-08 06:50:19.15+00	2021-07-08 07:05:26.49+00
60e7cae5-e1f7-a900-220d-eea600000000	路上踩到黑洞被吸到異世界	所以我正在手刻一個論壇	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625803492/yzijuyasxfx1ylbkh20d.png	2021-07-09 04:04:53.82+00	2021-07-09 08:42:58.22+00
60e930f0-b977-9f00-2235-dd4400000000	Work via Vue.js 	in the noon	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1625895150/eb2fjrw6cx3dmzhuiek9.jpg	2021-07-10 05:32:32.28+00	2021-07-10 05:32:32.28+00
60e94444-ef00-1f00-22bb-80cf00000000	20210710辛辛小廚娘之剩趣水餃	剩下一點點絞肉、一小截紅蘿蔔，想來就做了紅蘿蔔麵糰，水餃皮有了；又剩下一點點麵糰，那就壓成幾絲麵條唄！所有的剩下也能有趣有味。 兔子愛吃紅蘿蔔，那綿羊吃嗎？呵呵！	60e93dc3-ef00-1f00-22bb-80cd00000000	http://res.cloudinary.com/yalecloud/image/upload/v1625900100/oy5t1ttmj9oyjjdeg4ov.jpg	2021-07-10 06:55:00.88+00	2021-07-10 12:33:33.45+00
60e96472-d446-8d00-22ee-0e4d00000000	你能用舌頭碰到自己的鼻尖嗎?	輕鬆獲勝	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625908336/fizsdmuyn4mdc4zhlq1p.jpg	2021-07-10 09:12:18.47+00	2021-07-10 09:27:20.94+00
60e967b5-d446-8d00-22ee-0e4f00000000	哈比	:)	60e966eb-d446-8d00-22ee-0e4e00000000	http://res.cloudinary.com/yalecloud/image/upload/v1625909171/ttfligbto8f7ykyl0fff.jpg	2021-07-10 09:26:13.12+00	2021-07-11 06:09:00.31+00
60ea80ac-7fb0-5500-224a-55d700000000	想當一朵自在的雲	結果遇上了黑洞製造者，開始了洞窟物語online...	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1625981097/vmdjkeoodnsy3bncsnbp.png	2021-07-11 05:25:00.05+00	2021-07-11 06:09:23.69+00
60ec083f-c5b2-2000-2299-3ca900000000	計劃趕不上變化，但沒計畫就沒其他東西	前後端web開發 iii｜軟體產品開發 Qcloud｜開源專案參與 ptt go backend｜伺服器開發 stable網頁伺服器｜自製直譯器 小型語言研發｜自製小型資料庫 Qsq｜資料結構演算法視覺化網頁 Qalgor	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1626081342/eky9czgvks6lngvlktf5.jpg	2021-07-12 09:15:43.95+00	2021-07-19 06:10:40.58+00
60ec4c4f-a6dc-a100-22f0-520c00000000	web-framework 架構 心得筆記	先寫這四部分：①data-binding ②router ③global-var ④v-dom // I will figure out	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1626098766/rnzpclrenapmrpxnwwfa.jpg	2021-07-12 14:06:07.49+00	2021-07-19 06:10:37.66+00
60ee6ac7-7a70-3d00-22ae-ffac00000000	早安	打氣一下，今天加油	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626237637/gmxdjjfddxd4egj5gxjp.jpg	2021-07-14 04:40:39.54+00	2021-08-28 03:12:19.44+00
60ef7f4d-8cd8-9900-220d-af8f00000000	早安，被reject一次後我深切反省	我要認真了	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626308385/teyuwgttn4fhcopdczck.jpg	2021-07-15 00:20:29.61+00	2021-07-28 01:19:47.02+00
60f06830-f241-de00-22cc-e81f00000000	晚安	朋友們	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626368047/zre8g8tgelkbjwvtgn4k.jpg	2021-07-15 16:54:08.72+00	2021-07-15 17:27:43.38+00
60f1562e-c040-b000-22ca-99dd00000000	紓壓一下	想PO什麼接到一通電話但是忘了 哈哈	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626428973/bq8l7jh2op7vai4luipb.png	2021-07-16 09:49:34.85+00	2021-07-28 01:19:40.21+00
60f242fc-cc4d-6d00-2252-cae700000000	昨天太晚睡	現在如圖	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626489595/ua6mgrjrrkxuiwdqq4dc.jpg	2021-07-17 02:39:56.29+00	2021-07-17 10:16:48.46+00
60f3be4c-ff48-af05-c896-f58300000000	早上去逛書店	邦網站買點裝備跟BUFF，期許效能++	60ce798f-7a1d-c200-222f-5ca200000000	http://res.cloudinary.com/yalecloud/image/upload/v1626586697/popwe0bg1l3i4be3z06s.jpg	2021-07-18 05:38:20.6+00	2021-07-29 03:42:27.39+00
60f4adb5-0546-7800-2228-0a2500000000	早安	5點就起床工作了，我真是太認真了^口^	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1626647987/tnpzz2iijebqiiqzzexw.jpg	2021-07-18 22:39:49.46+00	2021-07-19 06:10:24.49+00
60f57c4a-91bc-ea00-2294-ad9a00000000	測試QQ	我的Post內容	60f5255f-eeb7-3700-225b-266b00000000	http://res.cloudinary.com/yalecloud/image/upload/v1626700872/mccohpqhk3zehedwzh4w.png	2021-07-19 13:21:14.56+00	2021-07-29 03:44:22.54+00
61026d8d-7aae-470c-f83b-de9200000000	打了疫苗	鍵盤會不會敲比較快(想太多	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1627549064/h3ltqp3up0wsc7xme1jg.jpg	2021-07-29 08:57:49.26+00	2021-08-09 13:04:45.71+00
6106127b-ef8a-1b00-2292-698200000000	蹲得越低	腳就越酸	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1627787897/fdefpu03lt2kzisxwyaw.jpg	2021-08-01 03:18:19.65+00	2021-08-27 06:43:05.58+00
6117347c-639a-0400-22fd-8a4e00000000	測試	11111	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1628910714/dgjuvavjksmhxnx5ianb.jpg	2021-08-14 03:11:56.24+00	2021-08-31 01:13:22.19+00
61320ddf-cd7c-6100-22a3-abc800000000	Sheep-React-4	React Hook	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1630670301/aivfi8yzkv92d5z80m9o.jpg	2021-09-03 11:58:23.64+00	2021-09-03 11:58:53.53+00
6135a06d-ffbe-2300-2231-c6fd00000000	幫自己	加油	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1630904428/pydz6w9dszwxxzgmg3re.jpg	2021-09-06 05:00:29.31+00	2021-09-26 09:13:36.09+00
615a6298-0ab1-a700-22e7-693e00000000	灌個水	做不善長的事壓力山大	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1633313430/yx9uqqubxvppahfb4sk0.jpg	2021-10-04 02:10:32.25+00	2021-10-08 03:26:18.52+00
6161d44a-63bd-5700-22b0-a8be00000000	橘子好朋友	羅琳大大	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1633801289/omc9ddtzc0myemezkqjd.jpg	2021-10-09 17:41:30.94+00	2021-10-09 17:41:53.43+00
61699932-f7f1-0f00-22b9-a95200000000	曬一下下午茶	曬	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1634310448/pd1jmhvxvt8kdomopasv.jpg	2021-10-15 15:07:30.25+00	2021-11-03 10:52:31.86+00
616ee011-d558-2000-22e6-e1e600000000	狗	還是娃娃	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1634656272/dybvkdbkcgligwoga4jd.jpg	2021-10-19 15:11:13.58+00	2021-10-19 16:35:35.88+00
616ef442-b47b-1d00-22be-119700000000	工程師啊	好想當無法取代的位置	61512c52-aca8-e600-221d-bd9a00000000	http://res.cloudinary.com/yalecloud/image/upload/v1634661441/lab1aaipedxlefbo95g3.jpg	2021-10-19 16:37:22.8+00	2021-10-19 16:40:50.53+00
61742340-4fa6-6000-2265-548300000000	思維導圖	把程式像CSS一樣拆解的方式	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1635001150/o7cqbsaw1dmkwreqel3h.png	2021-10-23 14:59:12.3+00	2021-10-31 10:42:16.8+00
617e7391-c7c3-f900-226e-ede300000000	Android 登入頁面	開心	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1635677072/veqfsw4c6ctecqwgpxlt.jpg	2021-10-31 10:44:33.26+00	2021-11-18 23:20:57.59+00
61966a3c-6993-bc00-22e5-feae00000000	無人的停車場	成就解鎖ㄒㄒ	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1637247547/trzjxmny3duirv9c5js3.jpg	2021-11-18 14:59:08.88+00	2022-09-24 12:50:39.51+00
61966a92-6993-bc00-22e5-feaf00000000	真的笑死	世界第一簡單資料庫	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1637247632/zferlintmxllfgialkd0.jpg	2021-11-18 15:00:34.15+00	2022-09-24 12:50:37.74+00
62769149-0632-7600-2211-483400000000	Rust OS kernel Hello World	開心~	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1651937608/yqnzlyzrfodh2i3lvrkh.png	2022-05-07 15:33:29.58+00	2022-05-07 15:33:36.44+00
6406f9c2-7eb6-9100-3426-806400000000	麻雀	不排除提告	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1678178753/zdeq00fnlsfousnulyxh.jpg	2023-03-07 08:45:54.95+00	2023-03-07 08:46:07.61+00
64208a79-b4cb-dc00-1e06-4a1a00000000	蟲蟲剋星	想起有個BUG放了一年好像還是不會解 :D	60ccae67-fcd2-c732-9ca3-96c000000000	http://res.cloudinary.com/yalecloud/image/upload/v1679854200/ktnlvnns4zat4lv8wakk.png	2023-03-26 18:10:01.65+00	2023-03-29 15:41:15.26+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
1	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, password, pic) FROM stdin;
60cca023-6684-bf1e-5c6f-068600000000	yale91811@gmail.com	yale91811	$2a$12$fNPHTHHHs8PTL0nxwW9S7OTjl2VfX7lYfj8ZZW38jb7md./jEPHuu	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ccae67-fcd2-c732-9ca3-96c000000000	yale918@gmail.com	yale918	$2a$12$l0cijajo0CFOhsz.0LX1COgIoxHvsst1SVfrz6eNMO1hOhYv8zuCK	http://res.cloudinary.com/yalecloud/image/upload/v1631457986/zgedrfwqs7uzyxxpr9ry.jpg
60ccc6ac-03d6-551d-00f6-06c600000000	apple@gmail.com	Apple Wang	$2a$12$LdPAFvaVwl..jjTRw0dwL.lvyBdoNc7GQ1c/HGTs30qG3NMxVnSpG	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ccc6c4-03d6-551d-00f6-06c700000000	banana@gmail.com	Banana Lee	$2a$12$msG6k7ohgbsu170vFmls3.8NZO7vwy6IXtfEnDfSUBC6tai31D4xS	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ccc6d4-03d6-551d-00f6-06c800000000	cat@gmail.com	Cat Cat Ma	$2a$12$bd7QU0FTdqVsLx1XuMZfHevy7atreb1UXLQiLOgCtK8WCt8mSjhKK	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ccd50a-2148-2500-2271-b4af00000000	test1@gmail.com	test1	$2a$12$i7dalB853Jo5rIbmJjsMreivF7f7a8cYKZEvOqJnu7WKOoLyHI1kG	http://res.cloudinary.com/yalecloud/image/upload/v1628914137/weoknrwjruj6wtlpnlqg.jpg
60cce275-125c-4800-223d-a42500000000	micky@gmail.com	Micky	$2a$12$wKFnbw40DOV/knf6wYRTpeNfn/bOhCrzYrYn/u2fn3YdbY0GS28l.	http://res.cloudinary.com/yalecloud/image/upload/v1624040051/y1h7krdrq6idz5o3etcp.png
60cd8c80-ba2b-ee00-226f-847100000000	sheepapp@gmail.com	SheepApp	$2a$12$ySvx7NHZh9zcNfOLoOhmN.OAG5b63EK52mXELPWtwnXr0Zv.SKjm2	http://res.cloudinary.com/yalecloud/image/upload/v1624083582/v9arawqu3upqpq7jwjzl.jpg
60ce798f-7a1d-c200-222f-5ca200000000	nodev8@gmail.com	nodev8	$2a$12$YAwXgie.Y9HyeQBTa/mnA.WcJ83D4nTO5JB9Ps8vfxbgYl41CaLbm	http://res.cloudinary.com/yalecloud/image/upload/v1624144267/dd91xu4p2givy5f6ir1l.jpg
60d1e7a0-64ff-8000-22f3-160200000000	fallman@gmail.com	Fall Man	$2a$12$mSLRol2d0Hgwx6pbL.pf9uf6ceuOB5u4qrosEiFW55f/ChFRds1La	http://res.cloudinary.com/yalecloud/image/upload/v1624369054/hklhzr4j06xpr2ijhi3s.jpg
60d2a070-eae6-7f00-22fb-b5af00000000	allen483@ms19.hinet.net	allen483	$2a$12$fmWZJ/6pYbtdvEb98.J53OMUbT2p9lzvwZ0BT2Lq/3tuWokIEs6Xe	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60dde7e0-5fd2-f300-2221-c7b400000000	mathlovesmeya@gmail.com	Joyce	$2a$12$Arm67FmoRodcKWfatBg4E.MDx4ODZDiQZoNNKNO9Msmg5jm2eDA0C	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e2a5e5-a6d3-6600-22f0-35e700000000	1234@hh.com	1234	$2a$12$P0IfONR/gjrydCrPdg5DUeBZS3K8PaBaCO4DdxslreTiKn/EMwvGW	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e2ad5d-a6d3-6600-22f0-35e900000000	456@gmail.com	123	$2a$12$oj.j7SeuibJ.bEG2EwxItuA2Q6bDUqzVKNb060En6mK.SSgUEoZ2.	http://res.cloudinary.com/yalecloud/image/upload/v1625468251/vnzon1hdazxp9muhyfj1.jpg
60e2bc3b-a6d3-6600-22f0-364000000000	akari0624@hotmail.com	bigbro1987	$2a$12$dtu6Ze9zLXmSOD4Guu1jfO/lz46SpUZ/jidO9nYq/ZnCorNyl3JMa	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e301f9-85f2-f000-22b8-613800000000	j41k23@gmail.com	FutureWorldPowderBlue	$2a$12$gLnus.jqUUpxCZPJN3xcIePYCTOmFaypxIb.Tfv9zgUeZJeFAX.5W	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e301fa-85f2-f000-22b8-613900000000	j41k23@gmail.com	FutureWorldPowderBlue	$2a$12$7df13kYgzCR02sC1o/2MTe9jV/n9eHj9U/ItAHeTywI8r3wltfrdC	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e301fb-85f2-f000-22b8-613a00000000	j41k23@gmail.com	FutureWorldPowderBlue	$2a$12$Z6L.pMnd6srs/vvM8jxvRuS0CD7379tZBAoMSvxmLmwtTymeyCDGS	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e301fb-85f2-f000-22b8-613b00000000	j41k23@gmail.com	FutureWorldPowderBlue	$2a$12$hEyTLKLthUIYLEseYL3EBOWSNXZ6A2ekJnZeD66TRQYs6kzitz9Ya	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e93dc3-ef00-1f00-22bb-80cd00000000	cynthia19920707@gmail.com	辛西亞	$2a$12$JT4Y7x4fM6lcWPvHF3uiDO4ZwohXo.yVfCJyj.s8r7qlxTyivjSpy	http://res.cloudinary.com/yalecloud/image/upload/v1625898434/nkgupsm9rislpw7vsev7.png
60e95546-ef00-1f00-22bb-80d000000000	newman@gmail.com	NewMan	$2a$12$4H4TxyEARe1BbdLoH/fur.aGvhdI5Szh/h8M5nkgFPaVKGfHkHyb6	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60e966eb-d446-8d00-22ee-0e4e00000000	lucy0126@kimo.com	sylvia	$2a$12$WBJ1AOK43cE9QlUAVP2ejuRHjzp57mEZI8IN5PXdiS6jkdmaorKH.	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60f27ba5-5153-982f-34e5-ba2900000000	test@gmail.com	testtest	$2a$12$4K.x/kRM1DttkMIMEeMxe.Absk7H1KR8E8.IgPcfYQ.tbOl7Sa/qu	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60f294a2-aef4-ff00-2204-90d300000000	test2@gmail.com	12345	$2a$12$VqlII.s1Flq20td6cFalTewbntfocRl70o7Wd90p2NnidpxKm5SMG	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60f29c64-aef4-ff00-2204-90d400000000	venis20200510@gmail.com	謝尹倫	$2a$12$QVEbIXLMZlDMWNIj2WgulOTAzNX7nSeKbXbMSlGqdurSdtg8CEeG2	http://res.cloudinary.com/yalecloud/image/upload/v1626512652/ndo8c1l4fvozmisbckgj.jpg
60f2c58f-c076-4e00-2229-081f00000000	sindertw@gmail.com	ted	$2a$12$HG9mq1bJqaj9YLUghJF6d.Cqks6.2NLPgtDlUJe633D6SAW5UkwGO	http://res.cloudinary.com/yalecloud/image/upload/v1626523564/cpl1lozsy8m2g17qtasz.jpg
60f5101e-eeb7-3700-225b-265600000000	uyv02422@zwoho.com	UserName	$2a$12$8RlRTbhTgn7lKI8wbXbvquEZp3Uf50Dh32UzZmPEUr77qprcwPMOS	http://res.cloudinary.com/yalecloud/image/upload/v1626673472/goh7ngvzvkao58jhucxg.png
60f515a9-eeb7-3700-225b-266a00000000	sample@mail.com	123	$2a$12$Ih21htYeo26U9CzISmv1weYzea73pMToeTt9FeBvJysXQxNwispFO	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60f5255f-eeb7-3700-225b-266b00000000	cn27529@hotmail.com	cn27529	$2a$12$dJbT26Bz2kxB2Zke.z7m9u1YmUxBJMMQQIhdf8/76cwXGEil7hwoG	http://res.cloudinary.com/yalecloud/image/upload/v1626678621/nnysigyzedlkxycsl4zv.png
60fe18c3-f508-c800-2224-0b4d00000000	sdfsd@dfs.sdf	dsfs	$2a$12$4d5G.bZ47Ow/QTsuGxP.XuiRG7oMTLObRXJ9xSCU1nBOwA.CHCGJq	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60fe1905-f508-c800-2224-0b4e00000000	sdfsdf@dfsdf3.ccc	sdfsf	$2a$12$fBQoBf.1zHNdct7d58KbL.nGEU.KLRkPhD.PbW.csu56AJfTODqzq	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ff8324-e84c-5f00-2227-bbd600000000	test@mail.com	123	$2a$12$Kxw2tyHoK9cY33UoFgXqUu8YndsoObJXMDus.tl6pWmOchUhb.aE2	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
60ff834b-e84c-5f00-2227-bbd700000000	123@mail.com	123	$2a$12$RBkxOsBkKnuCDMfyveJure9HFP2bWsz/Xzb4BIVyH6zXrB7HPnayW	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
6100b068-e100-d700-2282-1b7500000000	xxxxx@gmail.com	xxxx	$2a$12$5vlpERCyhxZI1425bk4kfenJj1nHFOSe60wOIMf7ygAkR4S3DUzma	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
6100b08c-e100-d700-2282-1b7600000000	xx@gmail.com	xxxx	$2a$12$O1XKVQztLdmBg8MgiCYiquyRJixsV7QOo7rP0Nh/FvVtsNCqbYS3K	http://res.cloudinary.com/yalecloud/image/upload/v1627435318/yj8zhz3u7hpkkvdqz3ap.jpg
61022388-3108-be00-22c6-00b800000000	a@a.com	a	$2a$12$FCYsk1E18/Sm8syePpTzkOzlj6iK6KHMWxCoGCu3SIBpSE17fg/q6	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
610223ed-3108-be00-22c6-00b900000000	as@sas.as	as	$2a$12$tjDjKsM596xZgi1R3uVO.OzoO2VI.MRSSY9yVotGsuDRyt4GcLo56	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
612888f2-50c6-4200-223f-af0800000000	yuhan.yangg@gmail.com	Abc	$2a$12$SVi/ajrASU.9/MSEsOaFge/O6Qeoa5i7WAM2fAmscTWK4s/pMyB8W	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
612d821f-e655-0100-2226-c12600000000	test@test.com	test123	$2a$12$Dk2QLKjKVEVEcUrz9nPJZ.MyThD4.allHJb/iM50/MhifSwq5yuuW	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
61512c52-aca8-e600-221d-bd9a00000000	S95006sam@gmail.com	Sam	$2a$12$Bzh2CZKePfxFG1rK2vHJdeJCBFqheGVNWqFLhUbPjN7D1oXKxNpLa	http://res.cloudinary.com/yalecloud/image/upload/v1634661380/uxnjv7c12hjl5rvoeos3.jpg
615c2e53-9c00-a300-2217-3cf300000000	test10@gmail.com	test10	$2a$12$gUbam1NnkdrpasUAFUMZc.IymANICMkeEHACGlUwTjvpi7ofQ9mX.	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
616443e6-3e12-6900-2297-f11c00000000	410703005@gmail.com	Coco	$2a$12$p79no5MmPPE6Y7KzY8A1YevkwMTyYWrEhTLtopPXrZW3WjyRu.f3W	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
621f38b8-49b9-cb00-222a-6aaa00000000	123@qq.com	123	$2a$12$7zmPZCG7IfXZx950S1qGhe7fSGzhlCANB//zFBI.ALKmE0AHRLbuC	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
627d1a95-5cee-e900-2241-27ef00000000	test@12345.com	test	$2a$12$G55UCpPML7tYl3iZ/ODhv.VCgnEY4NPy4HH9XUBwDb1qrzMpz5Rrm	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
632ef947-d862-5200-2226-efe800000000	test999@gmail.com	test999	$2a$12$TbIQP4C1cxCo9hN2.qjG4e7Ot/nNZWT/TDTPQvayLOA2HQxvbv3mO	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
63f1fc38-535d-5f00-3468-706f00000000	nodev918@gmail.com	node	$2a$12$Nw35/PFUc.3maKE.Zkxp6eAjk0mO9fDO4/8IbJNy.nRZlaIGOtABi	https://res.cloudinary.com/yalecloud/image/upload/v1623929382/noimage_jlfaqb.jpg
\.


--
-- Name: comment_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_like_id_seq', 1, false);


--
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follow_id_seq', 26, true);


--
-- Name: post_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_like_id_seq', 54, true);


--
-- Name: comment_like comment_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_like
    ADD CONSTRAINT comment_like_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: post_like post_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comment_like comment_like_liked_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_like
    ADD CONSTRAINT comment_like_liked_user_fkey FOREIGN KEY (liked_user) REFERENCES public.users(id);


--
-- Name: comment_like comment_like_target_comment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_like
    ADD CONSTRAINT comment_like_target_comment_fkey FOREIGN KEY (target_comment) REFERENCES public.comments(id);


--
-- Name: comments comments_posted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES public.users(id);


--
-- Name: comments comments_target_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_target_post_fkey FOREIGN KEY (target_post) REFERENCES public.posts(id);


--
-- Name: follow follow_from_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_from_user_fkey FOREIGN KEY (from_user) REFERENCES public.users(id);


--
-- Name: follow follow_to_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_to_user_fkey FOREIGN KEY (to_user) REFERENCES public.users(id);


--
-- Name: post_like post_like_liked_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_liked_user_fkey FOREIGN KEY (liked_user) REFERENCES public.users(id);


--
-- Name: post_like post_like_target_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_target_post_fkey FOREIGN KEY (target_post) REFERENCES public.posts(id);


--
-- Name: posts posts_posted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

