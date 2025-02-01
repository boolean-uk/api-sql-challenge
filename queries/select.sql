-- Select all open stations

Select * FROM stations s WHERE s.open_status = TRUE;



-- Select stations from Marylebone to Piccadilly Circus that are closed
WITH RECURSIVE res AS (
	-- Non-recursive part
	
	-- Find first station to be included, 
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.station_id= s.id)
	JOIN   connections c ON (c.station_id= s.id)
	WHERE  s.station_name = 'Marylebone'  
		AND cl.line_id = 1
	
	UNION
	-- Recursie part 
	
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.station_id= s.id)
	JOIN   connections c ON (c.station_id= s.id) 
	join   res r on r.connected_station_id = s.id
	WHERE  s.station_name != 'Piccadilly Circus' -- continue while stationname isn't 'Piccadilly Circus'
		AND cl.line_id = 1
	
	) 
	SELECT * FROM res
	join stations s on res.connected_station_id = s.id
	WHERE s.open_status = FALSE 
	
	; -- Note, while we could do this much simpler by comparing the ids, that will not work when more lines are added... So I experimented with recursive traversal...
	
	

-- Select stations Elephant & Castle to Harrow & Wealdstone that have 'Network Rail' services (see the stations with the train in the image)
WITH RECURSIVE res AS (
	-- Non-recursive part
	
	-- Find first station to be included, 
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.connecting_station_id = s.id)
	JOIN   connections c ON (c.connected_station_id= s.id)
	WHERE  s.station_name = 'Elephant and Castle'  
		AND cl.line_id = 1
	
	UNION
	-- Recursie part 
	
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.station_id= s.id) 
	JOIN   connections c ON (c.connected_station_id= s.id)  
	join   res r on r.connected_station_id = connecting_station_id
	WHERE  s.station_name != 'Harrow & Wealdstone' -- continue while stationname isn't 'Piccadilly Circus'
		AND cl.line_id = 1
	
	) 
	SELECT * FROM res
	join stations s on res.connected_station_id = s.id
	join station_services st on res.connected_station_id = st.station_id
	join services serv on st.service_id = serv.id
	WHERE serv.service_name = 'National Rail'
	
	; -- Note; National Rail Seems to be identical to Network Rail...




-- Select stations from Lambeth North to Kensal Green

WITH RECURSIVE res AS (
	-- Non-recursive part
	
	-- Find first station to be included, 
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.connecting_station_id = s.id)
	JOIN   connections c ON (c.connected_station_id= s.id)
	WHERE  s.station_name = 'Lambeth North'  
		AND cl.line_id = 1
	
	UNION
	-- Recursie part 
	
	SELECT s.id, c.connected_station_id 
	FROM   stations s 
	JOIN   connecting_lines cl ON (cl.station_id= s.id) 
	JOIN   connections c ON (c.connected_station_id= s.id)  
	join   res r on r.connected_station_id = connecting_station_id
	WHERE  s.station_name != 'Kensal Green' -- continue while stationname isn't 'Piccadilly Circus'
		AND cl.line_id = 1
	
	) 
	SELECT * FROM res
	join stations s on res.connected_station_id = s.id
	; 
