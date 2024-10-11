DROP TABLE IF EXISTS student, instructor, class, attendance;

CREATE TABLE student (
	id INTEGER NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    email_address VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT pk_student PRIMARY KEY(id)
);
CREATE TABLE instructor (
	id INTEGER NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    email_address VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL,
    is_TA BOOLEAN NOT NULL,
    CONSTRAINT pk_instructor PRIMARY KEY(id)
);
CREATE TABLE class (
	crn INTEGER NOT NULL,
	course_department VARCHAR(5),
    course_number INTEGER,
    course_title VARCHAR(100),
    semester_provided VARCHAR(12),
    instructor INTEGER,
    CONSTRAINT pk_class PRIMARY KEY(crn),
    CONSTRAINT fk_class_instructor FOREIGN KEY(instructor) REFERENCES instructor(id)
);
CREATE TABLE attendance (
	course_id INTEGER,
    instructor_id INTEGER,
    student_id INTEGER,
    present BOOLEAN,
    CONSTRAINT pk_attendance PRIMARY KEY(course_id, instructor_id, student_id),
    CONSTRAINT fk_attendance_course FOREIGN KEY(course_id) REFERENCES class(crn),
    CONSTRAINT fk_attendance_instructor FOREIGN KEY(instructor_id) REFERENCES instructor(id),
    CONSTRAINT fk_attendance_student FOREIGN KEY(student_id) REFERENCES student(id)
);    

