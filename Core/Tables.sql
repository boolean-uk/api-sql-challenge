create table lines (
	id serial primary key,
	name varchar(50) not null,
	unique(id, name)
);

create table stations (
	id serial primary key,
	name varchar(50) not null,
	isClosed boolean not null,
	unique(id, name)
);

create table services (
	id serial primary key,
	station_fk integer references stations(id),
	line_fk integer references lines(id),
	connectsToTrain boolean not null,
	unique(id)
);

insert into lines
(name)
values
('Bakerloo');

insert into stations
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

insert into services
(station_fk, line_fk, connectsToTrain)
values
(1, 1, true),
(2, 1, false),
(3, 1, false),
(4, 1, false),
(5, 1, true),
(6, 1, false),
(7, 1, false),
(8, 1, true),
(9, 1, false),
(10, 1, true),
(11, 1, false),
(12, 1, false),
(13, 1, false),
(14, 1, true),
(15, 1, false),
(16, 1, true),
(17, 1, false),
(18, 1, false),
(19, 1, false),
(20, 1, false),
(21, 1, true),
(22, 1, false),
(23, 1, true),
(24, 1, false),
(25, 1, true);

