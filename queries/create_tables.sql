
CREATE TABLE zones(
	id serial PRIMARY KEY, 
	name VARCHAR(128)
);


CREATE TABLE stations(
	id serial PRIMARY KEY,
	open_status boolean,
	name VARCHAR(128),
	zone_id int,
	CONSTRAINT fk_zone_id FOREIGN KEY (zone_id) REFERENCES zones(id),
	UNIQUE(name)
);


CREATE TABLE lines(
	id serial PRIMARY KEY, 
	expected_duration time,
	station_id int,
	a_linked_station int,
	b_linked_station int
);

CREATE TABLE platforms(
	line_id int,
	station_id int,
	CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines(id)
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id)
);

CREATE TABLE services(
	id serial PRIMARY KEY, 
	name varchar(128)
);


CREATE TABLE station_services(
	service_id int,
	station_id int,
	CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES services(id)
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id)
);
