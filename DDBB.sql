--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-12-01 11:59:42

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
-- TOC entry 216 (class 1259 OID 32783)
-- Name: aeropuerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeropuerto (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    pais character varying(100) NOT NULL,
    ciudad character varying(100) NOT NULL,
    direccion character varying(200) NOT NULL
);


ALTER TABLE public.aeropuerto OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32782)
-- Name: aeropuerto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aeropuerto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aeropuerto_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 215
-- Name: aeropuerto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aeropuerto_id_seq OWNED BY public.aeropuerto.id;


--
-- TOC entry 218 (class 1259 OID 32792)
-- Name: avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avion (
    id_avion integer NOT NULL,
    nro_serie character varying(50) NOT NULL,
    modelo character varying(50) NOT NULL,
    capacidad integer NOT NULL,
    "año" integer NOT NULL
);


ALTER TABLE public.avion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32791)
-- Name: avion_id_avion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avion_id_avion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avion_id_avion_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 217
-- Name: avion_id_avion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avion_id_avion_seq OWNED BY public.avion.id_avion;


--
-- TOC entry 226 (class 1259 OID 32839)
-- Name: carga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carga (
    id_carga integer NOT NULL,
    tipo character varying(50) NOT NULL,
    descripcion text NOT NULL,
    peso numeric(10,2) NOT NULL,
    volumen numeric(10,2) NOT NULL,
    origen integer NOT NULL,
    destino integer NOT NULL
);


ALTER TABLE public.carga OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32838)
-- Name: carga_id_carga_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 225
-- Name: carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carga_id_carga_seq OWNED BY public.carga.id_carga;


--
-- TOC entry 231 (class 1259 OID 32906)
-- Name: carga_vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carga_vuelo (
    id_vuelo integer NOT NULL,
    id_carga integer NOT NULL
);


ALTER TABLE public.carga_vuelo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32830)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cargo character varying(50) NOT NULL,
    correo character varying(100) NOT NULL,
    telefono character varying(15) NOT NULL,
    hoja_vida text NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32829)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;


--
-- TOC entry 228 (class 1259 OID 32858)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    cliente_carga character varying(50) NOT NULL,
    descripcion text NOT NULL,
    saldo_total numeric(10,2) NOT NULL,
    fecha date NOT NULL,
    forma_pago character varying(50) NOT NULL,
    id_pasajero integer,
    id_carga integer
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32857)
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_factura_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;


--
-- TOC entry 222 (class 1259 OID 32823)
-- Name: pasajero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasajero (
    id_pasajero integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    telefono character varying(15) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion_residencia character varying(200) NOT NULL
);


ALTER TABLE public.pasajero OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32822)
-- Name: pasajero_id_pasajero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pasajero_id_pasajero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pasajero_id_pasajero_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 221
-- Name: pasajero_id_pasajero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pasajero_id_pasajero_seq OWNED BY public.pasajero.id_pasajero;


--
-- TOC entry 230 (class 1259 OID 32891)
-- Name: pasajero_vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasajero_vuelo (
    id_vuelo integer NOT NULL,
    id_pasajero integer NOT NULL
);


ALTER TABLE public.pasajero_vuelo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32801)
-- Name: vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo (
    id_vuelo integer NOT NULL,
    tipo_vuelo character varying(50) NOT NULL,
    fecha_salida date NOT NULL,
    fecha_llegada date NOT NULL,
    duracion interval NOT NULL,
    origen integer NOT NULL,
    destino integer NOT NULL,
    id_avion integer NOT NULL
);


ALTER TABLE public.vuelo OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32876)
-- Name: vuelo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo_empleado (
    id_vuelo integer NOT NULL,
    id_empleado integer NOT NULL
);


ALTER TABLE public.vuelo_empleado OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32800)
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vuelo_id_vuelo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vuelo_id_vuelo_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 219
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vuelo_id_vuelo_seq OWNED BY public.vuelo.id_vuelo;


--
-- TOC entry 4676 (class 2604 OID 32786)
-- Name: aeropuerto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeropuerto ALTER COLUMN id SET DEFAULT nextval('public.aeropuerto_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 32795)
-- Name: avion id_avion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion ALTER COLUMN id_avion SET DEFAULT nextval('public.avion_id_avion_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 32842)
-- Name: carga id_carga; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga ALTER COLUMN id_carga SET DEFAULT nextval('public.carga_id_carga_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 32833)
-- Name: empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 32861)
-- Name: factura id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 32826)
-- Name: pasajero id_pasajero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero ALTER COLUMN id_pasajero SET DEFAULT nextval('public.pasajero_id_pasajero_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 32804)
-- Name: vuelo id_vuelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo ALTER COLUMN id_vuelo SET DEFAULT nextval('public.vuelo_id_vuelo_seq'::regclass);


--
-- TOC entry 4862 (class 0 OID 32783)
-- Dependencies: 216
-- Data for Name: aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeropuerto (id, nombre, pais, ciudad, direccion) FROM stdin;
1	 Aeropuerto El Dorado	Colombia	Bogota	Av.123
2	 Aeropuerto El Dorado	Colombia	Bogota	Av.123
\.


--
-- TOC entry 4864 (class 0 OID 32792)
-- Dependencies: 218
-- Data for Name: avion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avion (id_avion, nro_serie, modelo, capacidad, "año") FROM stdin;
\.


--
-- TOC entry 4872 (class 0 OID 32839)
-- Dependencies: 226
-- Data for Name: carga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carga (id_carga, tipo, descripcion, peso, volumen, origen, destino) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 32906)
-- Dependencies: 231
-- Data for Name: carga_vuelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carga_vuelo (id_vuelo, id_carga) FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 32830)
-- Dependencies: 224
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (id_empleado, nombre, cargo, correo, telefono, hoja_vida) FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 32858)
-- Dependencies: 228
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id_factura, cliente_carga, descripcion, saldo_total, fecha, forma_pago, id_pasajero, id_carga) FROM stdin;
\.


--
-- TOC entry 4868 (class 0 OID 32823)
-- Dependencies: 222
-- Data for Name: pasajero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasajero (id_pasajero, nombre, correo, telefono, fecha_nacimiento, direccion_residencia) FROM stdin;
\.


--
-- TOC entry 4876 (class 0 OID 32891)
-- Dependencies: 230
-- Data for Name: pasajero_vuelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasajero_vuelo (id_vuelo, id_pasajero) FROM stdin;
\.


--
-- TOC entry 4866 (class 0 OID 32801)
-- Dependencies: 220
-- Data for Name: vuelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelo (id_vuelo, tipo_vuelo, fecha_salida, fecha_llegada, duracion, origen, destino, id_avion) FROM stdin;
\.


--
-- TOC entry 4875 (class 0 OID 32876)
-- Dependencies: 229
-- Data for Name: vuelo_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelo_empleado (id_vuelo, id_empleado) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 215
-- Name: aeropuerto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aeropuerto_id_seq', 2, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 217
-- Name: avion_id_avion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avion_id_avion_seq', 1, false);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 225
-- Name: carga_id_carga_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carga_id_carga_seq', 1, false);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 1, false);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_factura_seq', 1, false);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 221
-- Name: pasajero_id_pasajero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pasajero_id_pasajero_seq', 1, false);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 219
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vuelo_id_vuelo_seq', 1, false);


--
-- TOC entry 4684 (class 2606 OID 32790)
-- Name: aeropuerto aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeropuerto
    ADD CONSTRAINT aeropuerto_pkey PRIMARY KEY (id);


--
-- TOC entry 4686 (class 2606 OID 32799)
-- Name: avion avion_nro_serie_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_nro_serie_key UNIQUE (nro_serie);


--
-- TOC entry 4688 (class 2606 OID 32797)
-- Name: avion avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_pkey PRIMARY KEY (id_avion);


--
-- TOC entry 4696 (class 2606 OID 32846)
-- Name: carga carga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga
    ADD CONSTRAINT carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 4704 (class 2606 OID 32910)
-- Name: carga_vuelo carga_vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_vuelo
    ADD CONSTRAINT carga_vuelo_pkey PRIMARY KEY (id_vuelo, id_carga);


--
-- TOC entry 4694 (class 2606 OID 32837)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4698 (class 2606 OID 32865)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 4692 (class 2606 OID 32828)
-- Name: pasajero pasajero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id_pasajero);


--
-- TOC entry 4702 (class 2606 OID 32895)
-- Name: pasajero_vuelo pasajero_vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero_vuelo
    ADD CONSTRAINT pasajero_vuelo_pkey PRIMARY KEY (id_vuelo, id_pasajero);


--
-- TOC entry 4700 (class 2606 OID 32880)
-- Name: vuelo_empleado vuelo_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT vuelo_empleado_pkey PRIMARY KEY (id_vuelo, id_empleado);


--
-- TOC entry 4690 (class 2606 OID 32806)
-- Name: vuelo vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_pkey PRIMARY KEY (id_vuelo);


--
-- TOC entry 4708 (class 2606 OID 32852)
-- Name: carga carga_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga
    ADD CONSTRAINT carga_destino_fkey FOREIGN KEY (destino) REFERENCES public.aeropuerto(id);


--
-- TOC entry 4709 (class 2606 OID 32847)
-- Name: carga carga_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga
    ADD CONSTRAINT carga_origen_fkey FOREIGN KEY (origen) REFERENCES public.aeropuerto(id);


--
-- TOC entry 4716 (class 2606 OID 32916)
-- Name: carga_vuelo carga_vuelo_id_carga_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_vuelo
    ADD CONSTRAINT carga_vuelo_id_carga_fkey FOREIGN KEY (id_carga) REFERENCES public.carga(id_carga);


--
-- TOC entry 4717 (class 2606 OID 32911)
-- Name: carga_vuelo carga_vuelo_id_vuelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_vuelo
    ADD CONSTRAINT carga_vuelo_id_vuelo_fkey FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 4710 (class 2606 OID 32871)
-- Name: factura factura_id_carga_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_carga_fkey FOREIGN KEY (id_carga) REFERENCES public.carga(id_carga);


--
-- TOC entry 4711 (class 2606 OID 32866)
-- Name: factura factura_id_pasajero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id_pasajero);


--
-- TOC entry 4714 (class 2606 OID 32901)
-- Name: pasajero_vuelo pasajero_vuelo_id_pasajero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero_vuelo
    ADD CONSTRAINT pasajero_vuelo_id_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id_pasajero);


--
-- TOC entry 4715 (class 2606 OID 32896)
-- Name: pasajero_vuelo pasajero_vuelo_id_vuelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero_vuelo
    ADD CONSTRAINT pasajero_vuelo_id_vuelo_fkey FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 4705 (class 2606 OID 32812)
-- Name: vuelo vuelo_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_destino_fkey FOREIGN KEY (destino) REFERENCES public.aeropuerto(id);


--
-- TOC entry 4712 (class 2606 OID 32886)
-- Name: vuelo_empleado vuelo_empleado_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT vuelo_empleado_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 4713 (class 2606 OID 32881)
-- Name: vuelo_empleado vuelo_empleado_id_vuelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT vuelo_empleado_id_vuelo_fkey FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 4706 (class 2606 OID 32817)
-- Name: vuelo vuelo_id_avion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_id_avion_fkey FOREIGN KEY (id_avion) REFERENCES public.avion(id_avion);


--
-- TOC entry 4707 (class 2606 OID 32807)
-- Name: vuelo vuelo_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_origen_fkey FOREIGN KEY (origen) REFERENCES public.aeropuerto(id);


-- Completed on 2024-12-01 11:59:48

--
-- PostgreSQL database dump complete
--

