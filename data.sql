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


begin;

update animals 
	set species = 'digimon'
where name like '%mon%';

update animals 
	set species = 'pokemon'
where species is null;

commit;

begin;

delete from animals;

rollback;


begin;

delete from animals 
where date_of_birth > '2022-01-01';

SAVEPOINT SP1;

update animals 
    set weight_kg = weight_kg * -1;

rollback to SP1;

update animals 
    set weight_kg = weight_kg * -1
where weight_kg < 0;

commit;


insert into owners (full_name, age)
values 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14)
('Jodie Whittaker', 38);

insert into species('name') values
('Pokemon'),
('Digimon');

begin;
update animals
	set species_id = 2
where name like '%mon%';


update animals
	set species_id = 1
where species_id is null;

commit;

begin;

update animals
	set owner_id = 1
where name = 'Agumon';

update animals
	set owner_id = 2
where name in ('Gabumon', 'Pikachu');

update animals
	set owner_id = 3
where name in ('Devimon', 'Plantmon');

update animals
	set owner_id = 4
where name in ('Charmander', 'Squirtle', 'Blossom');

update animals
	set owner_id = 5
where name in ('Angemon', 'Boarmon');

commit;

begin;

insert into vets (name, age, date_of_graduation)
values 
('William Tatcher', 45, '2000-04-04'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

commit;

begin;

insert into specializations (vet_id, species_id)
values (1, 1),(3, 1), (3, 2), (4, 2);

commit;

begin;

insert into visits (animal_id, vet_id, visit_date)
values 
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(10, 2, '2019-12-21'),
(10, 1, '2020-08-10'),
(10, 2, '2021-04-07'),
(6, 3, '2019-09-29'),
(7, 4, '2020-10-03'),
(7, 4, '2020-11-04'),
(8, 2, '2019-01-24'),
(8, 2, '2019-05-15'),
(8, 2, '2020-02-27'),
(8, 2, '2020-08-03'),
(9, 3, '2020-05-24'),
(9, 1, '2021-01-11');

commit;



