CREATE TABLE Titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE Departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name TEXT NOT NULL
);

CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    title_id VARCHAR(10),
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

CREATE TABLE Department_Employee (
    emp_no INT,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(10),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

