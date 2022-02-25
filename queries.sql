-- Ends with mon
select * from animals where name like '%mon';

--Born between 2016 and 2019
select * from animals where EXTRACT(year FROM date_of_birth) between 2016 and 2019;

-- animals that are neutered and have less than 3 escape attempts.
select * from animals where neutered = true and escape_attempts < 3;

--List date of birth of all animals named either "Agumon" or "Pikachu"
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

--List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_kg > 10.5

--Find all animals that are neutered
select * from animals where neutered = true;

--Find all animals not named Gabumon
select * from animals where name not like '%Gabumon%';

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;


-- How many animals are there?
select count(*) as animal_count from animals;

-- How many animals have never tried to escape?
select count(*) as animal_count 
from animals
where escape_attempts = 0;

-- What is the average weight of animals?
select avg(weight_kg)
from animals;

-- Who escapes the most, neutered or not neutered animals?
select * from animals
where escape_attempts = (select max(escape_attempts) from animals);

-- What is the minimum and maximum weight of each type of animal?
select species, max(escape_attempts), min(escape_attempts) from animals group by species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals 
where EXTRACT(year FROM date_of_birth) between 1990 and 2000
group by species;




-- What animals belong to Melody Pond?
select name, weight_kg, neutered, escape_attempts from animals
inner join owners on owners.id = animals.owner_id
where owners.full_name = 'Melody Pond';


-- List of all animals that are pokemon (their type is Pokemon).
select animals.name, weight_kg, neutered, escape_attempts from animals
inner join species on species.id = animals.species_id
where species.name = 'Pokemon';


-- List all owners and their animals, remember to include those that don't own any animal.
select owners.full_name, animals.name, weight_kg, neutered, escape_attempts from animals
right join owners on owners.id = animals.owner_id;

-- How many animals are there per species?
select species.name, count(animals.id) animals_count
from animals
inner join species on species.id = animals.species_id
group by species.name;


-- List all Digimon owned by Jennifer Orwell.
select species.name, owners.full_name, animals.*
from animals
inner join species on species.id = animals.species_id
inner join owners on owners.id = animals.owner_id
where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';


-- List all animals owned by Dean Winchester that haven't tried to escape.
select owners.full_name, animals.*
from animals
inner join owners on owners.id = animals.owner_id
where owners.full_name = 'Dean Winchester' and escape_attempts = 0;


-- Who owns the most animals?
select owners.full_name, count(animals.*) animal_count
from animals
inner join owners on owners.id = animals.owner_id
group by owners.id
order by animal_count desc
limit 1;
