create table scores(name varchar,subject varchar,score int);
insert into scores(name,subject,score)
values('arav','math',85),
('arav','science',90),
('arav','english',78),
('priya','math',92),
('priya','science',88),
('priya','english',95),
('rahul','math',70),
('rahul','science',65),
('rahul','english',80);
select * from scores;
select name,
sum(case when subject='math' then score end)as math,
sum(case when subject='scince' then score end)as scince,
sum(case when subject='english' then score end)as english
from scores
group by name
order by name asc;

