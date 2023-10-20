select * from flights where arrival_city_id = 5;
select * from aircrafts order by maximum_flight_range;
select name, model from aircrafts order by last_service_date DESC LIMIT 2;
select country, count(name) from cities group by country;
