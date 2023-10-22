alter table visitors add column birth_date date;
alter table visitors add column profession varchar(50);
alter table visitors add column nationality varchar(50);
alter table visitors add column email varchar(50);

alter table visitors alter column patronymic set not null;
alter table visitors add constraint phone_uni unique (phone_number);
alter table visitors alter column birth_date set not null;
alter table visitors alter column nationality set not null;
alter table visitors add constraint email_uni unique (email);

