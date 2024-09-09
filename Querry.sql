SELECT * FROM station WHERE isOpen = true;
SELECT * FROM station;

UPDATE station SET isOpen = false WHERE id = 12;

SELECT * FROM station WHERE isOpen = false;

SELECT * FROM station WHERE isOpen = true;


SELECT name, (SELECT name FROM station WHERE id = neighbor.station_id_2) FROM station LEFT JOIN neighbor on station.id = neighbor.station_id_1;


SELECT name FROM station JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND 
    neighbor.station_id_2 > (SELECT id FROM station WHERE name='Kensal Green') AND neighbor.station_id_1 <= (SELECT ID FROM station WHERE name='Lambeth North');
  

SELECT name FROM station JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND 
    neighbor.station_id_2 > (SELECT id FROM station WHERE name='Wembley Central') AND neighbor.station_id_1 <= (SELECT ID FROM station WHERE name='Oxford Circus');


UPDATE station SET isOpen = false WHERE name = 'Baker Street';


SELECT name FROM station JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND neighbor.station_id_2 > (SELECT id FROM station WHERE name='Marylebone') AND neighbor.station_id_1 <= (SELECT ID from station WHERE name ='Piccadilly Circus') AND isOpen = false;

SELECT *
  FROM station 
    JOIN neighbor on station.id = neighbor.station_id_1
    JOIN services on station.id = services.station_id
      WHERE station.id = neighbor.station_id_1 AND 
        neighbor.station_id_2 > (SELECT id FROM station WHERE name='Harrow & Wealdstone') AND 
        neighbor.station_id_1 <= (SELECT ID from station WHERE name ='Elephant and Castle') AND 
        services.station_id = station.id AND
        services.hasTrainStation = true;

--SELECT * FROM station LEFT JOIN neighbor on station.id = neighbor.station_id_2;


SELECT * FROM neighbor;

SELECT s1.name AS Start, s2.name AS End, SUM(travel_time) AS Journey_Time FROM station 
	JOIN neighbor n1 on station.id = n1.station_id_1 
  JOIN station s1 on s1.name = 'Oxford Circus'
  JOIN station s2 on s2.name = 'Waterloo'
  WHERE station.id = n1.station_id_1 AND 
    n1.station_id_2 > s1.id AND n1.station_id_1 <= s2.id
    GROUP BY s1.name, s2.name;
 
SELECT CONCAT(s1.name, ' (Zone ', s1.zone, ')') AS Start, CONCAT(s2.name, ' (Zone ', s2.zone, ')') AS End FROM station 
	JOIN neighbor n1 on station.id = n1.station_id_1 
  JOIN station s1 on s1.name = 'Harrow & Wealdstone'
  JOIN station s2 on s2.name = 'Waterloo'
  WHERE station.id = n1.station_id_1 AND 
    n1.station_id_2 > s1.id AND n1.station_id_1 <= s2.id
    LIMIT 1;
    