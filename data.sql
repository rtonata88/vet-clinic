INSERT INTO public.animals (date_of_birth, name, weight_kg, neutered, escape_attempts) 
VALUES ('2020-02-03', 'Agumon', '10.23', false, '0');

INSERT INTO public.animals (date_of_birth, escape_attempts, neutered, weight_kg, name) 
VALUES ('2018-11-15', '2', true, '8.00', 'Gabumon');

INSERT INTO public.animals (date_of_birth, weight_kg, escape_attempts, neutered, name) 
VALUES ('2021-01-07', '15.04', '1', false, 'Pikachu');

INSERT INTO public.animals (name, weight_kg, neutered, date_of_birth, escape_attempts) 
VALUES ('Devimon', '11', true, '2017-05-12', '5');

insert into animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
values 
	('Charmander', '2020-02-08', 11, false, 0),
	('Squirtle', '2022-11-15', 5.7, true, 2),
	('Angemon', '1993-04-02', 12.13, false, 1),
	('Boarmon', '2005-06-07', 20.4, true, 7),
	('Blossom', '1998-10-13', 17, true, 3);


-- begin;

-- update animals 
-- 	set species = 'unspecified';

-- rollback;
-- end;

begin;

update animals 
	set species = 'digimon'
where name like '%mon%';

update animals 
	set species = 'pokemon'
where species is null;

commit;

delete from animals;

rollback;

end;


begin;

delete from animals 
where date_of_birth > '2022-01-01';

SAVEPOINT SP1;

update animals 
    set weight = weight * -1;

rollback to SP1;

update animals 
    set weight = weight * -1
where weight < 0;

commit;
