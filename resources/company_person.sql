CREATE TABLE company
(
  id integer NOT NULL,
  name character varying,
  CONSTRAINT company_pkey PRIMARY KEY (id)
);

CREATE TABLE person
(
  id integer NOT NULL,
  name character varying,
  company_id integer,
  CONSTRAINT person_pkey PRIMARY KEY (id)
);
insert into company (id, name)
values (1, 'finance');
insert into company (id, name)
values (2, 'management');
insert into company (id, name)
values (3, 'development');
insert into person (id, name, company_id)
values (1, 'Boris', 1);
insert into person (id, name, company_id)
values (2, 'Jorik', 1);
insert into person (id, name, company_id)
values (3, 'Olga', 2);
insert into person (id, name, company_id)
values (4, 'Stanislas', 2);
insert into person (id, name, company_id)
values (5, 'Armen', 2);
insert into person (id, name, company_id)
values (6, 'Denis', 3);
insert into person (id, name, company_id)
values (7, 'Vladimir', 3);
insert into person (id, name, company_id)
values (8, 'Kristina', 3);
insert into person (id, name, company_id)
values (9, 'Sergey', 3);
insert into person (id, name, company_id)
values (10, 'Abraam', 3);
insert into person (id, name, company_id)
values (11, 'Ivan', null);
insert into person (id, name, company_id)
values (12, 'Julia', null);
insert into person (id, name, company_id)
values (13, 'Maksim', null);

select p.name,
       c.name
from person p left join company c on p.company_id = c.id
where NOT p.company_id = 2;

with rsl as (select c.name as company_name,
                  count(c.name) as person_count
           from person p left join company c on p.company_id = c.id
           group by (c.id))
select *
from rsl
order by rsl.person_count DESC
limit 1;
