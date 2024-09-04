-- Select all open stations
SELECT *
FROM stations
WHERE status = true

-- Select stations from Marylebone to Piccadilly Circus that are closed
SELECT *
FROM stations
WHERE id > 16 AND id < 20 AND status = false

-- Select stations Elephant & Castle to Harrow & Wealdstone that have 'Network Rail' services (see the stations with the train in the image)
SELECT s.name, sc.service
FROM stations s
LEFT JOIN services sc ON s.id = sc.stationid
WHERE sc.service = 'Network Rail'

-- Select stations from Lambeth North to Kensal Green
SELECT name
FROM stations
WHERE id <= 24 AND id >= 9
