INSERT INTO classes (name)
VALUES ('Class 9A');

INSERT INTO classes (name)
VALUES ('Class 8A');

INSERT INTO students (first_name, last_name, class_id)
VALUES
    ('Peter', 'Wilson', 1),
    ('Emily', 'Johnson', 1),
    ('Michael', 'Davis', 1),
    ('Sarah', 'Miller', 1),
    ('David', 'Taylor', 1),
    ('Olivia', 'Brown', 1),
    ('Daniel', 'Thomas', 1),
    ('Sophia', 'Martin', 1),
    ('James', 'White', 1),
    ('Emma', 'Clark', 1);

INSERT INTO students (first_name, last_name, class_id)
VALUES
    ('Lucas', 'Anderson', 4),
    ('Ava', 'Robinson', 4),
    ('Ethan', 'Walker', 4),
    ('Isabella', 'Hall', 4),
    ('Alexander', 'Young', 4),
    ('Mia', 'Allen', 4),
    ('Benjamin', 'King', 4),
    ('Charlotte', 'Wright', 4),
    ('Henry', 'Scott', 4),
    ('Amelia', 'Green', 4);

INSERT INTO teachers (first_name, last_name)
VALUES ('Anna', 'Brown'),
		('James', 'Anderson'),
		('Maria', 'Taylor');

INSERT INTO subjects (name, teacher_id)
VALUES
    ('English', 3),
    ('Physics', 3),
    ('Chemistry', 4),
    ('History', 4),
    ('Biology', 1);

INSERT INTO schedule
    (class_id, subject_id, day_of_week, start_time, end_time)
VALUES
    (1, 6, 'Monday', '08:00', '08:45');

INSERT INTO attendance (student_id, attendance_date, status)
VALUES (1, CURRENT_DATE, 'present');

select * from STUDENTS where class_id = 1;

select last_name, first_name from STUDENTS where class_id = 4 order by last_name desc limit 3;
