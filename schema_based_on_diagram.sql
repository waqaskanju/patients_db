
/* Create Patients Table */
CREATE TABLE public.patients
(
    id serial NOT NULL,
    name character varying(30) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.patients
    OWNER to postgres;

/* Create Invoices Table */
CREATE TABLE public.invoices
(
    id serial NOT NULL,
    total_amount numeric NOT NULL,
    generated_at timestamp  NOT NULL,
    payed_at timestamp,  
    medical_history_id int REFERENCES medical_histories (id),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.invoices
    OWNER to postgres;

/* Create Medical Histories Table */
CREATE TABLE public.medical_histories
(
    id serial NOT NULL,
    admitted_at timestamp  NOT NULL,
    patient_id   int REFERENCES patients (id),
    status character varying(10) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.medical_histories
    OWNER to postgres;

/* Create Treatments Table */
CREATE TABLE public.treatments
(
    id serial NOT NULL,
    type character varying(30) NOT NULL,
    name  character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.treatments
    OWNER to postgres;

/* Create Invoices_items table */
CREATE TABLE public.invoice_items
(
    id serial NOT NULL,
    unit_price numeric NOT NULL,
    quantity int NOT NULL,
    total_price numeric NOT NULL
    invoice_id int REFERENCES invoices (id)
    treatment_id int REFERENCES treatments (id)
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.invoice_items
    OWNER to postgres;

/* Create a join table called history_treatments */
CREATE TABLE public.history_treatments
(
    id serial NOT NULL,
    medical_history_id int REFERENCES medical_histories (id),
    treatment_id int REFERENCES treatments (id),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.history_treatments
    OWNER to postgres;
