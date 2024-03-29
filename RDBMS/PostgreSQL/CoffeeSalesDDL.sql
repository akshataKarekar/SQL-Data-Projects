-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."Staff"
(
    staff_id integer NOT NULL,
    staff_first_name "char" NOT NULL,
    staff_last_name "char" NOT NULL,
    position_id "char" NOT NULL,
    start_date date NOT NULL,
    location_id integer NOT NULL,
    PRIMARY KEY (staff_id)
);

CREATE TABLE public."Position"
(
    position_id integer NOT NULL,
    position_name "char" NOT NULL,
    PRIMARY KEY (position_id)
);

CREATE TABLE public."Location"
(
    location_id integer NOT NULL,
    location_name "char" NOT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE public."Customer"
(
    customer_id integer NOT NULL,
    customer_name "char" NOT NULL,
    customer_email "char" NOT NULL,
    customer_since character varying NOT NULL,
    customer_card_no character varying NOT NULL,
    "customer_DOB" date NOT NULL,
    customer_gender character varying NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE public."Product"
(
    product_id "char" NOT NULL,
    product_name "char" NOT NULL,
    type_id integer NOT NULL,
    category_id integer NOT NULL,
    product_desc character varying NOT NULL,
    product_price integer NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE public."Category"
(
    category_id integer NOT NULL,
    category_name "char" NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE public."ProductType"
(
    type_id integer NOT NULL,
    type_name "char" NOT NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE public."SalesTransaction"
(
    trans_id integer NOT NULL,
    date date NOT NULL,
    "time" date NOT NULL,
    outlet_id integer NOT NULL,
    staff_id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    "Total_price" integer NOT NULL,
    PRIMARY KEY (trans_id)
);

CREATE TABLE public."OutletType"
(
    outlet_type_id integer NOT NULL,
    outlet_type_name "char" NOT NULL,
    PRIMARY KEY (outlet_type_id)
);

CREATE TABLE public."SalesOutlet"
(
    outlet_id integer NOT NULL,
    outlet_address "char" NOT NULL,
    outlet_city "char" NOT NULL,
    outlet_telephone "char" NOT NULL,
    outlet_postal "char" NOT NULL,
    staff_id "char" NOT NULL,
    outlet_type_id integer NOT NULL,
    PRIMARY KEY (outlet_id)
);

ALTER TABLE public."Staff"
    ADD FOREIGN KEY (position_id)
    REFERENCES public."Position" (position_id)
    NOT VALID;


ALTER TABLE public."Staff"
    ADD FOREIGN KEY (location_id)
    REFERENCES public."Location" (location_id)
    NOT VALID;


ALTER TABLE public."Product"
    ADD FOREIGN KEY (type_id)
    REFERENCES public."ProductType" (type_id)
    NOT VALID;


ALTER TABLE public."Product"
    ADD FOREIGN KEY (category_id)
    REFERENCES public."Category" (category_id)
    NOT VALID;


ALTER TABLE public."SalesOutlet"
    ADD FOREIGN KEY (outlet_type_id)
    REFERENCES public."OutletType" (outlet_type_id)
    NOT VALID;


ALTER TABLE public."SalesTransaction"
    ADD FOREIGN KEY (outlet_id)
    REFERENCES public."SalesOutlet" (outlet_id)
    NOT VALID;


ALTER TABLE public."SalesTransaction"
    ADD FOREIGN KEY (staff_id)
    REFERENCES public."Staff" (staff_id)
    NOT VALID;


ALTER TABLE public."SalesTransaction"
    ADD FOREIGN KEY (customer_id)
    REFERENCES public."Customer" (customer_id)
    NOT VALID;


ALTER TABLE public."SalesTransaction"
    ADD FOREIGN KEY (product_id)
    REFERENCES public."Product" (product_id)
    NOT VALID;

END;
