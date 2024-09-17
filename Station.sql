DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


CREATE TABLE station(
  id serial primary key,
  name varchar(255) NOT NULL,
  isOpen boolean,
  zone int NOT NULL
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
  travel_time int NOT NULL,
  Primary key(station_id_1, station_id_2, line_id)
);


INSERT INTO line (color) VALUES('Brown');

INSERT INTO station (name, isOpen, zone) VALUES
('Harrow & Wealdstone', true, 5),
('Kenton', true, 4),
('South Kenton', true, 4),
('North Wembley', true, 4),
('Wembley Central', true, 4),
('Stonebridge Park', true, 3),
('Harlesden', true, 3),
('Willesden Junction', true, 3),
('Kensal Green', true, 2),
('Queens Park', true, 2),
('Kilburn Park', true, 2),
('Maida Vale', true, 2),
('Warwick Avenue', true, 2),
('Paddington', true, 1),
('Edgeware Road', true, 1),
('Marylebone', true, 1),
('Baker Street', true, 1),
('Regents Park', true, 1),
('Oxford Circus', true, 1),
('Piccadilly Circus', true, 1),
('Charing Cross', true, 1),
('Embankment', true, 1),
('Waterloo', true, 1),
('Lambeth North', true, 1),
('Elephant and Castle', true, 1);

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

INSERT INTO neighbor(station_id_1, station_id_2, line_id, travel_time) VALUES
(1, 2, 1, 5),
(2, 3, 1, 3),
(3, 4, 1, 5),
(4, 5, 1, 2),
(5, 6, 1, 7),
(6, 7, 1, 10),
(7, 8, 1, 12),
(8, 9, 1, 3),
(9, 10, 1, 7),
(10, 11, 1, 9),
(11, 12, 1, 1),
(12, 13, 1, 4),
(13, 14, 1, 8),
(14, 15, 1, 11),
(15, 16, 1, 15),
(16, 17, 1, 12),
(17, 18, 1, 12),
(18, 19, 1, 1),
(19, 20, 1, 14),
(20, 21, 1, 23),
(21, 22, 1, 5),
(22, 23, 1, 7),
(23, 24, 1, 6),
(24, 25, 1, 2);