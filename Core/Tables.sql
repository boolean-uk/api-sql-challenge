create table line (
	id serial primary key,
	name varchar(50) not null,
	unique(id, name)
);

create table station (
	id serial primary key,
	name varchar(50) not null,
	isClosed boolean not null,
	unique(id, name)
);

create table service (
	id serial primary key,
	name varchar(50) not null,
	unique(id, name)
);

create table stationService (
	id serial primary key,
	station_fk integer references station(id),
	service_fk integer references service(id),
	unique(id, station_fk, service_fk)
);

insert into line
(name)
values
('Bakerloo');

insert into station
(name, isClosed)
values
('Harrow & Wealdstone', false),  
('Kenton', false),
('South Kenton', false),
('North Wembley', false),
('Wembley Central', false),
('Stonebridge Park', false),
('Harlesden', false),
('Willesden Junction', false),
('Kensel Green', false),
('Queens Park', false),
('Kilburn Park', false),
('Maida Vale', false),
('Warwick Avenue', false),
('Paddington', false),
('Edgeware Road', false),
('Marylebone', false),
('Baker Street', false),
('Regents Park', false),
('Oxford Circus', false),
('Piccadilly Circus', false),
('Charing Cross', false),
('Embankment', false),
('Waterloo', false),
('Lambeth North', false),  
('Elephant and Castle', false);

insert into service
(name)
values
('Network Rail');

insert into stationService
(station_fk, service_fk)
values
(1, 1),
(5, 1),
(8, 1),
(10, 1),
(14, 1),
(16, 1),
(21, 1),
(25,1);

--Extensions
alter table station add column zone integer;

update station set zone = 1 where id between 14 and 25;
update station set zone = 2 where id between 8 and 13;
update station set zone = 3 where id between 6 and 7;
update station set zone = 4 where id between 2 and 5;
update station set zone = 5 where id = 1;

create table travelTime (
	id serial primary key,
	start_station_fk integer references station(id),
	end_station_fk integer references station(id),
	travel_time integer not null,
	unique(id, start_station_fk, end_station_fk)
);

insert into travelTime
(start_station_fk, end_station_fk, travel_time)
values
(1, 2, 2),
(2, 3, 2),
(3, 4, 2),
(4, 5, 2),
(5, 6, 2),
(6, 7, 3),
(7, 8, 2),
(8, 9, 3),
(9, 10, 3),
(10, 11, 3),
(11, 12, 2),
(12, 13, 2),
(13, 14, 2),
(14, 15, 2),
(15, 16, 1),
(16, 17, 1),
(17, 18, 2),
(18, 19, 2),
(19, 20, 2),
(20, 21, 2),
(21, 22, 1),
(22, 23, 1),
(23, 24, 2),
(24, 25, 2);