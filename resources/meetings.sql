CREATE TYPE status AS ENUM ('unseen', 'confirmed', 'rejected');
CREATE TABLE meetings
(
    id serial primary key,
    name varchar(100)
);
create table users
(
    id serial primary key,
    name varchar(100)
);
create table requests
(
    meeting_id int references meetings(id),
    user_id int references users(id),
    user_confirmation status
);

insert into meetings (name) values ('briefing');
insert into meetings (name) values ('planning');
insert into meetings (name) values ('summarizing');

insert into users (name) values ('Igor');
insert into users (name) values ('Pavel');
insert into users (name) values ('Olga');
insert into users (name) values ('Kristina');

insert into requests (meeting_id, user_id, user_confirmation) VALUES (1, 1, 'unseen');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (1, 2, 'confirmed');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (1, 3, 'confirmed');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (1, 4, 'rejected');

insert into requests (meeting_id, user_id, user_confirmation) VALUES (2, 1, 'confirmed');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (2, 2, 'unseen');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (2, 4, 'rejected');

insert into requests (meeting_id, user_id, user_confirmation) VALUES (3, 1, 'rejected');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (3, 2, 'unseen');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (3, 3, 'rejected');
insert into requests (meeting_id, user_id, user_confirmation) VALUES (3, 4, 'rejected');

select m.name, count(*)
from requests r left join meetings m on r.meeting_id = m.id
where user_confirmation = 'confirmed'
group by m.name;

with confirmed as (select meeting_id
from requests
where user_confirmation = 'confirmed')
select m.name from requests
left join confirmed on requests.meeting_id = confirmed.meeting_id
left join meetings m on requests.meeting_id = m.id
where confirmed.meeting_id is null
group by m.name;
