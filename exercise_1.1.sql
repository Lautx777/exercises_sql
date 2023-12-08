CREATE DATABASE db_university2;

USE db_university2;

CREATE TABLE students (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  last_name VARCHAR(255),
  birthdate DATE,
  PRIMARY KEY(id)
);

CREATE TABLE courses (
  id INT NOT NULL AUTO_INCREMENT, 	
  name VARCHAR(100),
  PRIMARY KEY(id)
);


CREATE TABLE students_courses(
id_student INT NOT NULL,
id_course INT NOT NULL,
create_at DATE,
FOREIGN KEY (id_student) REFERENCES students(id),
FOREIGN KEY (id_course) REFERENCES courses(id)
);

INSERT INTO students (name, last_name, birthdate) VALUES 
('Juan', 'Perez', '1990-05-15'),
('Maria', 'Gomez', '1992-08-22'),
('Carlos', 'Rodriguez', '1995-03-10'),
('Ana', 'Martinez', '1993-11-05'),
('David', 'Lopez', '1998-02-28');


INSERT INTO courses (name) VALUES 
('Mathematics'),
('History'),
('Physics'),
('English'),
('Computer Science');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM students_courses;

INSERT INTO students_courses (id_student, id_course, create_at) VALUES 
(1, 1, '2023-01-10'),
(2, 3, '2023-02-15'),
(3, 2, '2023-03-20'),
(4, 5, '2023-04-25'),
(5, 4, '2023-05-30');

SELECT * FROM students AS s JOIN students_courses AS sc ON s.id = sc.id_student 
JOIN courses AS c ON c.id = sc.id_course WHERE s.birthdate 

##FALTA ALGORITMO


INSERT INTO students_courses (id_student, id_course, create_at) VALUES
(1, 4, '2023-03-19');

