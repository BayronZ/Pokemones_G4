\c mrcoco
DROP DATABASE pokemons;
CREATE DATABASE pokemons;
\c pokemons

CREATE TABLE pokemons(
    pokedex SERIAL,
    nombre VARCHAR(30),
    tipo1 VARCHAR(20),
    tipo2 VARCHAR(20),
    PRIMARY KEY(pokedex)
);

SELECT * FROM pokemons;

\copy pokemons FROM 'pokemonesKanto.csv' csv header;
SELECT * FROM pokemons LIMIT 10;

CREATE TABLE mis_pokemones(
    pokedex INT,
    fecha_captura DATE,
    lugar VARCHAR(30),
    huevo BOOLEAN,
    peso FLOAT,
    estatura FLOAT,
    FOREIGN KEY (pokedex) REFERENCES pokemons(pokedex)
);

SELECT * FROM mis_pokemones;

\copy mis_pokemones FROM 'mis_pokemones.csv' csv header;
SELECT * FROM mis_pokemones LIMIT 5;


--Consulta con alias
SELECT pokedex AS número FROM pokemons WHERE nombre = 'Eevee';

INSERT INTO mis_pokemones(pokedex, fecha_captura, lugar, huevo, peso, estatura)
VALUES (133, '2021-04-12', 'Puente Asalto', false, 15.6, 0.3);
INSERT INTO mis_pokemones(pokedex, fecha_captura, lugar, huevo, peso, estatura)
VALUES (134, '2021-04-12', 'La loma del toro', false, 25.6, 0.8);


SELECT * FROM mis_pokemones ORDER BY fecha_captura DESC LIMIT 3;
SELECT SUM(peso) AS total FROM mis_pokemones;

ALTER TABLE pokemons
ADD rocket BOOLEAN;
SELECT * FROM pokemons LIMIT 1;

INSERT INTO pokemons(pokedex, nombre, tipo1, tipo2, rocket)
VALUES (152,'pichu',  'electrico','' ,false);

SELECT * FROM pokemons ORDER BY pokedex DESC LIMIT 1;

UPDATE pokemons SET rocket = false;

SELECT rocket AS esto_es_rocket FROM pokemons;

--agrupar por tipo1
SELECT tipo1, COUNT(*) FROM pokemons GROUP BY tipo1;

--ejecutar consulta con ORDER BY fat shaming

SELECT * FROM mis_pokemones ORDER BY PESO DESC LIMIT 5;

-- Agregar dos indices a dos columnas
CREATE INDEX index_pokedex_pokemons ON pokemons(pokedex);
SELECT * FROM pg_indexes WHERE tablename = 'pokemons';
--Eliminar indice de la columna
DROP INDEX index_pokedex_pokemons;
SELECT * FROM pg_indexes WHERE tablename = 'pokemons';