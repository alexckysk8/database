--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    best_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    frequent_games integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 233);
INSERT INTO public.games VALUES (2, 1, 688);
INSERT INTO public.games VALUES (3, 2, 890);
INSERT INTO public.games VALUES (4, 2, 609);
INSERT INTO public.games VALUES (5, 1, 372);
INSERT INTO public.games VALUES (6, 1, 807);
INSERT INTO public.games VALUES (7, 1, 180);
INSERT INTO public.games VALUES (8, 3, 579);
INSERT INTO public.games VALUES (9, 3, 616);
INSERT INTO public.games VALUES (10, 4, 173);
INSERT INTO public.games VALUES (11, 4, 523);
INSERT INTO public.games VALUES (12, 3, 38);
INSERT INTO public.games VALUES (13, 3, 343);
INSERT INTO public.games VALUES (14, 3, 46);
INSERT INTO public.games VALUES (15, 5, 244);
INSERT INTO public.games VALUES (16, 5, 483);
INSERT INTO public.games VALUES (17, 6, 621);
INSERT INTO public.games VALUES (18, 6, 59);
INSERT INTO public.games VALUES (19, 5, 302);
INSERT INTO public.games VALUES (20, 5, 202);
INSERT INTO public.games VALUES (21, 5, 108);
INSERT INTO public.games VALUES (22, 7, 676);
INSERT INTO public.games VALUES (23, 7, 227);
INSERT INTO public.games VALUES (24, 8, 719);
INSERT INTO public.games VALUES (25, 8, 591);
INSERT INTO public.games VALUES (26, 7, 949);
INSERT INTO public.games VALUES (27, 7, 60);
INSERT INTO public.games VALUES (28, 7, 536);
INSERT INTO public.games VALUES (29, 9, 873);
INSERT INTO public.games VALUES (30, 9, 635);
INSERT INTO public.games VALUES (31, 10, 19);
INSERT INTO public.games VALUES (32, 10, 429);
INSERT INTO public.games VALUES (33, 9, 164);
INSERT INTO public.games VALUES (34, 9, 702);
INSERT INTO public.games VALUES (35, 9, 778);
INSERT INTO public.games VALUES (36, 11, 481);
INSERT INTO public.games VALUES (37, 11, 566);
INSERT INTO public.games VALUES (38, 12, 395);
INSERT INTO public.games VALUES (39, 12, 715);
INSERT INTO public.games VALUES (40, 11, 211);
INSERT INTO public.games VALUES (41, 11, 811);
INSERT INTO public.games VALUES (42, 11, 56);
INSERT INTO public.games VALUES (43, 13, 543);
INSERT INTO public.games VALUES (44, 13, 406);
INSERT INTO public.games VALUES (45, 14, 127);
INSERT INTO public.games VALUES (46, 14, 764);
INSERT INTO public.games VALUES (47, 13, 196);
INSERT INTO public.games VALUES (48, 13, 571);
INSERT INTO public.games VALUES (49, 13, 332);
INSERT INTO public.games VALUES (50, 15, 239);
INSERT INTO public.games VALUES (51, 15, 874);
INSERT INTO public.games VALUES (52, 16, 933);
INSERT INTO public.games VALUES (53, 16, 802);
INSERT INTO public.games VALUES (54, 15, 550);
INSERT INTO public.games VALUES (55, 15, 836);
INSERT INTO public.games VALUES (56, 15, 805);
INSERT INTO public.games VALUES (57, 17, 440);
INSERT INTO public.games VALUES (58, 17, 770);
INSERT INTO public.games VALUES (59, 18, 755);
INSERT INTO public.games VALUES (60, 18, 164);
INSERT INTO public.games VALUES (61, 17, 25);
INSERT INTO public.games VALUES (62, 17, 666);
INSERT INTO public.games VALUES (63, 17, 143);
INSERT INTO public.games VALUES (64, 19, 622);
INSERT INTO public.games VALUES (65, 19, 61);
INSERT INTO public.games VALUES (66, 20, 822);
INSERT INTO public.games VALUES (67, 20, 370);
INSERT INTO public.games VALUES (68, 19, 783);
INSERT INTO public.games VALUES (69, 19, 711);
INSERT INTO public.games VALUES (70, 19, 512);
INSERT INTO public.games VALUES (71, 21, 513);
INSERT INTO public.games VALUES (72, 21, 180);
INSERT INTO public.games VALUES (73, 22, 169);
INSERT INTO public.games VALUES (74, 22, 227);
INSERT INTO public.games VALUES (75, 21, 764);
INSERT INTO public.games VALUES (76, 21, 255);
INSERT INTO public.games VALUES (77, 21, 47);
INSERT INTO public.games VALUES (78, 23, 121);
INSERT INTO public.games VALUES (79, 23, 587);
INSERT INTO public.games VALUES (80, 24, 926);
INSERT INTO public.games VALUES (81, 24, 620);
INSERT INTO public.games VALUES (82, 23, 875);
INSERT INTO public.games VALUES (83, 23, 701);
INSERT INTO public.games VALUES (84, 23, 588);
INSERT INTO public.games VALUES (85, 25, 956);
INSERT INTO public.games VALUES (86, 25, 268);
INSERT INTO public.games VALUES (87, 26, 50);
INSERT INTO public.games VALUES (88, 26, 325);
INSERT INTO public.games VALUES (89, 25, 49);
INSERT INTO public.games VALUES (90, 25, 609);
INSERT INTO public.games VALUES (91, 25, 778);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1744139311909', 2);
INSERT INTO public.users VALUES (1, 'user_1744139311910', 5);
INSERT INTO public.users VALUES (26, 'user_1744139756513', 2);
INSERT INTO public.users VALUES (4, 'user_1744139341409', 2);
INSERT INTO public.users VALUES (3, 'user_1744139341410', 5);
INSERT INTO public.users VALUES (25, 'user_1744139756514', 5);
INSERT INTO public.users VALUES (6, 'user_1744139381875', 2);
INSERT INTO public.users VALUES (5, 'user_1744139381876', 5);
INSERT INTO public.users VALUES (8, 'user_1744139408983', 2);
INSERT INTO public.users VALUES (7, 'user_1744139408984', 5);
INSERT INTO public.users VALUES (10, 'user_1744139559206', 2);
INSERT INTO public.users VALUES (9, 'user_1744139559207', 5);
INSERT INTO public.users VALUES (12, 'user_1744139574876', 2);
INSERT INTO public.users VALUES (11, 'user_1744139574877', 5);
INSERT INTO public.users VALUES (14, 'user_1744139580335', 2);
INSERT INTO public.users VALUES (13, 'user_1744139580336', 5);
INSERT INTO public.users VALUES (16, 'user_1744139592980', 2);
INSERT INTO public.users VALUES (15, 'user_1744139592981', 5);
INSERT INTO public.users VALUES (18, 'user_1744139597603', 2);
INSERT INTO public.users VALUES (17, 'user_1744139597604', 5);
INSERT INTO public.users VALUES (20, 'user_1744139600902', 2);
INSERT INTO public.users VALUES (19, 'user_1744139600903', 5);
INSERT INTO public.users VALUES (22, 'user_1744139607141', 2);
INSERT INTO public.users VALUES (21, 'user_1744139607142', 5);
INSERT INTO public.users VALUES (24, 'user_1744139618003', 2);
INSERT INTO public.users VALUES (23, 'user_1744139618004', 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 91, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

