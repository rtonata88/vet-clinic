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
