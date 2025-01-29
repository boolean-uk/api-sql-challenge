
CREATE TABLE zones(
	id serial PRIMARY KEY, 
	zone_name VARCHAR(128)
);


CREATE TABLE stations(
	id serial PRIMARY KEY,
	open_status boolean,
	station_name VARCHAR(128),
	zone_id int,
	CONSTRAINT fk_zone_id FOREIGN KEY (zone_id) REFERENCES zones(id),
	UNIQUE(station_name)
);


CREATE TABLE lines(
	id serial PRIMARY KEY, 
	expected_duration_a_to_b time,
	station_id int,
	a_linked_station int,
	b_linked_station int,
	CONSTRAINT fk_a_linked_station FOREIGN KEY (a_linked_station) REFERENCES stations(id),
	CONSTRAINT fk_b_linked_station FOREIGN KEY (b_linked_station) REFERENCES stations(id)
);

CREATE TABLE platforms(
	line_id int,
	station_id int,
	CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines(id),
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id)
);

CREATE TABLE services(
	id serial PRIMARY KEY, 
	service_name VARCHAR(128),
	line_id int,
	CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines(id)
);


CREATE TABLE station_services(
	service_id int,
	station_id int,
	CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES services(id),
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id)
);
