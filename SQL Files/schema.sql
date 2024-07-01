CREATE TABLE Departments (
    dept_no INT PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    title_id INT,
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE,
    FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,
    salary DECIMAL(10, 2),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Titles (
    title_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Department_Employee (
    dept_no INT,
    emp_no INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Department_Manager (
    dept_no INT,
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

COPY Departments(dept_no, dept_name)
FROM '/Resources/departments.csv'
DELIMITER ','
CSV HEADER;

COPY Employees(emp_no, title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Resources/employees.csv'
DELIMITER ','
CSV HEADER;

COPY Salaries(emp_no, salary)
FROM '/Resources/salaries.csv'
DELIMITER ','
CSV HEADER;

COPY Titles(title_id, title)
FROM '/Resources/titles.csv'
DELIMITER ','
CSV HEADER;

COPY Department_Employee(dept_no, emp_no)
FROM '/Resources/dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY Department_Manager(dept_no, emp_no)
FROM '/Resources/dept_manager.csv'
DELIMITER ','
CSV HEADER;