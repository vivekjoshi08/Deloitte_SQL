use employee_database;

#jobs available
select count(job_title) from jobs;

#total salary payble to employees

select sum(salary) from employees;

#min salary of employee
select min(salary) from employees;

#max salary as programmer 
select max(salary) from employees where employee_id in ( 
select employee_id from employees where department_id in ( 
select department_id from departments where department_name = 'IT'
));

#avg salary and no of employees in department 90
select avg(salary), count(employee_id) from employees where employee_id in ( 
select employee_id from employees where department_id in ( 
select department_id from departments where department_id = 90
));

#max, min, avg, sum of salary
select sum(salary), avg(salary), min(salary), max(salary) from employees;

#7 number of emp with same jobs
select count(employee_id), job_id from employees
group by job_id;

#diff b/w heighest and lowest salary
select max(salary) - min(salary) as diff from employees;

#find manager id & salary of lowest paid emp of that manager
select manager_id, min(salary) from employees
where manager_id is not null
group by manager_id
order by manager_id;

#10 print each dept with its total salary
#querry 
select department_id, sum(employees.salary) from employees
group by department_id;

#11 avg salary of each job except IT
select job_id, avg(salary) from employees
where job_id != 'IT' 
group by job_id;

#12 total avg min max of employees where dept id = 90
select job_id, (salary), avg(salary), min(salary), max(salary) from employees
where department_id = 90
group by job_id;

#job id and max where max salary > 4000
select job_id, max(salary) from employees 
where salary > 4000
group by job_id;

# if job_id count > 10 find avg_salary
select department_id, avg(salary), count(*) from employees
group by department_id having count(employee_id) > 10;