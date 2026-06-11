create table employees(id int primary key,name varchar,salary int,manager_id int);
insert into employees(id,name,salary,manager_id)
values(1,'arjun',120000,0),
	  (2,'priya',95000,1),
	  (3,'rahul',130000,1),
	  (4,'sneha',80000,2),
	  (5,'amit',100000,2),
	  (6,'neha',75000,3);

update employees set manager_id=null where manager_id=0;
select * from employees;
select * from employees order by id ASC;

select 
e.id,
e.name as employee_name,
e.salary as employee_salary,
m.name as manager_name,
m.salary as manager_salary
from employees e
join employees m
on e.manager_id=m.id
where e.salary>m.salary;



