CREATE DATABASE db_university;

USE db_university;

CREATE TABLE students (
  id INT NOT NULL AUTO_INCREMENT,
  name TEXT,
  age INT,
  major TEXT,
  PRIMARY KEY(id)
);

## Ejercicio 2: Inserciones de Datos
## Inserta al menos 3 registros en la tabla "students" con información relevante. Asegúrate de incluir casos donde dos estudiantes tienen la misma carrera.

INSERT INTO students (name, age, major) VALUES
('Juan Perez', 22, 'Informática'),
('Maria Rodriguez', 20, 'Biología'),
('Carlos Martinez', 23, 'Química'),
('Ana Garcia', 21, 'Informática'),
('Luisa Torres', 22, 'Biología');


## Ejercicio 3: Consultas Básicas
## Realiza las siguientes consultas SQL:

## Muestra todos los estudiantes de la tabla.
SELECT name FROM students;

## Filtra los estudiantes que tienen menos de 20 años.
SELECT name, age FROM students WHERE age < 20;


## Obtén los estudiantes que estudian la carrera de "Computer Science".
SELECT name, major FROM students WHERE major = 'Computer Science';

## Ejercicio 4: Modificación de Datos
#  Actualiza la información de uno de los estudiantes. Cambia su carrera o edad y luego muestra la tabla para confirmar los cambios.

UPDATE students SET major = 'Computer Science' WHERE id=3;
UPDATE students SET age = 18 WHERE id=3;

SELECT * FROM students;

## ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

## Ejercicio 5: Consultas Relacionadas


CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name TEXT,
  student_id INT,
  FOREIGN KEY (student_id) REFERENCES students(id)
);



INSERT INTO courses (course_id, course_name, student_id) VALUES
(1, 'Introducción a la Informática', 1),
(2, 'Biología Avanzada', 2),
(3, 'Química Orgánica', 1),
(4, 'Programación Avanzada', 3), 
(5, 'Ecología', 2);


SELECT students.name, students.major, courses.course_name FROM students JOIN courses ON students.id = courses.student_id;

## Ejercicio 6: Eliminación de Datos
## Elimina uno de los estudiantes de la tabla "students". Luego, muestra la tabla para confirmar que el estudiante ha sido eliminado.

DELETE FROM students WHERE id=5

## Ejercicio 7: Agregación de Datos
## Crea una nueva tabla llamada "grades" con las siguientes columnas:

CREATE TABLE grades (
  id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  grade FLOAT,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO grades (id, student_id, course_id, grade) VALUES
(1, 1, 1, 85.5),  -- Juan Perez, Introducción a la Informática
(2, 2, 2, 90.0),  -- Maria Rodriguez, Biología Avanzada
(3, 3, 3, 78.5),  -- Carlos Martinez, Química Orgánica
(4, 1, 4, 92.0),  -- Juan Perez, Programación Avanzada
(5, 2, 5, 88.5);  -- Maria Rodriguez, Ecología

## Ejercicio 8: Consultas con Join
## Realiza una consulta que muestre el nombre del estudiante, el curso que está tomando y su calificación correspondiente. 
## Utiliza las tablas "students", "courses" y "grades" y realiza las uniones necesarias.

SELECT students.name, courses.course_name, grades.grade FROM students
JOIN courses ON students.id = courses.student_id
JOIN grades ON students.id = grades.student_id AND courses.course_id = grades.course_id;









