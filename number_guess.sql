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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1744115960649', 356, 400);
INSERT INTO public.users VALUES ('user_1744115960650', 1024, 146);
INSERT INTO public.users VALUES ('Alex', 0, NULL);
INSERT INTO public.users VALUES ('user_1744117262715', 608, 528);
INSERT INTO public.users VALUES ('user_1744116024833', 434, 919);
INSERT INTO public.users VALUES ('user_1744117262716', 878, 618);
INSERT INTO public.users VALUES ('user_1744116024834', 994, 694);
INSERT INTO public.users VALUES ('user_1744118005768', 2, 248);
INSERT INTO public.users VALUES ('user_1744116345962', 468, 754);
INSERT INTO public.users VALUES ('user_1744122016601', 5, 92);
INSERT INTO public.users VALUES ('user_1744117378227', 2, 236);
INSERT INTO public.users VALUES ('user_1744116345963', 992, 213);
INSERT INTO public.users VALUES ('user_1744118005769', 5, 20);
INSERT INTO public.users VALUES ('user_1744117378228', 5, 473);
INSERT INTO public.users VALUES ('user_1744116466307', 108, 923);
INSERT INTO public.users VALUES ('user_1744119277108', 2, 226);
INSERT INTO public.users VALUES ('user_1744116466308', 1024, 514);
INSERT INTO public.users VALUES ('user_1744116862550', 20, 738);
INSERT INTO public.users VALUES ('user_1744117583357', 2, 724);
INSERT INTO public.users VALUES ('user_1744122279198', 2, 93);
INSERT INTO public.users VALUES ('user_1744116862551', 992, 1000);
INSERT INTO public.users VALUES ('user_1744118008115', 2, 69);
INSERT INTO public.users VALUES ('user_1744117583358', 5, 559);
INSERT INTO public.users VALUES ('user_1744116920523', 610, 50);
INSERT INTO public.users VALUES ('user_1744119277109', 5, 204);
INSERT INTO public.users VALUES ('user_1744116920524', 1020, 192);
INSERT INTO public.users VALUES ('user_1744118008116', 5, 76);
INSERT INTO public.users VALUES ('user_1744117585724', 2, 140);
INSERT INTO public.users VALUES ('user_1744117118740', 484, 951);
INSERT INTO public.users VALUES ('user_1744117118741', 1022, 961);
INSERT INTO public.users VALUES ('user_1744117585725', 5, 145);
INSERT INTO public.users VALUES ('user_1744117160753', 184, 506);
INSERT INTO public.users VALUES ('user_1744117160754', 1868, 769);
INSERT INTO public.users VALUES ('user_1744117670919', 2, 128);
INSERT INTO public.users VALUES ('user_1744118240731', 2, 350);
INSERT INTO public.users VALUES ('user_1744122573375', 1, 97);
INSERT INTO public.users VALUES ('user_1744117670920', 5, 12);
INSERT INTO public.users VALUES ('user_1744119736120', 2, 508);
INSERT INTO public.users VALUES ('user_1744118240732', 5, 566);
INSERT INTO public.users VALUES ('user_1744117673045', 2, 359);
INSERT INTO public.users VALUES ('user_1744122126294', 2, 251);
INSERT INTO public.users VALUES ('user_1744122279199', 5, 194);
INSERT INTO public.users VALUES ('user_1744117673046', 5, 485);
INSERT INTO public.users VALUES ('user_1744119736121', 5, 11);
INSERT INTO public.users VALUES ('user_1744118394468', 2, 797);
INSERT INTO public.users VALUES ('user_1744117850381', 2, 458);
INSERT INTO public.users VALUES ('user_1744117850382', 5, 355);
INSERT INTO public.users VALUES ('user_1744118394469', 5, 292);
INSERT INTO public.users VALUES ('user_1744122126295', 5, 427);
INSERT INTO public.users VALUES ('user_1744117852805', 2, 19);
INSERT INTO public.users VALUES ('user_1744117852806', 5, 330);
INSERT INTO public.users VALUES ('user_1744118604694', 2, 494);
INSERT INTO public.users VALUES ('user_1744119738490', 2, 576);
INSERT INTO public.users VALUES ('user_1744118604695', 5, 25);
INSERT INTO public.users VALUES ('user_1744119738491', 5, 162);
INSERT INTO public.users VALUES ('user_1744118951421', 2, 500);
INSERT INTO public.users VALUES ('user_1744118951422', 5, 146);
INSERT INTO public.users VALUES ('user_1744122128517', 2, 403);
INSERT INTO public.users VALUES ('user_1744121061266', 2, 120);
INSERT INTO public.users VALUES ('user_1744118959441', 2, 592);
INSERT INTO public.users VALUES ('user_1744122282909', 2, 472);
INSERT INTO public.users VALUES ('user_1744118959442', 5, 135);
INSERT INTO public.users VALUES ('user_1744121061267', 5, 189);
INSERT INTO public.users VALUES ('user_1744122128518', 5, 329);
INSERT INTO public.users VALUES ('user_1744119022487', 2, 163);
INSERT INTO public.users VALUES ('user_1744119022488', 5, 273);
INSERT INTO public.users VALUES ('user_1744122573376', 4, 183);
INSERT INTO public.users VALUES ('user_1744121072993', 2, 286);
INSERT INTO public.users VALUES ('user_1744121072994', 5, 349);
INSERT INTO public.users VALUES ('user_1744122282910', 5, 217);
INSERT INTO public.users VALUES ('user_1744119260674', 2, 480);
INSERT INTO public.users VALUES ('user_1744122130701', 2, 575);
INSERT INTO public.users VALUES ('user_1744121250521', 2, 400);
INSERT INTO public.users VALUES ('user_1744119260675', 5, 165);
INSERT INTO public.users VALUES ('user_1744122130702', 5, 118);
INSERT INTO public.users VALUES ('user_1744121250522', 5, 213);
INSERT INTO public.users VALUES ('Jorge', 0, NULL);
INSERT INTO public.users VALUES ('user_1744121345641', 2, 166);
INSERT INTO public.users VALUES ('user_1744121345642', 5, 200);
INSERT INTO public.users VALUES ('user', 0, NULL);
INSERT INTO public.users VALUES ('users', 0, NULL);
INSERT INTO public.users VALUES ('user_1744122236686', 2, 693);
INSERT INTO public.users VALUES ('user_1744122290008', 2, 287);
INSERT INTO public.users VALUES ('user_1744122016600', 2, 268);
INSERT INTO public.users VALUES ('user_1744122236687', 5, 55);
INSERT INTO public.users VALUES ('user_1744122290009', 5, 115);
INSERT INTO public.users VALUES ('user_1744122273359', 2, 196);
INSERT INTO public.users VALUES ('user_1744122273360', 5, 3);
INSERT INTO public.users VALUES ('user_1744122509458', 1, 430);
INSERT INTO public.users VALUES ('user_1744122509459', 4, 374);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

