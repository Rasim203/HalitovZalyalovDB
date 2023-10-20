select * from tracks where release_id = 5 order by track_number limit 4;
select release_id, count(*) as track_count from tracks group by release_id;