DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses(
  id serial4 PRIMARY KEY,
  house_name varchar(255)
);


CREATE TABLE students(
  id serial4 PRIMARY KEY,
  first_name varchar(255),
  second_name varchar(255),
  house_id INT4 REFERENCES houses(id),
  age INT4
);
