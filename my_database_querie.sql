create table customers(customerid int primary key,customername varchar,address varchar,city varchar,postalcode int,country varchar);
insert into customers values(1,'rupesh','k.narasapuram','hindupur',515261,'india');
insert into customers values(2,'umesh','parigi','hindupur',515261,'india');
insert into customers values(3,'raju','banglore','kogil',515001,'india');
insert into customers values(4,'rajesh','banglore','marthalli',515002,'india');
select * from customers;
select country from customers;--returns country column
select count(distinct country) from customers; --retuns without duplicates
select count(*) from customers;--returns count of all rows present in table
select * from customers where country = 'india';--returns all rows which belongs to india
select address,postalcode from customers where country='india';
select * from customers where customerid=2;
select * from customers where customerid>2;
select * from customers where customerid<2;
select * from customers where customerid!=2;
select * from customers where customerid between 1 and 4;
select * from customers where city like 'h%';
select * from customers where city in('hindupur','marthalli');
select * from customers order by customerid;--it returns from lower to greater
select * from customers order by customerid DESC;--it returns from higher to low
select * from customers order by customerid ASC;
select * from customers order by address;
select * from customers order by address DESC;
select * from customers order by address,customername;
select * from customers order by customername ASC,postalcode DESC;--first it will sort customername then there is a same customer names then it will sort by using postal code
select * from customers where country='india' and city like 'h%';--%h represents starting letter of city
select * from customers where country='india' and city ='hindupur';
select customername , address from customers where city='hindupur' and country='india';
select * from customers where city='marthalli' or city='kogil';
select * from customers where not city='kogil';--it returns the customers which city=not kogil
select * from customers where customername not like 'r%';
select * from customers where customerid not between 1 and 3;
SELECT * FROM Customers WHERE City NOT IN ('hindupur', 'kogil');
insert into customers (customerid,customername,country) values(5,'kiran','india');-- it will add values only related column
select customerid,customername from customers where address is not null; --it returns not null values
select customerid,customername from customers where address is null;--it returns only null values
update customers set customername='abc',city='hyderabad' where customerid=5;--it will update customername ,city.
delete from customers where customerid=5;--it will delete entire row
delete from customers;--delete entire rows
drop table customers;--delete entire data
select * from customers limit 2;--it return first two rows
select customername from customers limit 2;
SELECT * FROM Customers FETCH FIRST 3 ROWS ONLY;
select * from customers limit 2 offset 2;--it will skip first 2 rows and fetch 2 rows
select * from customers where country='india' limit 3;--it returns first 3 rows where country belongs to india
select * from employee;
alter table employee add column salary int;
update employee set salary=50000 where name='john';
update employee set salary=60000 where name='ramu';
insert into employee values('somu',2468,30,'ghi@gmail.com',40000);
update employee set salary=NULL where name='somu';
select min(salary)  from employee;--it returns min salary
select * from employee where salary=(select min(salary) from employee);--it returns entire row where salary is minimum
select max(salary)  from employee;--it returns max salary
select * from employee where salary=(select max(salary) from employee);--it returns entire row where salary is maximum
select avg(salary) from employee;--it returns average salary
select round(avg(salary),2) from employee;--it returns average salary with two decimal points
select count(*) from employee;--it returns count value
select count(distinct salary) from employee;--it count values without null values
select sum(salary) from employee;
select min(salary) as smallestsalary from employee;--it returns salary column as smallestsalary
select sum(salary) from employee where age between 20 and 30;
select round(avg(salary),2) from employee where age=20;
select * from employee;
select * from customers;
update employee set empid=1 where empid=1234;
update employee set empid=2 where empid=5678;
update employee set empid=3 where empid=2468;

select e.name,e.salary,c.postalcode from employee e inner join customers c on e.empid=c.customerid;--it returns the rows which are having same customerid in employee id
select * from employee e left join customers c on e.empid=c.customerid;
select * from employee e left join customers c on e.empid=c.customerid order by name;--it will arrange the names in alphabetical order
select * from employee e left join customers c on e.empid=c.customerid where e.salary is not null;
select * from employee e right join customers c on e.empid=c.customerid;
select * from employee e right join customers c on e.empid=c.customerid order by name;
select * from employee e right join customers c on e.empid=c.customerid where e.salary is not null;
select * from employee e right join customers c on e.empid=c.customerid where e.salary is null;
select * from employee e full outer join customers c on e.empid=c.customerid;
select name,salary from employee cross join customers;-- it returns empid*customersid 3*4=12
select empid from employee union select customerid from customers order by empid;-- it returns without duplicates
select empid from employee union all select customerid from customers order by empid;-- it returns with duplicates
select count(customerid),customername from customers group by customername;
SELECT product_name FROM products WHERE product_id = ANY (SELECT product_id FROM order_details WHERE quantity > 120);
select name, 
	case 
		when salary <= 50000 then 'low salary'
		when salary > 50000 then 'high salary'
	else
		'null salary'
	end as "pricecategory"--adding alise coloum name as price category
from employee;