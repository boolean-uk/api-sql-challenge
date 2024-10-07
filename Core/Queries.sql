--Set Maida Vale station as closed
update station set isClosed = true where name = 'Maida Vale';

--Select all stations that are open
select * from station 
where isClosed = false;

--Select stations from Marylebone to Piccadilly Circus that are closed
select * from station 
where id between 16 and 20 
and isClosed = true;

--Select stations from elephant & castle to harrow & wealdstone that have network rail services
select s.name from station s 
join stationService ss on s.id = ss.station_fk
join service sv on ss.service_fk = sv.id
where sv.name = 'Network Rail'
and s.id between 1 and 25;

--Select stations from Lambeth North to Kensal Green
select * from station
WHERE id between 9 and 24

--PostgreSQL function to append zone to name
create or replace function appendZoneToName(station_name varchar)
returns varchar as $$ 
declare
	result varchar;
begin
	select station_name || ' (Zone ' || s.zone || ')'
	into result
	from station s
	where s.name = station_name;
	
	return result;
end;
$$ language plpgsql;

select appendZoneToName('Harrow & Wealdstone') as Start, appendZoneToName('Elephant and Castle') as End;

--PostgreSQL function to calculate travel time
create or replace function calculateTravelTime(start_id integer, end_id integer)
returns integer as $$
declare
	total_time integer := 0;
	segment_time integer;
	current_id integer;
begin
	if start_id < end_id then
		current_id := start_id;
		while current_id < end_id loop
			select travel_time 
			into segment_time
			from travelTime
			where start_station_fk = current_id and end_station_fk = current_id + 1;
			total_time := total_time + segment_time;
			current_id := current_id + 1;
		end loop;
	else
		current_id := start_id;
		while current_id > end_id loop
			select travel_time
			into segment_time
			from travelTime
			where start_station_fk = current_id - 1 and end_station_fk = current_id;
			total_time := total_time + segment_time;
			current_id := current_id - 1;
		end loop;
	end if;
	return total_time;
end;
$$ language plpgsql;

select calculateTravelTime(1, 25) as JourneyTime;
select calculateTravelTime(25, 1) as JourneyTime;
select calculateTravelTime(6, 7) as JourneyTime;
select calculateTravelTime(7, 6) as JourneyTime;