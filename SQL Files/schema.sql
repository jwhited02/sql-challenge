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

CREATE TABLE Dept_Emp (
    dept_no INT,
    emp_no INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_Manager (
    dept_no INT,
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

LOAD DATA INFILE 'Resources/departments.csv' 
INTO TABLE Departments 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'Resources/dept_emp.csv' 
INTO TABLE Dept_Emp 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'Resources/dept_manager.csv' 
INTO TABLE Dept_Manager
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'Resources/employees.csv' 
INTO TABLE Employees
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'Resources/salaries.csv' 
INTO TABLE Salaries
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'Resources/titles.csv' 
INTO TABLE Titles 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;