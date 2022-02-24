CREATE DATABASE vet_clinic
    WITH 
    OWNER = postgres /*insert the username of your installation here */
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint NOT NULL DEFAULT nextval('animals2_id_seq'::regclass),
    name character(20) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric(4,2) NOT NULL,
    CONSTRAINT animals2_pkey PRIMARY KEY (id)
)

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

alter table animals
add species character(20);