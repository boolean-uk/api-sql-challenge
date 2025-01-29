
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
	start_station int,
	end_station int,
	CONSTRAINT fk_start_station FOREIGN KEY (start_station) REFERENCES stations(id),
	CONSTRAINT fk_end_station FOREIGN KEY (end_station) REFERENCES stations(id)
);

CREATE TABLE connectingLines(
	duration time,
	station_id int,
	connecting_station_id int,
	line_id int,
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id),
	CONSTRAINT fk_connecting_station_id FOREIGN KEY (connecting_station_id) REFERENCES stations(id),
	CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines(id)
);

CREATE TABLE connections(
	station_id int,	
	connected_station_id int,
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id),
	CONSTRAINT fk_connected_station_id FOREIGN KEY (connected_station_id) REFERENCES stations(id),
	CONSTRAINT check_identical_station_ids CHECK (station_id != connected_station_id)
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
