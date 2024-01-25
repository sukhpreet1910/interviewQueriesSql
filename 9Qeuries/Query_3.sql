-- Query 3:

-- Write a SQL query to display only the details of employees who either earn the highest salary
-- or the lowest salary in each department from the employee table.

select x.*
from employee e
join 
(SELECT *,
min(salary) over(partition by dept_name order by salary ) as min,
max(salary) over(partition by dept_name order by salary desc) as high
from employee
order by 3) x 
on e.emp_id = x.emp_id AND
(x.min = e.salary or x.high = e.salary)