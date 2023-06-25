DROP TABLE student CASCADE;
CREATE TABLE student (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE course CASCADE;
CREATE TABLE course (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE roster CASCADE;
CREATE TABLE roster (
    id SERIAL,
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    UNIQUE(student_id, course_id),
    PRIMARY KEY (id)
);

INSERT INTO course (title) VALUES ('si106'); -- course 1 
INSERT INTO course (title) VALUES ('si110'); -- course 2
INSERT INTO course (title) VALUES ('si206'); -- course 3

INSERT INTO student (name) VALUES ('Jace'); -- student 1
INSERT INTO student (name) VALUES ('Kerri'); -- student 2
INSERT INTO student (name) VALUES ('Mayra'); -- student 3
INSERT INTO student (name) VALUES ('Mohaddesa'); -- student 4

INSERT INTO student (name) VALUES ('Agatha'); -- student 5
INSERT INTO student (name) VALUES ('Edith'); -- student 6
INSERT INTO student (name) VALUES ('Madisson'); -- student 7
INSERT INTO student (name) VALUES ('Witney'); -- student 8

INSERT INTO student (name) VALUES ('Derrin'); -- student 9
INSERT INTO student (name) VALUES ('Finn'); -- student 10
INSERT INTO student (name) VALUES ('Forrest'); -- student 11
INSERT INTO student (name) VALUES ('Spencer'); -- student 12

INSERT INTO student (name) VALUES('Yassin'); -- instructor 13
INSERT INTO student (name) VALUES('Kylen'); -- instructor 14
INSERT INTO student (name) VALUES('Hcen'); -- instructor 15

-- learner = 0, instructor = 1 
INSERT INTO roster (student_id, course_id, role) VALUES (13, 1, 1);
INSERT INTO roster (student_id, course_id, role) VALUES (1, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (2, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (3, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (4, 1, 0);

INSERT INTO roster (student_id, course_id, role) VALUES (14, 2, 1);
INSERT INTO roster (student_id, course_id, role) VALUES (5, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (6, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (7, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (8, 2, 0);

INSERT INTO roster (student_id, course_id, role) VALUES (15, 3, 1);
INSERT INTO roster (student_id, course_id, role) VALUES (9, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (10, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (11, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES (12, 3, 0);

-- Check
SELECT student.name, course.title, roster.role
    FROM student 
    JOIN roster ON student.id = roster.student_id
    JOIN course ON roster.course_id = course.id
    ORDER BY course.title, roster.role DESC, student.name;
