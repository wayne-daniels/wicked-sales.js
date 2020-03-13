--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	1	1	2999
2	1	3	2900
3	2	1	2999
4	2	1	2999
5	3	2	2595
6	3	2	2595
7	3	2	2595
8	3	2	2595
9	3	2	2595
10	3	2	2595
11	3	2	2595
12	3	2	2595
13	3	2	2595
14	3	2	2595
15	3	2	2595
16	3	2	2595
17	3	2	2595
18	3	2	2595
19	3	2	2595
20	3	2	2595
21	3	2	2595
22	3	2	2595
23	3	2	2595
24	3	2	2595
25	3	2	2595
26	3	2	2595
27	3	2	2595
28	3	2	2595
29	3	2	2595
30	3	2	2595
31	3	2	2595
32	3	2	2595
33	3	2	2595
34	3	2	2595
35	3	2	2595
36	3	2	2595
37	3	2	2595
38	3	2	2595
39	3	2	2595
40	3	2	2595
41	3	2	2595
42	3	2	2595
43	3	2	2595
44	3	2	2595
45	3	2	2595
46	3	2	2595
47	3	2	2595
48	3	2	2595
49	3	2	2595
50	3	2	2595
51	3	2	2595
52	3	2	2595
53	3	2	2595
54	3	2	2595
55	3	2	2595
56	3	2	2595
57	3	2	2595
58	3	2	2595
59	3	2	2595
60	3	2	2595
61	3	2	2595
62	3	2	2595
63	3	2	2595
64	3	2	2595
65	3	2	2595
66	3	2	2595
67	3	2	2595
68	3	2	2595
69	3	2	2595
70	3	2	2595
71	3	2	2595
72	3	2	2595
73	3	2	2595
74	3	2	2595
75	3	2	2595
76	3	2	2595
77	3	2	2595
78	3	2	2595
79	3	2	2595
80	3	2	2595
81	3	2	2595
82	3	2	2595
83	3	2	2595
84	3	2	2595
85	3	2	2595
86	3	2	2595
87	3	2	2595
88	3	2	2595
89	3	2	2595
90	3	2	2595
91	3	2	2595
92	3	2	2595
93	3	2	2595
94	3	2	2595
95	3	2	2595
96	3	2	2595
97	3	2	2595
98	3	2	2595
99	3	2	2595
100	3	2	2595
101	3	2	2595
102	3	2	2595
103	3	2	2595
104	3	2	2595
105	3	2	2595
106	3	2	2595
107	3	2	2595
108	3	2	2595
109	3	2	2595
110	3	2	2595
111	3	2	2595
112	3	2	2595
113	3	2	2595
114	3	2	2595
115	3	2	2595
116	3	2	2595
117	3	2	2595
118	3	2	2595
119	3	2	2595
120	3	2	2595
121	3	2	2595
122	3	2	2595
123	3	2	2595
124	3	2	2595
125	3	2	2595
126	3	2	2595
127	3	2	2595
128	3	2	2595
129	3	2	2595
130	3	2	2595
131	3	2	2595
132	3	2	2595
133	3	2	2595
134	3	2	2595
135	3	2	2595
136	3	2	2595
137	3	2	2595
138	3	2	2595
139	3	2	2595
140	3	2	2595
141	3	2	2595
142	3	2	2595
143	3	2	2595
144	3	2	2595
145	3	2	2595
146	3	2	2595
147	3	2	2595
148	3	2	2595
149	3	2	2595
150	3	2	2595
151	3	2	2595
152	3	2	2595
153	3	2	2595
154	3	2	2595
155	3	2	2595
156	3	2	2595
157	3	2	2595
158	3	2	2595
159	3	2	2595
160	3	2	2595
161	3	2	2595
162	3	2	2595
163	3	2	2595
164	3	2	2595
165	3	2	2595
166	3	2	2595
167	3	2	2595
168	3	2	2595
169	3	2	2595
170	3	2	2595
171	3	2	2595
172	3	2	2595
173	3	2	2595
174	3	2	2595
175	3	2	2595
176	3	2	2595
177	3	2	2595
178	3	2	2595
179	3	2	2595
180	3	2	2595
181	3	2	2595
182	3	2	2595
183	3	2	2595
184	3	2	2595
185	3	2	2595
186	3	2	2595
187	3	2	2595
188	3	2	2595
189	3	2	2595
190	3	2	2595
191	3	2	2595
192	3	2	2595
193	3	2	2595
194	3	2	2595
195	3	2	2595
196	3	2	2595
197	3	2	2595
198	3	2	2595
199	3	2	2595
200	3	2	2595
201	3	2	2595
202	3	2	2595
203	3	2	2595
204	3	2	2595
205	3	2	2595
206	3	2	2595
207	3	2	2595
208	3	2	2595
209	3	2	2595
210	3	2	2595
211	3	2	2595
212	3	2	2595
213	3	2	2595
214	3	2	2595
215	3	2	2595
216	3	2	2595
217	3	2	2595
218	3	2	2595
219	3	2	2595
220	3	2	2595
221	3	2	2595
222	3	2	2595
223	3	2	2595
224	3	2	2595
225	3	2	2595
226	3	2	2595
227	3	2	2595
228	3	2	2595
229	3	2	2595
230	3	2	2595
231	3	2	2595
232	3	2	2595
233	3	2	2595
234	3	2	2595
235	3	2	2595
236	3	2	2595
237	3	2	2595
238	3	2	2595
239	3	2	2595
240	3	2	2595
241	3	2	2595
242	3	2	2595
243	3	2	2595
244	3	2	2595
245	3	2	2595
246	3	2	2595
247	3	2	2595
248	3	2	2595
249	3	2	2595
250	3	2	2595
251	3	2	2595
252	3	2	2595
253	3	2	2595
254	3	2	2595
255	3	2	2595
256	3	2	2595
257	3	2	2595
258	3	2	2595
259	3	2	2595
260	3	2	2595
261	3	2	2595
262	3	2	2595
263	3	2	2595
264	3	2	2595
265	3	2	2595
266	3	2	2595
267	3	2	2595
268	3	2	2595
269	3	2	2595
270	3	2	2595
271	3	2	2595
272	3	2	2595
273	3	2	2595
274	3	2	2595
275	3	2	2595
276	3	2	2595
277	3	2	2595
278	3	2	2595
279	3	2	2595
280	3	2	2595
281	3	2	2595
282	3	2	2595
283	3	2	2595
284	3	2	2595
285	3	2	2595
286	3	2	2595
287	3	2	2595
288	3	2	2595
289	3	2	2595
290	3	2	2595
291	3	2	2595
292	3	2	2595
293	3	2	2595
294	3	2	2595
295	3	2	2595
296	3	2	2595
297	3	2	2595
298	3	2	2595
299	3	2	2595
300	3	2	2595
301	3	2	2595
302	3	2	2595
303	3	2	2595
304	3	2	2595
305	3	2	2595
306	3	2	2595
307	3	2	2595
308	3	2	2595
309	3	2	2595
310	3	2	2595
311	3	2	2595
312	3	2	2595
313	3	2	2595
314	3	2	2595
315	3	2	2595
316	3	2	2595
317	3	2	2595
318	3	2	2595
319	3	2	2595
320	3	2	2595
321	3	2	2595
322	3	2	2595
323	3	2	2595
324	3	2	2595
325	3	2	2595
326	3	2	2595
327	3	2	2595
328	3	2	2595
329	3	2	2595
330	3	2	2595
331	3	2	2595
332	3	2	2595
333	3	2	2595
334	3	2	2595
335	3	2	2595
336	3	2	2595
337	3	2	2595
338	3	2	2595
339	3	2	2595
340	3	2	2595
341	3	2	2595
342	3	2	2595
343	3	2	2595
344	3	2	2595
345	3	2	2595
346	3	2	2595
347	3	2	2595
348	3	2	2595
349	3	2	2595
350	3	2	2595
351	3	2	2595
352	3	2	2595
353	3	2	2595
354	3	2	2595
355	3	2	2595
356	3	2	2595
357	3	2	2595
358	3	2	2595
359	3	2	2595
360	3	2	2595
361	3	2	2595
362	3	2	2595
363	3	2	2595
364	3	2	2595
365	3	2	2595
366	3	2	2595
367	3	2	2595
368	3	2	2595
369	3	2	2595
370	3	2	2595
371	3	2	2595
372	3	2	2595
373	3	2	2595
374	3	2	2595
375	3	2	2595
376	3	2	2595
377	3	2	2595
378	3	2	2595
379	3	2	2595
380	3	2	2595
381	3	2	2595
382	3	2	2595
383	3	2	2595
384	3	2	2595
385	3	2	2595
386	3	2	2595
387	3	2	2595
388	3	2	2595
389	3	2	2595
390	3	2	2595
391	3	2	2595
392	3	2	2595
393	3	2	2595
394	3	2	2595
395	3	2	2595
396	3	2	2595
397	3	2	2595
398	3	2	2595
399	3	2	2595
400	3	2	2595
401	3	2	2595
402	3	2	2595
403	3	2	2595
404	3	2	2595
405	3	2	2595
406	3	2	2595
407	3	2	2595
408	3	2	2595
409	3	2	2595
410	3	2	2595
411	3	2	2595
412	3	2	2595
413	3	2	2595
414	3	2	2595
415	3	2	2595
416	3	2	2595
417	3	2	2595
418	3	2	2595
419	3	2	2595
420	3	2	2595
421	3	2	2595
422	3	2	2595
423	3	2	2595
424	3	2	2595
425	3	2	2595
426	3	2	2595
427	3	2	2595
428	3	2	2595
429	3	2	2595
430	3	2	2595
431	3	2	2595
432	3	2	2595
433	3	2	2595
434	3	2	2595
435	3	2	2595
436	3	2	2595
437	3	2	2595
438	3	2	2595
439	3	2	2595
440	3	2	2595
441	3	2	2595
442	3	2	2595
443	3	2	2595
444	3	2	2595
445	3	2	2595
446	3	2	2595
447	3	2	2595
448	3	2	2595
449	3	2	2595
450	3	2	2595
451	3	2	2595
452	3	2	2595
453	3	2	2595
454	3	2	2595
455	3	2	2595
456	3	2	2595
457	3	2	2595
458	3	2	2595
459	3	2	2595
460	3	2	2595
461	3	2	2595
462	3	2	2595
463	3	2	2595
464	3	2	2595
465	3	2	2595
466	3	2	2595
467	3	2	2595
468	3	2	2595
469	3	2	2595
470	3	2	2595
471	3	2	2595
472	3	2	2595
473	3	2	2595
474	3	2	2595
475	3	2	2595
476	3	2	2595
477	3	2	2595
478	3	2	2595
479	3	2	2595
480	3	2	2595
481	3	2	2595
482	3	2	2595
483	3	2	2595
484	3	2	2595
485	3	2	2595
486	3	2	2595
487	3	2	2595
488	3	2	2595
489	3	2	2595
490	3	2	2595
491	3	2	2595
492	3	2	2595
493	3	2	2595
494	3	2	2595
495	3	2	2595
496	3	2	2595
497	3	2	2595
498	3	2	2595
499	3	2	2595
500	3	2	2595
501	3	2	2595
502	3	2	2595
503	3	2	2595
504	3	2	2595
505	3	2	2595
506	3	2	2595
507	3	2	2595
508	3	2	2595
509	3	2	2595
510	3	2	2595
511	3	2	2595
512	3	2	2595
513	3	2	2595
514	3	2	2595
515	3	2	2595
516	3	2	2595
517	3	2	2595
518	3	2	2595
519	3	2	2595
520	3	2	2595
521	3	2	2595
522	3	2	2595
523	3	2	2595
524	3	2	2595
525	3	2	2595
526	3	2	2595
527	3	2	2595
528	3	2	2595
529	3	2	2595
530	3	2	2595
531	3	2	2595
532	3	2	2595
533	3	2	2595
534	3	2	2595
535	3	2	2595
536	3	2	2595
537	3	2	2595
538	3	2	2595
539	3	2	2595
540	3	2	2595
541	3	2	2595
542	3	2	2595
543	3	2	2595
544	3	2	2595
545	3	2	2595
546	3	2	2595
547	3	2	2595
548	3	2	2595
549	3	2	2595
550	3	2	2595
551	3	2	2595
552	3	2	2595
553	3	2	2595
554	3	2	2595
555	3	2	2595
556	3	2	2595
557	3	2	2595
558	3	2	2595
559	3	2	2595
560	3	2	2595
561	3	2	2595
562	3	2	2595
563	3	2	2595
564	3	2	2595
565	3	2	2595
566	3	2	2595
567	3	2	2595
568	3	2	2595
569	3	2	2595
570	3	2	2595
571	3	2	2595
572	3	2	2595
573	3	2	2595
574	3	2	2595
575	3	2	2595
576	3	2	2595
577	3	2	2595
578	3	2	2595
579	3	2	2595
580	3	2	2595
581	3	2	2595
582	3	2	2595
583	3	2	2595
584	3	2	2595
585	3	2	2595
586	3	2	2595
587	3	2	2595
588	3	2	2595
589	3	2	2595
590	3	2	2595
591	3	2	2595
592	3	2	2595
593	3	2	2595
594	3	2	2595
595	3	2	2595
596	3	2	2595
597	3	2	2595
598	3	2	2595
599	3	2	2595
600	3	2	2595
601	3	2	2595
602	3	2	2595
603	3	2	2595
604	3	2	2595
605	3	2	2595
606	3	2	2595
607	3	2	2595
608	3	2	2595
609	3	2	2595
610	3	2	2595
611	3	2	2595
612	3	2	2595
613	3	2	2595
614	3	2	2595
615	3	2	2595
616	3	2	2595
617	3	2	2595
618	3	2	2595
619	3	2	2595
620	3	2	2595
621	3	2	2595
622	3	2	2595
623	3	2	2595
624	3	2	2595
625	3	2	2595
626	3	2	2595
627	3	2	2595
628	3	2	2595
629	3	2	2595
630	3	2	2595
631	3	2	2595
632	3	2	2595
633	3	2	2595
634	3	2	2595
635	3	2	2595
636	3	2	2595
637	3	2	2595
638	3	2	2595
639	3	2	2595
640	3	2	2595
641	3	2	2595
642	3	2	2595
643	3	2	2595
644	3	2	2595
645	3	2	2595
646	3	2	2595
647	3	2	2595
648	3	2	2595
649	3	2	2595
650	3	2	2595
651	3	2	2595
652	3	2	2595
653	3	2	2595
654	3	2	2595
655	3	2	2595
656	3	2	2595
657	3	2	2595
658	3	2	2595
659	3	2	2595
660	3	2	2595
661	3	2	2595
662	3	2	2595
663	3	2	2595
664	3	2	2595
665	3	2	2595
666	3	2	2595
667	3	2	2595
668	3	2	2595
669	3	2	2595
670	3	2	2595
671	3	2	2595
672	3	2	2595
673	3	2	2595
674	3	2	2595
675	3	2	2595
676	3	2	2595
677	3	2	2595
678	3	2	2595
679	3	2	2595
680	3	2	2595
681	3	2	2595
682	3	2	2595
683	3	2	2595
684	4	3	2900
685	4	2	2595
686	4	2	2595
687	4	1	2999
688	4	2	2595
689	4	2	2595
690	4	6	830
691	4	2	2595
692	4	5	9900
693	4	1	2999
694	4	2	2595
695	4	2	2595
696	4	2	2595
697	4	2	2595
698	4	2	2595
699	4	2	2595
700	4	2	2595
701	4	2	2595
702	4	2	2595
703	5	2	2595
704	5	3	2900
705	5	2	2595
706	2	1	2999
707	6	2	2595
708	6	5	9900
709	7	2	2595
710	8	2	2595
711	8	5	9900
712	8	1	2999
713	9	6	830
714	9	4	999
715	9	5	9900
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-03-12 03:46:53.288375+00
2	2020-03-12 16:16:02.934729+00
3	2020-03-12 21:09:37.254701+00
4	2020-03-12 21:19:02.657269+00
5	2020-03-12 23:42:59.400271+00
6	2020-03-13 03:26:59.731944+00
7	2020-03-13 03:51:43.069466+00
8	2020-03-13 04:10:34.01667+00
9	2020-03-13 15:58:06.444145+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Shake Weight	2999	/images/shake-weight.jpg	Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
2	ShamWow	2595	/images/shamwow.jpg	It's like a chamois, towel, and sponge, all in one! Soaks up to 10x it's weight in any liquid!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
3	Snuggie	2900	/images/snuggie.jpg	Super-Soft Fleece with pockets! One Size fits all Adults! Keeps you Warm & Your Hands-Free!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
4	Wax Vac	999	/images/wax-vac.jpg	Gentle way to remove ear wax. Safe and hygienic. Reduces the risk of painful infections.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
5	Ostrich Pillow	9900	/images/ostrich-pillow.jpg	Create your own snugly space in the world and feel-good anywhere with the ultimate cocoon pillow.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
6	Tater Mitts	830	/images/tater-mitts.jpg	8 Seconds is all you need with Tater Mitts. Quickly and easily prepare all your favorite potato dishes with Tater Mitts.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 715, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 9, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

