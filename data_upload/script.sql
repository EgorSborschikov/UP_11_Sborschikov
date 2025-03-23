--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

-- Started on 2025-03-23 16:42:12 +07

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
-- TOC entry 247 (class 1255 OID 27994)
-- Name: add_new_client(character varying, character varying, character varying, date); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_new_client(IN p_surname character varying, IN p_name character varying, IN p_lastname character varying, IN p_birthdate date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.clients (surname, name, lastname, birthdate)
    VALUES (p_surname, p_name, p_lastname, p_birthdate);
END;
$$;


ALTER PROCEDURE public.add_new_client(IN p_surname character varying, IN p_name character varying, IN p_lastname character varying, IN p_birthdate date) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 27995)
-- Name: get_all_pharmacy_products(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.get_all_pharmacy_products()
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM public.pharmacy_products;
END;
$$;


ALTER PROCEDURE public.get_all_pharmacy_products() OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 27997)
-- Name: get_client_orders(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.get_client_orders(IN p_client_id integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    order_record RECORD;
BEGIN
    -- Создаем временную таблицу для хранения результатов
    CREATE TEMP TABLE temp_orders (
        order_id INTEGER,
        order_date TIMESTAMP,
        total_price MONEY
    ) ON COMMIT DROP;

    -- Вставляем данные в временную таблицу
    INSERT INTO temp_orders (order_id, order_date, total_price)
    SELECT id, date, total_price
    FROM public.orders
    WHERE client_id = p_client_id;

    -- Возвращаем данные из временной таблицы
    FOR order_record IN SELECT * FROM temp_orders LOOP
        RAISE NOTICE 'Order ID: %, Date: %, Total Price: %',
            order_record.order_id, order_record.order_date, order_record.total_price;
    END LOOP;
END;
$$;


ALTER PROCEDURE public.get_client_orders(IN p_client_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 246 (class 1259 OID 27936)
-- Name: animal_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animal_type (
    "IDAnimalType" integer NOT NULL,
    "Type" character varying(30) NOT NULL
);


ALTER TABLE public.animal_type OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 27935)
-- Name: animal_type_IDAnimalType_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."animal_type_IDAnimalType_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."animal_type_IDAnimalType_seq" OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 245
-- Name: animal_type_IDAnimalType_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."animal_type_IDAnimalType_seq" OWNED BY public.animal_type."IDAnimalType";


--
-- TOC entry 222 (class 1259 OID 27799)
-- Name: auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth (
    "IDAuth" integer NOT NULL,
    "Login" character varying(100) NOT NULL,
    "Password" character varying(100) NOT NULL
);


ALTER TABLE public.auth OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 27798)
-- Name: auth_IDAuth_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."auth_IDAuth_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."auth_IDAuth_seq" OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_IDAuth_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."auth_IDAuth_seq" OWNED BY public.auth."IDAuth";


--
-- TOC entry 216 (class 1259 OID 27778)
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    "IDBranch" integer NOT NULL,
    "IDCity" integer NOT NULL,
    "BranchName" character varying(50) NOT NULL,
    "Address" character varying(50) NOT NULL
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 27777)
-- Name: branches_IDBrabch_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."branches_IDBrabch_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."branches_IDBrabch_seq" OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 215
-- Name: branches_IDBrabch_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."branches_IDBrabch_seq" OWNED BY public.branches."IDBranch";


--
-- TOC entry 238 (class 1259 OID 27857)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    "IDCity" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 27856)
-- Name: cities_IDCity_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."cities_IDCity_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."cities_IDCity_seq" OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 237
-- Name: cities_IDCity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."cities_IDCity_seq" OWNED BY public.cities."IDCity";


--
-- TOC entry 232 (class 1259 OID 27836)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    "IDClient" integer NOT NULL,
    "Surname" character varying(30) NOT NULL,
    "Name" character varying(35) NOT NULL,
    "Lastname" character varying(40) NOT NULL,
    "Email" character varying(100) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 27835)
-- Name: clinets_IDClient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."clinets_IDClient_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."clinets_IDClient_seq" OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 231
-- Name: clinets_IDClient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."clinets_IDClient_seq" OWNED BY public.clients."IDClient";


--
-- TOC entry 226 (class 1259 OID 27815)
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    "IDCoupon" integer NOT NULL,
    "IDClients" integer NOT NULL,
    "IDEmployee" integer NOT NULL
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 27814)
-- Name: coupons_IDCoupon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."coupons_IDCoupon_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."coupons_IDCoupon_seq" OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 225
-- Name: coupons_IDCoupon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."coupons_IDCoupon_seq" OWNED BY public.coupons."IDCoupon";


--
-- TOC entry 220 (class 1259 OID 27792)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    "IDEmployee" integer NOT NULL,
    "IDBranch" integer NOT NULL,
    "IDPosition" integer NOT NULL,
    "IDAuth" integer NOT NULL,
    "Surname" character varying(25) NOT NULL,
    "Name" character varying(30) NOT NULL,
    "LastName" character varying(35) NOT NULL,
    "PassportData" character varying(20) NOT NULL,
    "PhoneNumber" character varying(20) NOT NULL,
    "Email" character varying(100) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27791)
-- Name: employees_IDEmployee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."employees_IDEmployee_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."employees_IDEmployee_seq" OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 219
-- Name: employees_IDEmployee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."employees_IDEmployee_seq" OWNED BY public.employees."IDEmployee";


--
-- TOC entry 234 (class 1259 OID 27843)
-- Name: online_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.online_orders (
    "IDOnlineOrder" integer NOT NULL,
    "IDClient" integer NOT NULL,
    "IDPharmacyProduct" integer NOT NULL,
    "IDPickupPoint" integer NOT NULL
);


ALTER TABLE public.online_orders OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 27842)
-- Name: online_orders_IDOnlineOrder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."online_orders_IDOnlineOrder_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."online_orders_IDOnlineOrder_seq" OWNER TO postgres;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 233
-- Name: online_orders_IDOnlineOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."online_orders_IDOnlineOrder_seq" OWNED BY public.online_orders."IDOnlineOrder";


--
-- TOC entry 224 (class 1259 OID 27806)
-- Name: patient_by_coupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_by_coupon (
    "IDReception" integer NOT NULL,
    "IDCoupon" integer NOT NULL,
    "IDAnimalType" integer NOT NULL,
    "IDPharmacyProduct" integer NOT NULL,
    "RegularInspection" boolean NOT NULL,
    "Complaints" character varying(255) NOT NULL,
    "Conclusions" character varying(500),
    "Custody" character varying(500) NOT NULL
);


ALTER TABLE public.patient_by_coupon OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 27805)
-- Name: patient_by_coupon_IDReception_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."patient_by_coupon_IDReception_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."patient_by_coupon_IDReception_seq" OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 223
-- Name: patient_by_coupon_IDReception_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."patient_by_coupon_IDReception_seq" OWNED BY public.patient_by_coupon."IDReception";


--
-- TOC entry 242 (class 1259 OID 27871)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    "IDPayment" integer NOT NULL,
    "IDReception" integer NOT NULL,
    "IDPaymentMethod" integer NOT NULL,
    "Price" money NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 27870)
-- Name: payments_IDPayment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."payments_IDPayment_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."payments_IDPayment_seq" OWNER TO postgres;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 241
-- Name: payments_IDPayment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."payments_IDPayment_seq" OWNED BY public.payments."IDPayment";


--
-- TOC entry 244 (class 1259 OID 27878)
-- Name: payments_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments_methods (
    "IDPaymentMethod" integer NOT NULL,
    "Method" character(50) NOT NULL
);


ALTER TABLE public.payments_methods OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 27877)
-- Name: payments_methods_IDPaymentMethod_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."payments_methods_IDPaymentMethod_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."payments_methods_IDPaymentMethod_seq" OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 243
-- Name: payments_methods_IDPaymentMethod_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."payments_methods_IDPaymentMethod_seq" OWNED BY public.payments_methods."IDPaymentMethod";


--
-- TOC entry 230 (class 1259 OID 27829)
-- Name: pharmacy_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacy_products (
    "IDPharmacyProduct" integer NOT NULL,
    "ProductName" character(50) NOT NULL,
    "Price" money NOT NULL
);


ALTER TABLE public.pharmacy_products OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27828)
-- Name: pharmacy_products_IDPharmacyProduct_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."pharmacy_products_IDPharmacyProduct_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."pharmacy_products_IDPharmacyProduct_seq" OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 229
-- Name: pharmacy_products_IDPharmacyProduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."pharmacy_products_IDPharmacyProduct_seq" OWNED BY public.pharmacy_products."IDPharmacyProduct";


--
-- TOC entry 236 (class 1259 OID 27850)
-- Name: pickup_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_points (
    "IDPickupPoints" integer NOT NULL,
    "IDCity" integer NOT NULL
);


ALTER TABLE public.pickup_points OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 27849)
-- Name: pickup_points_IDPickupPoints_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."pickup_points_IDPickupPoints_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."pickup_points_IDPickupPoints_seq" OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 235
-- Name: pickup_points_IDPickupPoints_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."pickup_points_IDPickupPoints_seq" OWNED BY public.pickup_points."IDPickupPoints";


--
-- TOC entry 218 (class 1259 OID 27785)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    "IDPosition" integer NOT NULL,
    "PositionName" character varying(50) NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 27784)
-- Name: positions_IDPosition_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."positions_IDPosition_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."positions_IDPosition_seq" OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: positions_IDPosition_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."positions_IDPosition_seq" OWNED BY public.positions."IDPosition";


--
-- TOC entry 240 (class 1259 OID 27864)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    "IDSalaries" integer NOT NULL,
    "IDEmployee" integer NOT NULL,
    "Salaries" money NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 27863)
-- Name: salaries_IDSalaries_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."salaries_IDSalaries_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."salaries_IDSalaries_seq" OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 239
-- Name: salaries_IDSalaries_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."salaries_IDSalaries_seq" OWNED BY public.salaries."IDSalaries";


--
-- TOC entry 228 (class 1259 OID 27822)
-- Name: sale_of_pharmacy_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_of_pharmacy_products (
    "IDSale" integer NOT NULL,
    "IDEmployee" integer NOT NULL,
    "IDClient" integer NOT NULL,
    "IDPharmacyProduct" integer NOT NULL
);


ALTER TABLE public.sale_of_pharmacy_products OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27821)
-- Name: sale_of_pharmacy_products_IDSale_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sale_of_pharmacy_products_IDSale_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."sale_of_pharmacy_products_IDSale_seq" OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 227
-- Name: sale_of_pharmacy_products_IDSale_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sale_of_pharmacy_products_IDSale_seq" OWNED BY public.sale_of_pharmacy_products."IDSale";


--
-- TOC entry 3314 (class 2604 OID 27939)
-- Name: animal_type IDAnimalType; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal_type ALTER COLUMN "IDAnimalType" SET DEFAULT nextval('public."animal_type_IDAnimalType_seq"'::regclass);


--
-- TOC entry 3302 (class 2604 OID 27802)
-- Name: auth IDAuth; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth ALTER COLUMN "IDAuth" SET DEFAULT nextval('public."auth_IDAuth_seq"'::regclass);


--
-- TOC entry 3300 (class 2604 OID 27781)
-- Name: branches IDBranch; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN "IDBranch" SET DEFAULT nextval('public."branches_IDBrabch_seq"'::regclass);


--
-- TOC entry 3310 (class 2604 OID 27860)
-- Name: cities IDCity; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN "IDCity" SET DEFAULT nextval('public."cities_IDCity_seq"'::regclass);


--
-- TOC entry 3307 (class 2604 OID 27839)
-- Name: clients IDClient; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN "IDClient" SET DEFAULT nextval('public."clinets_IDClient_seq"'::regclass);


--
-- TOC entry 3304 (class 2604 OID 27818)
-- Name: coupons IDCoupon; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN "IDCoupon" SET DEFAULT nextval('public."coupons_IDCoupon_seq"'::regclass);


--
-- TOC entry 3308 (class 2604 OID 27846)
-- Name: online_orders IDOnlineOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_orders ALTER COLUMN "IDOnlineOrder" SET DEFAULT nextval('public."online_orders_IDOnlineOrder_seq"'::regclass);


--
-- TOC entry 3303 (class 2604 OID 27809)
-- Name: patient_by_coupon IDReception; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_by_coupon ALTER COLUMN "IDReception" SET DEFAULT nextval('public."patient_by_coupon_IDReception_seq"'::regclass);


--
-- TOC entry 3312 (class 2604 OID 27874)
-- Name: payments IDPayment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN "IDPayment" SET DEFAULT nextval('public."payments_IDPayment_seq"'::regclass);


--
-- TOC entry 3313 (class 2604 OID 27881)
-- Name: payments_methods IDPaymentMethod; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_methods ALTER COLUMN "IDPaymentMethod" SET DEFAULT nextval('public."payments_methods_IDPaymentMethod_seq"'::regclass);


--
-- TOC entry 3306 (class 2604 OID 27832)
-- Name: pharmacy_products IDPharmacyProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacy_products ALTER COLUMN "IDPharmacyProduct" SET DEFAULT nextval('public."pharmacy_products_IDPharmacyProduct_seq"'::regclass);


--
-- TOC entry 3309 (class 2604 OID 27853)
-- Name: pickup_points IDPickupPoints; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points ALTER COLUMN "IDPickupPoints" SET DEFAULT nextval('public."pickup_points_IDPickupPoints_seq"'::regclass);


--
-- TOC entry 3301 (class 2604 OID 27788)
-- Name: positions IDPosition; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN "IDPosition" SET DEFAULT nextval('public."positions_IDPosition_seq"'::regclass);


--
-- TOC entry 3311 (class 2604 OID 27867)
-- Name: salaries IDSalaries; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries ALTER COLUMN "IDSalaries" SET DEFAULT nextval('public."salaries_IDSalaries_seq"'::regclass);


--
-- TOC entry 3305 (class 2604 OID 27825)
-- Name: sale_of_pharmacy_products IDSale; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_of_pharmacy_products ALTER COLUMN "IDSale" SET DEFAULT nextval('public."sale_of_pharmacy_products_IDSale_seq"'::regclass);


--
-- TOC entry 3346 (class 2606 OID 27941)
-- Name: animal_type animal_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal_type
    ADD CONSTRAINT animal_type_pkey PRIMARY KEY ("IDAnimalType");


--
-- TOC entry 3322 (class 2606 OID 27804)
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY ("IDAuth");


--
-- TOC entry 3316 (class 2606 OID 27783)
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY ("IDBranch");


--
-- TOC entry 3338 (class 2606 OID 27862)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY ("IDCity");


--
-- TOC entry 3332 (class 2606 OID 27841)
-- Name: clients clinets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clinets_pkey PRIMARY KEY ("IDClient");


--
-- TOC entry 3326 (class 2606 OID 27820)
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY ("IDCoupon");


--
-- TOC entry 3320 (class 2606 OID 27797)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY ("IDEmployee");


--
-- TOC entry 3334 (class 2606 OID 27848)
-- Name: online_orders online_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_orders
    ADD CONSTRAINT online_orders_pkey PRIMARY KEY ("IDOnlineOrder");


--
-- TOC entry 3324 (class 2606 OID 27813)
-- Name: patient_by_coupon patient_by_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_by_coupon
    ADD CONSTRAINT patient_by_coupon_pkey PRIMARY KEY ("IDReception");


--
-- TOC entry 3344 (class 2606 OID 27883)
-- Name: payments_methods payments_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_methods
    ADD CONSTRAINT payments_methods_pkey PRIMARY KEY ("IDPaymentMethod");


--
-- TOC entry 3342 (class 2606 OID 27876)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY ("IDPayment");


--
-- TOC entry 3330 (class 2606 OID 27834)
-- Name: pharmacy_products pharmacy_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacy_products
    ADD CONSTRAINT pharmacy_products_pkey PRIMARY KEY ("IDPharmacyProduct");


--
-- TOC entry 3336 (class 2606 OID 27855)
-- Name: pickup_points pickup_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT pickup_points_pkey PRIMARY KEY ("IDPickupPoints");


--
-- TOC entry 3318 (class 2606 OID 27790)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY ("IDPosition");


--
-- TOC entry 3340 (class 2606 OID 27869)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY ("IDSalaries");


--
-- TOC entry 3328 (class 2606 OID 27827)
-- Name: sale_of_pharmacy_products sale_of_pharmacy_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_of_pharmacy_products
    ADD CONSTRAINT sale_of_pharmacy_products_pkey PRIMARY KEY ("IDSale");


--
-- TOC entry 3347 (class 2606 OID 27885)
-- Name: branches branches_IDCity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "branches_IDCity_fkey" FOREIGN KEY ("IDCity") REFERENCES public.cities("IDCity") NOT VALID;


--
-- TOC entry 3354 (class 2606 OID 27905)
-- Name: coupons coupons_IDClients_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT "coupons_IDClients_fkey" FOREIGN KEY ("IDClients") REFERENCES public.clients("IDClient") NOT VALID;


--
-- TOC entry 3355 (class 2606 OID 27910)
-- Name: coupons coupons_IDEmployee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT "coupons_IDEmployee_fkey" FOREIGN KEY ("IDEmployee") REFERENCES public.employees("IDEmployee") NOT VALID;


--
-- TOC entry 3348 (class 2606 OID 27900)
-- Name: employees employees_IDAuth_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_IDAuth_fkey" FOREIGN KEY ("IDAuth") REFERENCES public.auth("IDAuth") NOT VALID;


--
-- TOC entry 3349 (class 2606 OID 27890)
-- Name: employees employees_IDBranch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_IDBranch_fkey" FOREIGN KEY ("IDBranch") REFERENCES public.branches("IDBranch") NOT VALID;


--
-- TOC entry 3350 (class 2606 OID 27895)
-- Name: employees employees_IDPosition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_IDPosition_fkey" FOREIGN KEY ("IDPosition") REFERENCES public.positions("IDPosition") NOT VALID;


--
-- TOC entry 3359 (class 2606 OID 27915)
-- Name: online_orders online_orders_IDClient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_orders
    ADD CONSTRAINT "online_orders_IDClient_fkey" FOREIGN KEY ("IDClient") REFERENCES public.clients("IDClient") NOT VALID;


--
-- TOC entry 3360 (class 2606 OID 27925)
-- Name: online_orders online_orders_IDPharmacyProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_orders
    ADD CONSTRAINT "online_orders_IDPharmacyProduct_fkey" FOREIGN KEY ("IDPharmacyProduct") REFERENCES public.pharmacy_products("IDPharmacyProduct") NOT VALID;


--
-- TOC entry 3361 (class 2606 OID 27930)
-- Name: online_orders online_orders_IDPickupPoint_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_orders
    ADD CONSTRAINT "online_orders_IDPickupPoint_fkey" FOREIGN KEY ("IDPickupPoint") REFERENCES public.pickup_points("IDPickupPoints") NOT VALID;


--
-- TOC entry 3351 (class 2606 OID 27947)
-- Name: patient_by_coupon patient_by_coupon_IDAnimalType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_by_coupon
    ADD CONSTRAINT "patient_by_coupon_IDAnimalType_fkey" FOREIGN KEY ("IDAnimalType") REFERENCES public.animal_type("IDAnimalType") NOT VALID;


--
-- TOC entry 3352 (class 2606 OID 27942)
-- Name: patient_by_coupon patient_by_coupon_IDCoupon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_by_coupon
    ADD CONSTRAINT "patient_by_coupon_IDCoupon_fkey" FOREIGN KEY ("IDCoupon") REFERENCES public.coupons("IDCoupon") NOT VALID;


--
-- TOC entry 3353 (class 2606 OID 27952)
-- Name: patient_by_coupon patient_by_coupon_IDPharmacyProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_by_coupon
    ADD CONSTRAINT "patient_by_coupon_IDPharmacyProduct_fkey" FOREIGN KEY ("IDPharmacyProduct") REFERENCES public.pharmacy_products("IDPharmacyProduct") NOT VALID;


--
-- TOC entry 3364 (class 2606 OID 27962)
-- Name: payments payments_IDPaymentMethod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "payments_IDPaymentMethod_fkey" FOREIGN KEY ("IDPaymentMethod") REFERENCES public.payments_methods("IDPaymentMethod") NOT VALID;


--
-- TOC entry 3365 (class 2606 OID 27957)
-- Name: payments payments_IDReception_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "payments_IDReception_fkey" FOREIGN KEY ("IDReception") REFERENCES public.patient_by_coupon("IDReception") NOT VALID;


--
-- TOC entry 3362 (class 2606 OID 27967)
-- Name: pickup_points pickup_points_IDCity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT "pickup_points_IDCity_fkey" FOREIGN KEY ("IDCity") REFERENCES public.cities("IDCity") NOT VALID;


--
-- TOC entry 3363 (class 2606 OID 27972)
-- Name: salaries salaries_IDEmployee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT "salaries_IDEmployee_fkey" FOREIGN KEY ("IDEmployee") REFERENCES public.employees("IDEmployee") NOT VALID;


--
-- TOC entry 3356 (class 2606 OID 27982)
-- Name: sale_of_pharmacy_products sale_of_pharmacy_products_IDClient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_of_pharmacy_products
    ADD CONSTRAINT "sale_of_pharmacy_products_IDClient_fkey" FOREIGN KEY ("IDClient") REFERENCES public.clients("IDClient") NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 27977)
-- Name: sale_of_pharmacy_products sale_of_pharmacy_products_IDEmployee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_of_pharmacy_products
    ADD CONSTRAINT "sale_of_pharmacy_products_IDEmployee_fkey" FOREIGN KEY ("IDEmployee") REFERENCES public.employees("IDEmployee") NOT VALID;


--
-- TOC entry 3358 (class 2606 OID 27987)
-- Name: sale_of_pharmacy_products sale_of_pharmacy_products_IDPharmacyProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_of_pharmacy_products
    ADD CONSTRAINT "sale_of_pharmacy_products_IDPharmacyProduct_fkey" FOREIGN KEY ("IDPharmacyProduct") REFERENCES public.pharmacy_products("IDPharmacyProduct") NOT VALID;


-- Completed on 2025-03-23 16:42:12 +07

--
-- PostgreSQL database dump complete
--

