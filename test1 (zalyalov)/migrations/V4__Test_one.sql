create table aircrafts
(
    id                   bigserial primary key,
    name                 varchar(100) NOT NULL UNIQUE,
    model                varchar(100) NOT NULL,
    last_service_date    date         NOT NULL CHECK (last_service_date < current_date),
    seating_capacity     smallint CHECK (seating_capacity > 0),
    maximum_flight_range smallint CHECK (maximum_flight_range > 0)
);

create table cities
(
    id      bigserial primary key,
    name    varchar(100) NOT NULL UNIQUE,
    country varchar(100) NOT NULL
);

create table flights
(
    id                  bigserial primary key,
    aircraft_id         bigint references aircrafts (id),
    departure_city_id   bigint references cities (id),
    departure_timestamp timestamp NOT NULL,
    arrival_city_id     bigint references cities (id),
    arrival_timestamp   timestamp NOT NULL
);

insert into cities (name, country)
values ('Kazan', 'Russia'),
       ('Moscow', 'Russia'),
       ('Saint-Petersburg', 'Russia'),
       ('London', 'United Kingdom'),
       ('Beijing', 'China');

insert into aircrafts (name, model, last_service_date, seating_capacity, maximum_flight_range)
values ('RA-00001', 'Boeing 737', '2022-01-01', 189, 4200),
       ('RA-73894', 'Airbus A320', '2018-09-05', 200, 4300),
       ('RA-54308', 'Boeing 747', '2019-04-30', 188, 4200),
       ('RA-67809', 'Airbus A321', '2017-02-15', 190, 4250),
       ('RA-71107', 'Airbus A350', '2023-05-24', 292, 12400);

insert into flights (aircraft_id, departure_city_id, departure_timestamp, arrival_city_id, arrival_timestamp)
values (1, 1, '2023-10-20 09:40:00', 2, '2023-10-20 11:00:00'),
       (2, 3, '2023-10-18 12:10:00', 5, '2023-10-18 18:00:00'),
       (3, 4, '2023-10-16 08:15:00', 5, '2023-10-16 18:10:00'),
       (4, 1, '2023-09-01 06:15:00', 4, '2023-09-01 10:24:00'),
       (5, 2, '2023-10-25 14:10:00', 3, '2023-10-25 16:10:00');
