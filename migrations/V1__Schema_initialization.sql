create table artists (
                         id bigserial primary key,
                         first_name varchar(30) not null,
                         last_name varchar(30) not null,
                         date_of_birth date,
                         country varchar(100),
                         drawing_style varchar(30)
);

create table galleries (
                           id bigserial primary key,
                           name varchar(40) not null,
                           address varchar(200),
                           description text
);
create table visitors (
                          id bigserial primary key,
                          first_name varchar(30) not null,
                          last_name varchar(30) not null,
                          patronymic varchar(30),
                          phone_number varchar(11)
);
create table tutors (
                        id bigserial primary key,
                        first_name varchar(30) not null,
                        last_name varchar(30) not null,
                        patronymic varchar(30),
                        work_experience smallint check (work_experience >= 0 and work_experience <= 100)
);

create table exhibitions (
                             id bigserial primary key,
                             name varchar(40),
                             start_date date,
                             finish_date date,
                             gallery_id bigint references galleries(id),
                             tutor_id bigint references tutors(id),
                             ticket_price integer check (ticket_price > 0),
                             unique(name, gallery_id)
);

create table pictures (
                          id bigserial primary key,
                          name varchar(100),
                          price integer,
                          publishing_date date,
                          artist_id bigint references artists(id),
                          exhibition_id bigint references exhibitions(id)
);