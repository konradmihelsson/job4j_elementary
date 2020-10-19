create table departments (
                           id serial primary key,
                           name varchar(255)
);
create table employees (
                         id serial primary key,
                         name varchar(255),
                         dpt_id int references departments(id)
);
insert into departments (name) values ('finance');
insert into departments (name) values ('management');
insert into departments (name) values ('development');
insert into employees (name, dpt_id) values ('Boris', 1);
insert into employees (name, dpt_id) values ('Jorik', 1);
insert into employees (name, dpt_id) values ('Olga', 2);
insert into employees (name, dpt_id) values ('Stanislas', 2);
insert into employees (name, dpt_id) values ('Armen', 2);
insert into employees (name, dpt_id) values ('Denis', 3);
insert into employees (name, dpt_id) values ('Vladimir', 3);
insert into employees (name, dpt_id) values ('Kristina', 3);
insert into employees (name, dpt_id) values ('Sergey', 3);
insert into employees (name, dpt_id) values ('Abraam', 3);
insert into employees (name, dpt_id) values ('Ivan', null);
insert into employees (name, dpt_id) values ('Julia', null);
insert into employees (name, dpt_id) values ('Maksim', null);

select * from employees e left join departments d on e.dpt_id = d.id;
select * from employees e right join departments d on e.dpt_id = d.id;
select * from departments d left join employees e on d.id = e.dpt_id;
select * from departments d right join employees e on d.id = e.dpt_id;
select * from employees e full join departments d on e.dpt_id = d.id;
select * from departments d full join employees e on d.id = e.dpt_id;
select * from employees cross join departments;
select * from departments cross join employees;

select e.name from employees e left join departments d on e.dpt_id = d.id
where e.dpt_id is null;

select e.id, e.name, d.id, d.name from employees e left join departments d
                                                             on e.dpt_id = d.id;
select e.id, e.name, d.id, d.name from departments d right join employees e
                                                                on d.id = e.dpt_id;

create table teens (
                     id serial primary key,
                     name varchar(255),
                     gender varchar(127)
);
insert into teens (name, gender) values ('Boris', 'male');
insert into teens (name, gender) values ('Sergey', 'male');
insert into teens (name, gender) values ('Igor', 'male');
insert into teens (name, gender) values ('Aleksandr', 'male');
insert into teens (name, gender) values ('Denis', 'male');
insert into teens (name, gender) values ('Anna', 'female');
insert into teens (name, gender) values ('Lyuba', 'female');
insert into teens (name, gender) values ('Kristina', 'female');
insert into teens (name, gender) values ('Nastya', 'female');
insert into teens (name, gender) values ('Angelina', 'female');
insert into teens (name, gender) values ('Alla', 'female');

with boys as (
  select name from teens where gender = 'male'
), girls as (
  select name from teens where gender = 'female'
)
select boys.name, girls.name from boys cross join girls;
