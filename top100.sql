-- Cambiarse a usuario default
\c postgres

-- Crear base de datos llamada peliculas.
DROP DATABASE peliculas;
CREATE DATABASE peliculas;

-- Cambiarse a la base de datos
\c peliculas

-- Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas (
    id INT,
    pelicula VARCHAR(100),
    año_estreno INT,
    director VARCHAR(25),
    PRIMARY KEY(id)
);

CREATE TABLE reparto (
    id_pelicula INT,
    actor VARCHAR(50),
    FOREIGN KEY(id_pelicula) REFERENCES peliculas(id)
);

\copy peliculas FROM 'peliculas.csv' csv header;

\copy reparto FROM 'reparto.csv' csv header;

-- Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor FROM reparto WHERE id_pelicula = 2;

-- Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT (*) FROM reparto WHERE actor = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT año_estreno, pelicula FROM peliculas 
WHERE año_estreno BETWEEN 1990 AND 1999 
ORDER BY pelicula ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT LENGTH (pelicula) AS longitud_titulo, pelicula
FROM peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(pelicula)) FROM peliculas;