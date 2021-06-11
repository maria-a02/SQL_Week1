-- Borrar tabla "posts" en caso de que exista.
DROP DATABASE posts;

-- Parte 1
-- Crear una base de datos con nombre “posts”.
CREATE DATABASE posts;

-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.
CREATE TABLE post (
    id SERIAL,
    nombre VARCHAR(25),
    fecha_de_creacion DATE,
    contenido VARCHAR(25),
    descripcion VARCHAR(25),
    PRIMARY KEY (id)
);

-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion) 
VALUES (1, 'Pamela', current_date, 'Post 1', 'Descripción 1');

INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion)
VALUES (2, 'Pamela', current_date, 'Post 2', 'Descripción 2');

INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion)
VALUES (3, 'Carlos', current_date, 'Post 3', 'Descripción 3');

-- Modificar la tabla post, agregando la columna título.
ALTER TABLE post
ADD titulo VARCHAR(25);

-- Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'Título 1'
WHERE id = 1;

UPDATE post SET titulo = 'Título 2'
WHERE id = 2;

UPDATE post SET titulo = 'Título 3'
WHERE id = 3;

-- Insertar 2 post para el usuario "Pedro".
INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion)
VALUES (4, 'Pedro', current_date, 'Post 4', 'Descripción 4');

INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion)
VALUES (5, 'Pedro', current_date, 'Post 5', 'Descripción 5');

-- Eliminar el post de Carlos.
DELETE FROM post WHERE nombre = 'Carlos';

-- Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion)
VALUES (6, 'Carlos', current_date, 'Post 6', 'Descripción 6');

-- Parte 2
-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    fecha DATE,
    hora TIME,
    contenido VARCHAR (25),
    PRIMARY KEY(id),
    FOREIGN KEY(post_id) REFERENCES post(id)
);

-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (1, current_date, current_time, 'Comentario Pamela 1');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (2, current_date, current_time, 'Comentario Pamela 2');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (6, current_date, current_time, 'Comentario Carlos 1');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (6, current_date, current_time, 'Comentario Carlos 2');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (6, current_date, current_time, 'Comentario Carlos 3');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (6, current_date, current_time, 'Comentario Carlos 4');


-- Crear un nuevo post para "Margarita".
INSERT INTO post (id, nombre, fecha_de_creacion, contenido, descripcion, titulo)
VALUES (7, 'Margarita', current_date, 'Post 7', 'Descripción 7', 'Título 7');

-- Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (7, current_date, current_time, 'Comentario Margarita 1');
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (7, current_date, current_time, 'Comentario Margarita 2');
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (7, current_date, current_time, 'Comentario Margarita 3');
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (7, current_date, current_time, 'Comentario Margarita 4');
INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES (7, current_date, current_time, 'Comentario Margarita 5');

-- Test
\i script.sql