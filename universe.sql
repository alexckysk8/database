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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    age_in_billions_of_years numeric,
    galaxy_types character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric NOT NULL,
    distance_from_planet_km integer NOT NULL,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric NOT NULL,
    planet_types character varying(50) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    crew_capacity integer NOT NULL,
    has_docking_bay boolean NOT NULL,
    power_output_mw numeric
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    temperature_kelvin integer NOT NULL,
    mass_solar numeric NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13.6, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy', false, 10.1, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the Local Group', false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy in Virgo Cluster', false, 13.2, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Spiral galaxy with a prominent dust lane', false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Grand design spiral galaxy', false, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Distant Spiral', 'A far-off spiral galaxy', false, 8.5, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Nearby Elliptical', 'A close elliptical galaxy', false, 11.2, 'Elliptical');
INSERT INTO public.galaxy VALUES (9, 'Irregular Formation', 'A galaxy with no clear shape', false, 5.1, 'Irregular');
INSERT INTO public.galaxy VALUES (10, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', false, 6.5, 'Irregular');
INSERT INTO public.galaxy VALUES (11, 'Small Magellanic Cloud', 'Another satellite galaxy', false, 13.0, 'Irregular');
INSERT INTO public.galaxy VALUES (12, 'Pinwheel Galaxy', 'A face-on spiral galaxy', false, NULL, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 7, 'Moon of Temperate World A', 'A moon orbiting the temperate planet', false, 12.5, 60000, false);
INSERT INTO public.moon VALUES (7, 7, 'Moon of Temperate World B', 'Another moon of the temperate planet', true, 25.1, 120000, false);
INSERT INTO public.moon VALUES (8, 8, 'Satellite of Ceres Major', 'A satellite of the dwarf planet Ceres', false, 5.8, 30000, false);
INSERT INTO public.moon VALUES (9, 9, 'Minor Moon of Vesta', 'A small moon orbiting the asteroid Vesta', false, 1.2, 5000, false);
INSERT INTO public.moon VALUES (10, 7, 'Icy Moon of Temperate World', 'An icy moon', true, 18.0, 90000, true);
INSERT INTO public.moon VALUES (11, 8, 'Dusty Ring Moon of Ceres', 'A moon embedded in a dusty ring', false, 2.1, 15000, false);
INSERT INTO public.moon VALUES (12, 9, 'Captured Asteroid Moon of Vesta', 'Likely a captured asteroid', false, 30.0, 80000, false);
INSERT INTO public.moon VALUES (13, 7, 'Rocky Inner Moon', 'A rocky moon close to the planet', true, 3.5, 40000, false);
INSERT INTO public.moon VALUES (14, 8, 'Outer Satellite of Ceres', 'A more distant satellite', false, 15.5, 70000, false);
INSERT INTO public.moon VALUES (15, 9, 'Fast Orbiting Moon of Vesta', 'A moon with a very quick orbit', false, 0.8, 3000, false);
INSERT INTO public.moon VALUES (16, 7, 'Temperate Moon C', 'A third moon of the temperate planet', false, 9.2, 70000, false);
INSERT INTO public.moon VALUES (17, 8, 'Ceres Minor Satellite', 'A smaller satellite of Ceres', true, 3.1, 20000, false);
INSERT INTO public.moon VALUES (18, 9, 'Vesta Inner Moon', 'An inner moon of Vesta', false, 0.5, 2500, false);
INSERT INTO public.moon VALUES (19, 7, 'Rocky Outer Moon', 'A rocky moon further out', true, 21.7, 110000, false);
INSERT INTO public.moon VALUES (20, 7, 'Temperate World Moon D', 'A fourth moon', false, 11.5, 78000, false);
INSERT INTO public.moon VALUES (21, 8, 'Ceres Satellite B', 'Another satellite of Ceres', true, 4.2, 25000, false);
INSERT INTO public.moon VALUES (22, 9, 'Vesta Moon Alpha', 'A significant moon of Vesta', true, 1.8, 10000, false);
INSERT INTO public.moon VALUES (23, 7, 'Rocky Moon Gamma', 'Another rocky moon', false, 19.1, 105000, false);
INSERT INTO public.moon VALUES (24, 8, 'Ceres Outer Ring Moon', 'A moon near the outer rings', false, 17.3, 85000, false);
INSERT INTO public.moon VALUES (25, 9, 'Vesta Moon Beta', 'A second significant moon of Vesta', true, 2.5, 15000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 3, 'Temperate World', 'A planet with potential for liquid water', true, true, 380.0, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 1, 'Ceres', 'Largest object in the asteroid belt', false, true, 1680.0, 'Dwarf Planet');
INSERT INTO public.planet VALUES (9, 1, 'Vesta', 'One of the largest asteroids', false, false, 1325.0, 'Asteroid');
INSERT INTO public.planet VALUES (12, 1, 'Mercury', 'Innermost planet of our solar system', false, true, 88.0, 'Terrestrial');
INSERT INTO public.planet VALUES (13, 1, 'Venus', 'Second planet from the Sun', false, true, 224.7, 'Terrestrial');
INSERT INTO public.planet VALUES (14, 1, 'Earth', 'Our home planet', true, true, 365.25, 'Terrestrial');
INSERT INTO public.planet VALUES (15, 1, 'Mars', 'The Red Planet', false, true, 687.0, 'Terrestrial');
INSERT INTO public.planet VALUES (16, 1, 'Jupiter', 'Largest planet in our solar system', false, true, 4331.0, 'Gas Giant');
INSERT INTO public.planet VALUES (17, 1, 'Saturn', 'Ringed gas giant', false, true, 10747.0, 'Gas Giant');
INSERT INTO public.planet VALUES (18, 1, 'Uranus', 'Ice giant with tilted axis', false, true, 30584.0, 'Ice Giant');
INSERT INTO public.planet VALUES (19, 1, 'Neptune', 'Farthest known planet in our solar system', false, true, 59800.0, 'Ice Giant');
INSERT INTO public.planet VALUES (23, 5, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', false, true, 11.2, 'Exoplanet');


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'Orbital Lab Alpha', 'A research outpost in orbit', 5, true, 0.05);
INSERT INTO public.space_station VALUES (2, 'Commercial Hub One', 'A privately owned space station', 10, true, 0.1);
INSERT INTO public.space_station VALUES (3, 'Exploration Platform Gamma', 'A station dedicated to deep-space exploration prep', 3, false, 0.08);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Blue Giant', 'A large, hot, blue star', true, 25000, 15.0);
INSERT INTO public.star VALUES (2, 2, 'Red Dwarf', 'A small, cool, red star', true, 3500, 0.3);
INSERT INTO public.star VALUES (3, 1, 'Yellow Main Sequence', 'A middle-aged, yellow star', true, 6000, 1.1);
INSERT INTO public.star VALUES (4, 1, 'Giant Red Star', 'A large, aging red star', true, 4000, 2.5);
INSERT INTO public.star VALUES (5, 3, 'White Dwarf Star', 'The remnant of a low-mass star', true, 15000, 0.8);
INSERT INTO public.star VALUES (6, 2, 'Neutron Star', 'A very dense stellar remnant', false, 600000, 1.8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

