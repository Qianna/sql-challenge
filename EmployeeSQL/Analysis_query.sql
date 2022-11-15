-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, salaries.salary 
from employees
inner join salaries on employees.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
select d1.dept_no, d2.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager as d1
left join departments as d2
	on d1.dept_no=d2.dept_no
left join employees 
	on d1.emp_no=employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d2.dept_name
from employees as e
left join dept_emp as d1
	on e.emp_no = d1.emp_no
inner join departments as d2
	on d1.dept_no = d2.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees 
where (first_name='Hercules') and (last_name like 'B%');

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, departments.dept_name
from employees as e
inner join dept_emp on e.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
	where departments.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, departments.dept_name
from employees as e
inner join dept_emp on e.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
	where (departments.dept_name='Sales') or (departments.dept_name='Development');
	
-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(*) as count
from employees
group by last_name order by count DESC;







