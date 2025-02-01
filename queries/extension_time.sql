

-- NOTE: This was a nightmare to write. 
-- 		 Its a function that recursively loop through the stations starting from the first one
-- 		 It returns a table with one entry, containing the summarized durartion and the start + end station names...

CREATE FUNCTION time_station(_from int, _to int)
RETURNS table(from_station_name varchar, to_station_name varchar, duration bigint)
LANGUAGE plpgsql
AS
$$
DECLARE
   _service_name varchar(128);
   _smallerFirst int;
   _largerLast int;
   _bigIntZero bigint := 0 ;
BEGIN
		
		_largerLast = _to;
		_smallerFirst = _from;
		IF _from > _to THEN
		_smallerFirst = _to;
		_largerLast = _from;
		END IF;
		
		-- If start == end, then handle edge case
		IF _from = _to THEN
		RETURN Query
			select 
				(select station_name from stations s where _from = s.id) as "Start",
				(select station_name from stations s where _to = s.id) as "End",
				 _bigIntZero as "Duration"
				 limit 1;
		ELSE 
		
		
		   -- Select stations from Marylebone to Piccadilly Circus that are closed
		    RETURN QUERY
			WITH RECURSIVE res AS (
				-- Non-recursive part
				
				-- Find first station to be included, 
				SELECT s.id, c.connected_station_id , s.station_name
				FROM   stations s 
				JOIN   connecting_lines cl ON (cl.station_id= s.id)
				JOIN   connections c ON (c.station_id= s.id)
				WHERE  s.id = _smallerFirst
					AND cl.line_id = 1
				
				UNION
				-- Recursie part 
				
				SELECT s.id, c.connected_station_id , s.station_name
				FROM   stations s 
				JOIN   connecting_lines cl ON (cl.station_id= s.id)
				JOIN   connections c ON (c.station_id= s.id) 
				join   res r on r.connected_station_id = s.id
				WHERE  s.id != _largerLast
					AND cl.line_id = 1
			
			)
			select -- Should be a better way to do this?...
				(select station_name from stations s where _from = s.id) as "Start",
				(select station_name from stations s where _to = s.id) as "End",
				(select sum (dur) from (SELECT res.station_name, s.station_name, cl.duration_min as "dur"  FROM res
											join stations s on res.connected_station_id = s.id
											JOIN   connecting_lines cl ON (cl.connecting_station_id = s.id))) as "Duration"
	
			; -- Note, while we could do this much simpler by comparing the ids, that will not work when more lines are added... So I experimented with recursive traversal...
		END IF; 
END;
$$;
--drop function time_station;

select *  from  time_station(1,6);












