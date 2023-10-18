drop table visitors cascade;
create table users (
                       id bigserial primary key,
                       first_name varchar(30) not null,
                       last_name varchar(30) not null,
                       middle_name varchar(30),
                       phone_number varchar(15),
                       date_of_birth date,
                       profession varchar(30),
                       nationality varchar(30)
);
create table ticket (
                        id bigserial primary key,
                        user_id bigint references users(id) not null,
                        exhibition_id bigint references exhibitions(id) not null
);