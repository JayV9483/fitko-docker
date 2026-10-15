CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    class_id INT REFERENCES classes(id)
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT REFERENCES teachers(id)
);

CREATE TABLE schedule (
    id SERIAL PRIMARY KEY,
    class_id INT NOT NULL REFERENCES classes(id),
    subject_id INT NOT NULL REFERENCES subjects(id),
    day_of_week VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    CHECK (end_time > start_time)
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(id),
    attendance_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('present', 'absent', 'late')),
    UNIQUE (student_id, attendance_date)
);


