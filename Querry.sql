SELECT * FROM station WHERE isOpen = true;


UPDATE station SET isOpen = false WHERE id = 12;

SELECT * FROM station WHERE isOpen = false;

SELECT * FROM station WHERE isOpen = true;


SELECT name, (SELECT name FROM station WHERE id = neighbor.station_id_2) FROM station LEFT JOIN neighbor on station.id = neighbor.station_id_1;


SELECT name FROM station RIGHT JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND 
    neighbor.station_id_2 > (SELECT id FROM station WHERE name='Kensal Green') AND neighbor.station_id_1 <= (SELECT ID FROM station WHERE name='Lambeth North');
  

SELECT name FROM station RIGHT JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND 
    neighbor.station_id_2 > (SELECT id FROM station WHERE name='Wembley Central') AND neighbor.station_id_1 <= (SELECT ID FROM station WHERE name='Oxford Circus');


UPDATE station SET isOpen = false WHERE name = 'Baker Street';


SELECT name FROM station RIGHT JOIN neighbor on station.id = neighbor.station_id_1 WHERE id = neighbor.station_id_1 AND neighbor.station_id_2 > (SELECT id FROM station WHERE name='Marylebone') AND neighbor.station_id_1 <= (SELECT ID from station WHERE name ='Piccadilly Circus') AND isOpen = false;

SELECT *
  FROM station 
    INNER JOIN neighbor on station.id = neighbor.station_id_1
    INNER JOIN services on station.id = services.station_id
      WHERE station.id = neighbor.station_id_1 AND 
        neighbor.station_id_2 > (SELECT id FROM station WHERE name='Harrow & Wealdstone') AND 
        neighbor.station_id_1 <= (SELECT ID from station WHERE name ='Elephant and Castle') AND 
        services.station_id = station.id AND
        services.hasTrainStation = true;

--SELECT * FROM station LEFT JOIN neighbor on station.id = neighbor.station_id_2;