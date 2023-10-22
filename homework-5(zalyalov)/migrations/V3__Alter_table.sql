alter table artists alter column date_of_birth set not null;
alter table artists alter column country set not null;
alter table artists add constraint uni unique (first_name, last_name, date_of_birth, country);

alter table galleries alter column address set not null;

alter table exhibitions alter column name set not null;
alter table exhibitions alter column gallery_id set not null;

alter table pictures alter column name set not null;
alter table pictures alter column publishing_date set not null;
