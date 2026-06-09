create table deliverypartner(brand1 varchar,brand2 varchar,brand3 varchar,winner varchar);
select * from deliverypartner;
insert into deliverypartner(brand1,brand2,brand3,winner)values('a','b','c','b'),('b','c','e','e'),('c','a','d','d'),('d','e','a','a'),('f','b','c','f');
SELECT
    brand,
    COUNT(*) AS no_of_rides,
    COUNT(*) FILTER (WHERE winner = brand) AS rides_won,
    COUNT(*) FILTER (WHERE winner <> brand) AS rides_lost
FROM (
    SELECT brand1 AS brand, winner FROM deliverypartner
    UNION ALL
    SELECT brand2 AS brand, winner FROM deliverypartner
    UNION ALL
    SELECT brand3 AS brand, winner FROM deliverypartner
)
GROUP BY brand
ORDER BY brand;













select 
sum(case when val='a' then 1 else 0 end)as a_count,
sum(case when val='b' then 1 else 0 end)as b_count,
sum(case when val='c' then 1 else 0 end)as c_count,
sum(case when val='d' then 1 else 0 end)as d_count,
sum(case when val='e' then 1 else 0 end)as e_count,
sum(case when val='f' then 1 else 0 end)as f_count
FROM (
    SELECT brand1 AS val FROM deliverypartner
    UNION ALL
    SELECT brand2 FROM deliverypartner
    UNION ALL
    SELECT brand3 FROM deliverypartner
);

SELECT
    val,
    SUM(CASE WHEN val = winner THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN val <> winner THEN 1 ELSE 0 END) AS losses
FROM (
    SELECT brand1 AS val, winner FROM deliverypartner
    UNION ALL
    SELECT brand2, winner FROM deliverypartner
    UNION ALL
    SELECT brand3, winner FROM deliverypartner
) t
GROUP BY val
ORDER BY val;



