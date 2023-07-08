CREATE TABLE Titles(
	title_id VARCHAR(6) NOT NULL,
	title VARCHAR(30) NOT NULL,	
	PRIMARY KEY(title_id)
);

CREATE TABLE Employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR(6) NOT NULL,
	birth_date VARCHAR(11) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date VARCHAR(11) NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE Departments(
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(dept_no)	
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL, 
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY(emp_no,dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);