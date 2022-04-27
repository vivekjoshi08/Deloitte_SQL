use new_database;

UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE "%123%" ;

select first_name from employees 
where char_length(first_name) >= 8;


select job_id, lpad( max_salary, 7, '0') 'Max_Salary', 
lpad(min_salary, 7, '0') 'Min_Salary'
from jobs;