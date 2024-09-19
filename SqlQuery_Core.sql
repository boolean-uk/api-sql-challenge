--Set Maida Vale Station as Closed
UPDATE Station
SET is_closed = TRUE
WHERE station_name = 'Maida Vale';

--Select All Open Stations
SELECT station_id, station_name
FROM Station
WHERE is_closed = FALSE
ORDER BY station_id;

--Select Closed Stations from Marylebone to Piccadilly Circus
SELECT s.station_id, s.station_name
FROM Station s
JOIN Line_Station ls ON s.station_id = ls.station_id
WHERE ls.line_id = 1
  AND ls.station_order BETWEEN
    (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Marylebone'))
    AND
    (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Piccadilly Circus'))
  AND s.is_closed = TRUE
ORDER BY ls.station_order;

--Select Stations from Elephant & Castle to Harrow & Wealdstone with 'Network Rail' Service
SELECT s.station_id, s.station_name
FROM Station s
JOIN Line_Station ls ON s.station_id = ls.station_id
JOIN Station_Service ss ON s.station_id = ss.station_id
JOIN Services srv ON ss.service_id = srv.service_id
WHERE ls.line_id = 1
  AND ls.station_order BETWEEN
    (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Harrow & Wealdstone'))
    AND
    (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Elephant & Castle'))
  AND srv.service_name = 'Network Rail'
ORDER BY ls.station_order;


--Select Stations from Lambeth North to Kensal Green
SELECT s.station_id, s.station_name
FROM Station s
JOIN Line_Station ls ON s.station_id = ls.station_id
WHERE ls.line_id = 1
  AND ls.station_order BETWEEN
    (SELECT LEAST(
        (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Lambeth North')),
        (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Kensal Green'))
      ))
    AND
    (SELECT GREATEST(
        (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Lambeth North')),
        (SELECT station_order FROM Line_Station WHERE line_id = 1 AND station_id = (SELECT station_id FROM Station WHERE station_name = 'Kensal Green'))
      ))
ORDER BY ls.station_order;



