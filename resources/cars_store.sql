create table body
(
  id           serial primary key,
  model        varchar(127),
  manufacturer varchar(127)
);
create table engine
(
  id           serial primary key,
  model        varchar(127),
  manufacturer varchar(127)
);
create table transmission
(
  id           serial primary key,
  model        varchar(127),
  manufacturer varchar(127)
);
create table car
(
  id              serial primary key,
  model           varchar(127),
  manufacturer    varchar(127),
  body_id         int references body (id),
  engine_id       int references engine (id),
  transmission_id int references transmission (id)
);
insert into body (model, manufacturer)
values ('T200', 'Chevrolet');
insert into body (model, manufacturer)
values ('J309', 'Chevrolet');
insert into body (model, manufacturer)
values ('J50', 'Infinity');
insert into body (model, manufacturer)
values ('D10', 'Nissan');
insert into body (model, manufacturer)
values ('Patriot', 'UAZ');
insert into engine (model, manufacturer)
values ('EA111', 'Audi');
insert into engine (model, manufacturer)
values ('M67', 'BMW');
insert into engine (model, manufacturer)
values ('ET3J4', 'Peugeot');
insert into engine (model, manufacturer)
values ('FB20X', 'Subaru');
insert into engine (model, manufacturer)
values ('409', 'ZMZ');
insert into engine (model, manufacturer)
values ('B8444S', 'Volvo');
insert into transmission (model, manufacturer)
values ('7227', 'Mersedes');
insert into transmission (model, manufacturer)
values ('6Т40', 'Opel');
insert into transmission (model, manufacturer)
values ('5L50', 'Cadillac');
insert into transmission (model, manufacturer)
values ('5R110', 'Ford');
insert into transmission (model, manufacturer)
values ('2182', 'VAZ');
insert into transmission (model, manufacturer)
values ('AW5550SN', 'Lexus');
insert into transmission (model, manufacturer)
values ('TG81SC', 'Volvo');
insert into car (model, manufacturer, body_id, engine_id, transmission_id)
values ('Octavia', 'Shkoda', 1, 1, 1);
insert into car (model, manufacturer, body_id, engine_id, transmission_id)
values ('Sonata', 'Hyundai', 2, 2, 2);
insert into car (model, manufacturer, body_id, engine_id, transmission_id)
values ('Rio', 'Kia', 4, 5, 5);
insert into car (model, manufacturer, body_id, engine_id, transmission_id)
values ('Alphard', 'Toyota', 5, 6, 7);

select *
from car
       left join body on car.body_id = body.id
       left join engine on car.engine_id = engine.id
       left join transmission on car.transmission_id = transmission.id;

select *
from car
       full join body b on car.body_id = b.id
       full join engine e on car.engine_id = e.id
       full join transmission t on car.transmission_id = t.id where car is null;
