CREATE DATABASE vet_clinic
    WITH 
    OWNER = postgres /*insert the username of your installation here */
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint GENERATED ALWAYS AS IDENTITY,
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


CREATE TABLE IF NOT EXISTS public.owners
(
	id serial PRIMARY KEY,
    full_name character(20) NOT NULL,
    age integer NOT NULL
)

ALTER TABLE IF EXISTS public.owners
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.species
(
	id serial PRIMARY KEY,
    full_name character(20) NOT NULL,
    age integer NOT NULL
)

ALTER TABLE IF EXISTS public.species
    OWNER to postgres;

alter table animals
drop column species;
add column species_id integer NOT NULL,
add column owner_id integer NOT NULL
constraint species_fk REFERENCES species (id),
constraint owner_fk REFERENCES owners (id);