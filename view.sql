use new_database;

#query1
create view query1 as
select first_name, last_name, salary from employees
where salary > ( select salary from employees where last_name = 'Bull');


#query2
create view query2 as 
select first_name, last_name from employees
where department_id = ( select department_id from departments where department_name = 'IT');


#query3
create view query3 as
select first_name, last_name from employees
inner join departments on  departments.department_id = employees.department_id
inner join locations on locations.location_id = departments.location_id
where employees.manager_id is not null 
and locations.country_id = 'US';

#query4
create view query4 as 
select first_name, last_name from employees 
where salary > (select avg(salary) from employees )
and department_id = ( select department_id from departments where department_name = 'IT');

#query5
create view query5 as 
select first_name, last_name from employees
where salary > ( select salary from employees where last_name = 'Bell');

#query6-7
create view query6 as 
select job_id, first_name, last_name, (salary) from employees
where salary = ( select min(salary) from employees );


#query8
drop view query8;
create view query8 as 
select distinct salary from employees
order by salary desc
limit 1
offset 4;

#query9
create view query9 as 
select * from 
( select * from employees order by employee_id desc limit 10) y 
order by employee_id asc;

#query10
create view query10 as 
select distinct salary 
from employees
order by salary asc
limit 3;



select * from query1;

select * from query2;

select * from query3;

select * from query4;

select * from query5;

select * from query6;

select * from query8;

select * from query9;

select * from query10;