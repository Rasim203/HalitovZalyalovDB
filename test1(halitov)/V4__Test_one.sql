create table musician (
                          id bigserial primary key,
                          name varchar(100) not null,
                          information text,
                          listeners_per_mouth bigint
);

create table releases(
                         id bigserial primary key,
                         name varchar(100) not null,
                         artist_id bigint references musician(id),
                         release_date date,
                         genre varchar(100),
                         release_type varchar(50)
);

create table tracks(
                       id bigserial primary key,
                       name varchar(100) not null,
                       duration bigint not null check (duration >= 0),
                       track_number int not null check (track_number > 0),
                       release_id bigint references releases(id),
                       lyrics text,
                       unique (name, release_id)
);

insert into musician(name, information, listeners_per_mouth) values ('группа 1','какая-то инфа',1000000);
insert into musician(name, information, listeners_per_mouth) values ('группа 2','какая-то инфа2',2000000);
insert into musician(name, information, listeners_per_mouth) values ('the smiths','какая-то инфа',3000000);
insert into musician(name, information, listeners_per_mouth) values ('я','какая-то инфа',70);
insert into musician(name, information, listeners_per_mouth) values ('Alex G','какая-то инфа',5000000);
insert into releases (name, artist_id, release_date, genre, release_type)
values ('релиз1', 1, '2023-01-01','alternative','EP');
insert into releases (name, artist_id, release_date, genre, release_type)
values ('релиз2', 2, '2022-03-01','rap','single');
insert into releases (name, artist_id, release_date, genre, release_type)
values ('queen is dead', 3, '1986-03-01','indie-rock','album');
insert into releases (name, artist_id, release_date, genre, release_type)
values ('лист', 4, '2022-11-05','indie','single');
insert into releases (name, artist_id, release_date, genre, release_type)
values ('rocket', 5, '2017-09-01','indie','album');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('track 1', 200, 1, 1, 'blah blah blah');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('track 1', 230, 1, 2, 'blah blah blah');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('light that never goes out', 400, 1, 3, 'blah blah blah');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('лист', 200, 1, 4, 'blah blah blah');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('rocket', 200, 1, 5, 'blah blah blah');
insert into tracks (name, duration, track_number, release_id, lyrics)
values ('bobby', 200, 2, 5, 'blah blah blah');



