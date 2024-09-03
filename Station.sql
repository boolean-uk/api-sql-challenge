DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


CREATE TABLE station(
  id serial primary key,
  name varchar(255) NOT NULL,
  isOpen boolean
);



CREATE TABLE line(
  id serial primary key,
  color varchar(255) NOT null
);


CREATE TABLE services(
 id serial primary key,
 station_id int references station(id),
 line_id int references line(id),
 hasTrainStation boolean
);


CREATE TABLE neighbor(
  station_id_1 int references station(id),
  station_id_2 int references station(id),
  line_id int references line(id),
  Primary key(station_id_1, station_id_2, line_id)
);


INSERT INTO line (color) VALUES('Brown');

INSERT INTO station (name, isOpen) VALUES
('Harrow & Wealdstone', true),
('Kenton', true),
('South Kenton', true),
('North Wembley', true),
('Wembley Central', true),
('Stonebridge Park', true),
('Harlesden', true),
('Willesden Junction', true),
('Kensal Green', true),
('Queens Park', true),
('Kilburn Park', true),
('Maida Vale', true),
('Warwick Avenue', true),
('Paddington', true),
('Edgeware Road', true),
('Marylebone', true),
('Baker Street', true),
('Regents Park', true),
('Oxford Circus', true),
('Piccadilly Circus', true),
('Charing Cross', true),
('Embankment', true),
('Waterloo', true),
('Lambeth North', true),
('Elephant and Castle', true);

INSERT INTO services (station_id, line_id, hasTrainStation) VALUES
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

INSERT INTO neighbor(station_id_1, station_id_2, line_id) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 1),
(18, 19, 1),
(19, 20, 1),
(20, 21, 1),
(21, 22, 1),
(22, 23, 1),
(23, 24, 1),
(24, 25, 1);