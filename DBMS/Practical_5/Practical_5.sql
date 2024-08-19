
create database PRAC_5;
use PRAC_5;

Select * from emp_mstr;

-- 1) How many employees are there in each department?
SELECT emp_name, COUNT(salary) AS emp_count
FROM emp_mstr
GROUP BY emp_name;

-- 2) Find out total number of job role assigned in each department.
Select job_name,count(job_name) AS job_num
from emp_mstr
group by job_name;

-- 3) Find out employee’s names and salary whose having salary more than 2000.(Duplication in employee name should be removed)

select emp_name,salary from emp_mstr where salary>2000;

-- 4) Find out number of employees hired after 03rd April 1991.

Select emp_name,hire_date,count(emp_name) AS emp_num
from emp_mstr where hire_date>"1991-06-03"
group by emp_name,hire_date;

-- 5) lists the number of employees in each job role, sorted high to low.

select job_name, count(*) AS employee_count, hire_date
from emp_mstr 
group by job_name, hire_date
order by employee_count desc;

-- 6) lists the number of employees in each department. Only include department with more than 3 employees in each.

SELECT job_name, count(*) AS employee_count
FROM emp_mstr 
GROUP BY job_name HAVING COUNT(*) > 3
ORDER BY employee_count;

-- 7) Display the total amount of the salary on each department.

SELECT job_name, SUM(salary) AS total_salary
FROM emp_mstr
GROUP BY job_name;

-- 8) Count total number of employees assigned in each department whose name end with “n”.

SELECT job_name, COUNT(*) AS employee_count
FROM emp_mstr
WHERE emp_name LIKE '%n'
GROUP BY job_name;

-- 9) Find out total number of employees having "a" as a character in their name in each department.

SELECT job_name, COUNT(*) AS employee_count
FROM emp_mstr
WHERE emp_name LIKE '%a%'
GROUP BY job_name;

-- 10) Find out total number of employees having salary more than average salary of all the employee in each department.

SELECT job_name, COUNT(*) AS employee_count
FROM emp_mstr
WHERE salary > (SELECT AVG(salary) FROM emp_mstr)
GROUP BY job_name;

-- 11)Display total number of employees in each department whose department having more than 2 employees also display department id in descending order.

SELECT dep_id, COUNT(*) AS employee_count
FROM emp_mstr
GROUP BY dep_id
HAVING COUNT(*) > 2
ORDER BY dep_id DESC;

-- 12) Display department wise average salary of employee.

SELECT job_name, AVG(salary) AS average_salary
FROM emp_mstr
GROUP BY job_name;

-- 13)Display department id of the employee along with salary whose salary is maximum in respective department.

SELECT dep_id, emp_name, salary
FROM emp_mstr e
WHERE salary = (
    SELECT MAX(salary)
    FROM emp_mstr
    WHERE dep_id = e.dep_id
);

-- 14)Display department id of the employee along with salary whose salary is minimum in respective department.

SELECT dep_id, emp_name, salary
FROM emp_mstr e
WHERE salary = (
    SELECT MIN(salary)
    FROM emp_mstr
    WHERE dep_id = e.dep_id
);
