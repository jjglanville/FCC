--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(15) NOT NULL,
    no_main_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type_id integer,
    size_in_kiloparsecs numeric(7,2),
    discovered_in_21st_century boolean,
    distance_from_earth_kiloparsecs numeric(8,2)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(15) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    time_to_orbit_planet_in_hours integer,
    planets_only_moon boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_type_id integer,
    in_solar_system boolean
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(15) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    constellation_id integer,
    distance_from_earth_ly numeric(11,9)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Centaurus', 11);
INSERT INTO public.constellation VALUES (2, 'Canis Major', 8);
INSERT INTO public.constellation VALUES (3, 'Eridanus', 24);
INSERT INTO public.constellation VALUES (4, 'Canis Minor', 2);
INSERT INTO public.constellation VALUES (5, 'Cygnus', 9);
INSERT INTO public.constellation VALUES (6, 'Indus', 3);
INSERT INTO public.constellation VALUES (7, 'Cetus', 14);
INSERT INTO public.constellation VALUES (8, 'Ursa Major', 7);
INSERT INTO public.constellation VALUES (9, 'Ophiuchus', 10);
INSERT INTO public.constellation VALUES (10, 'Aquila', 10);
INSERT INTO public.constellation VALUES (11, 'Draco', 14);
INSERT INTO public.constellation VALUES (12, 'Libra', 4);
INSERT INTO public.constellation VALUES (13, 'Cassiopeia', 5);
INSERT INTO public.constellation VALUES (14, 'Pavo', 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 1, 26.80, false, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 46.56, false, 765.00);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxy', NULL, 150.00, false, 13797.10);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 1, NULL, false, 6132.02);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 1, 16.51, false, 4077.80);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 1, 27.60, false, 3679.20);
INSERT INTO public.galaxy VALUES (7, 'Butterfly Galaxies', 1, NULL, false, 18396.10);
INSERT INTO public.galaxy VALUES (9, 'Messier 82', 4, 11.30, false, 3679.20);
INSERT INTO public.galaxy VALUES (8, 'Cartwheel Galaxy', 2, 44.23, false, 153300.70);
INSERT INTO public.galaxy VALUES (10, 'Circinus Galaxy', 1, NULL, false, 3985.80);
INSERT INTO public.galaxy VALUES (11, 'Messier 99', 1, NULL, false, 15023.50);
INSERT INTO public.galaxy VALUES (12, 'Comet Galaxy', 1, 183.90, true, 981124.50);
INSERT INTO public.galaxy VALUES (13, 'Condor Galaxy', 1, 160.00, false, 64999.50);
INSERT INTO public.galaxy VALUES (14, 'NGC 4151', 1, NULL, false, 15943.30);
INSERT INTO public.galaxy VALUES (15, 'Fireworks Galaxy', 1, 12.30, false, 7726.40);
INSERT INTO public.galaxy VALUES (16, 'Lindsay-Shapley Ring', 2, NULL, false, 91980.40);
INSERT INTO public.galaxy VALUES (17, 'The Little Sombrero', 1, 18.40, false, 12264.10);
INSERT INTO public.galaxy VALUES (18, 'Malin 1', 1, 200.00, false, 364855.70);
INSERT INTO public.galaxy VALUES (19, 'Pinwheel Galaxy', 1, 51.91, false, 6407.90);
INSERT INTO public.galaxy VALUES (20, 'Sombrero Galaxy', NULL, 15.00, false, 9535.30);
INSERT INTO public.galaxy VALUES (21, 'Triangulum Galaxy', 1, 18.74, false, 970.00);
INSERT INTO public.galaxy VALUES (22, 'Whirlpool Galaxy', 1, 23.30, false, 9504.60);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A flat rotating disk of stars, gas and dust 
with a central bulge surrounded by a fainter halo of stars');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical', 'Composed of older lower mass stars with sparse interstellar medium. 
Stars orbit the galactic centre, but do so in more random directions.');
INSERT INTO public.galaxy_type VALUES (2, 'Lenticular', 'A thin rotating disk of stars with a central bulge but no spiral arms.
Tend to be composed of older stars and have lost or used up most interstellar matter');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'These to do form a particular shape. Often due to gravitational influence from other 
galaxies. They contain an abundance of gas an dust and often contain many newly formed/forming stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 708, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 8, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 30, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 66, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 109, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 196, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 425, false);
INSERT INTO public.moon VALUES (8, 'Leda', 5, 5784, false);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 21, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 34, false);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 46, false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 65, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 108, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 58, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 84, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 123, false);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 233, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 347, false);
INSERT INTO public.moon VALUES (19, 'Naiad', 8, 31, false);
INSERT INTO public.moon VALUES (20, 'Thalassa', 8, 31, false);
INSERT INTO public.moon VALUES (21, 'Despina', 8, 32, false);
INSERT INTO public.moon VALUES (22, 'Galatea', 8, 34, false);
INSERT INTO public.moon VALUES (23, 'Larissa', 8, 37, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, true);
INSERT INTO public.planet VALUES (9, 'Eridani B', 14, 2, false);
INSERT INTO public.planet VALUES (10, 'Eridani D', 14, 2, false);
INSERT INTO public.planet VALUES (11, 'Tau Ceti G', 7, NULL, false);
INSERT INTO public.planet VALUES (12, 'Tau Ceti H', 7, NULL, false);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (3, 'Neptune-like', 'Likely to have a mixture of interior conponents, but most will have
hydrogen adn helium dominated atmospheres and rocky cores.');
INSERT INTO public.planet_type VALUES (1, 'Gas Giant', 'Giant planet the size of Saturn/Jupiter or larger. Composed primarily of 
gases such as hydrogen and helium.');
INSERT INTO public.planet_type VALUES (2, 'Super-Earth', 'Terrestrial planets with a mass higher than Earth but lighter than Neptune/Uranus.');
INSERT INTO public.planet_type VALUES (4, 'Terrestrial', 'Earth sized and smaller comprising rock, silicate, water or carbon.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 1, 1, 4.344100000);
INSERT INTO public.star VALUES (3, 'Toliman', 1, 1, 4.344100000);
INSERT INTO public.star VALUES (1, 'Sol', 1, NULL, 0.000015800);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2, 8.709400000);
INSERT INTO public.star VALUES (5, 'Ran', 1, 3, 10.474900000);
INSERT INTO public.star VALUES (6, 'Procyon', 1, 4, 11.402000000);
INSERT INTO public.star VALUES (7, 'Tau-Ceti', 1, 7, 11.911800000);
INSERT INTO public.star VALUES (8, 'Groombridge 1618', 1, 8, 15.885700000);
INSERT INTO public.star VALUES (9, 'Keid', 1, 3, 16.333000000);
INSERT INTO public.star VALUES (10, 'Altair', 1, 10, 16.730000000);
INSERT INTO public.star VALUES (11, 'Alsafi', 1, 11, 18.799300000);
INSERT INTO public.star VALUES (12, 'Achird', 1, 13, 19.331400000);
INSERT INTO public.star VALUES (13, 'Guniibuu', 1, 9, 19.418500000);
INSERT INTO public.star VALUES (14, 'Eridani', 1, 3, 19.704500000);
INSERT INTO public.star VALUES (15, 'Delta Pavonis', 1, 14, 19.741400000);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 14, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 22, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

