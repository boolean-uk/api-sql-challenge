



CREATE FUNCTION zonify_station(_station_id int)
RETURNS VARCHAR(128)
LANGUAGE plpgsql
AS
$$
DECLARE
   _service_name varchar(128);
BEGIN
   SELECT CONCAT(s.station_name,' (' ,z.zone_name,')')
   INTO _service_name 
   FROM stations s
   join zones z on (z.id = s.zone_id)
   WHERE (_station_id= s.id);
   
   

   return _service_name;
END;
$$;
--drop function zonify_station;

select zonify_station(2);