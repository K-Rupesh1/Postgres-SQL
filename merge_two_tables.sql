create table target_table(target_id int,customer_name varchar,email varchar);
insert into target_table values(101,'john smith','john@email.com');
insert into target_table values(102,'sarah lee','sarah@email.com');
select * from target_table;
create table source_table(customer_id int,customer_name varchar,email varchar);
insert into source_table(customer_id,customer_name,email)
values(102,'sarah lee','sarah_new@email.com'),
(103,'david kim','david@email.com');

alter table target_table rename column target_id to customer_id;
select * from source_table;

MERGE INTO target_table t
USING source_table s
ON t.customer_id = s.customer_id

WHEN MATCHED THEN
    UPDATE SET
        customer_name = s.customer_name,
        email = s.email

WHEN NOT MATCHED THEN
    INSERT (customer_id, customer_name, email)
    VALUES (s.customer_id, s.customer_name, s.email);

select * from target_table;