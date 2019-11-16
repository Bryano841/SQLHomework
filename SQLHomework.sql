create table employees(
emp_no INT,
birth_date DATE,
first_name VARCHAR(30) not null,
last_name VARCHAR(30) not null,
gender VARCHAR(30) not null,
hire_date DATE);

select * from employees;

create table dept_manager(
dept_no VARCHAR(30),
emp_no INT,
from_date DATE,
to_date DATE);

select * from dept_manager;

create table dept_emp(
emp_no INT,
dept_no VARCHAR(30),
from_date DATE,
to_date DATE);

select * from dept_emp;

create table departments(
dept_no VARCHAR(30),
departments VARCHAR(30));

select * from departments;

create table titles(
emp_no INT,
title VARCHAR(30),
from_date DATE,
to_date DATE);

select * from titles;

create table salaries(
emp_no INT,
salary INT,
from_date DATE,
to_date DATE);

select * from salaries;

select employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
from employees
JOIN salaries on employees.emp_no = salaries.emp_no;

select last_name, first_name, hire_date
from employees
where hire_date >= '1986-01-01' and
hire_date <= '1986-12-31';

select employees.emp_no, last_name, first_name, departments
from employees
join dept_emp on (dept_emp.emp_no = employees.emp_no)
join departments on (departments.dept_no = dept_emp.dept_no)
order by
employees.emp_no;

select first_name, last_name
from employees
where first_name = 'Hercules' and
last_name like 'B%';

select employees.emp_no, last_name, first_name, department
from employees
join dept_emp on (dept_emp.emp_no = employees.emp_no)
join departments on (departments.dept_no = dept_emp.dept_no)
where department = 'Sales'
order by employees.emp_no;

select employees.emp_no, last_name, first_name, department
from employees
join dept_emp on (dept_emp.emp_no = employees.emp_no)
join departments on (departments.dept_no = dept_emp.dept_no)
where department = 'Sales'
or department = 'Development'
order by employees.emp_no;

select last_name, count (last_name)
from employees
group by last_name
order by last_name
DESC;