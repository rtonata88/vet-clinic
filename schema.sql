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
    name character(20) NOT NULL
);

ALTER TABLE IF EXISTS public.species
    OWNER to postgres;

alter table animals
drop column species,
add column species_id integer,
add column owner_id integer;

alter table animals
add constraint species_fk FOREIGN KEY (species_id) REFERENCES species (id),
add constraint owner_fk FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE IF NOT EXISTS public.vets
(
	id serial PRIMARY KEY,
    name character(20) NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL
);

ALTER TABLE IF EXISTS public.vets
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.specializations
(
    vet_id integer NOT NULL,
    species_id integer NOT NULL
);


ALTER TABLE IF EXISTS public.specializations
    OWNER to postgres;

alter table specializations
add constraint specializations_species_fk FOREIGN KEY (species_id) REFERENCES species (id),
add constraint specializations_vet_fk FOREIGN KEY (vet_id) REFERENCES vets (id);

CREATE TABLE IF NOT EXISTS public.visits
(
    vet_id integer NOT NULL,
    animal_id integer NOT NULL,
    visit_date date NOT NULL
);


ALTER TABLE IF EXISTS public.visits
    OWNER to postgres;

alter table visits
add constraint visits_animal_fk FOREIGN KEY (animal_id) REFERENCES animals (id),
add constraint vet_fk FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);