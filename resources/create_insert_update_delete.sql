CREATE database cities;
create table cities(
                       OKTMO bigint primary key,
                       name varchar(127),
                       area real,
                       population integer
);
INSERT INTO cities VALUES (45000000, 'Москва', 2511, 12506468);
INSERT INTO cities VALUES (18701000001, 'Волгоград', 859.4, 1013533);
INSERT INTO cities VALUES (15701000001, 'Брянск', 186.73, 402675);
select * from cities;
update cities set population = 12506475 where oktmo = 45000000;
delete from cities where oktmo = 45000000;
