
CREATE TABLE zones(
	id serial PRIMARY KEY, 
	zone_name VARCHAR(128) NOT NULL
);


CREATE TABLE stations(
	id serial PRIMARY KEY,
	open_status boolean NOT NULL,
	station_name VARCHAR(128) NOT NULL,
	zone_id int NOT NULL,
	CONSTRAINT fk_zone_id FOREIGN KEY (zone_id) REFERENCES zones(id),
	UNIQUE(station_name)
);

CREATE TABLE services(
	id serial PRIMARY KEY, 
	service_name VARCHAR(128) NOT NULL
);

CREATE TABLE lines(
	id serial PRIMARY KEY, 
	service_id int NOT NULL,
	start_station int NOT NULL,
	end_station int NOT NULL,
	CONSTRAINT fk_start_station FOREIGN KEY (start_station) REFERENCES stations(id),
	CONSTRAINT fk_end_station FOREIGN KEY (end_station) REFERENCES stations(id),
	CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES services(id)
);

CREATE TABLE connecting_lines(
	duration_min int NOT NULL,
	station_id int NOT NULL,
	connecting_station_id int NOT NULL,
	line_id int NOT NULL,
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id),
	CONSTRAINT fk_connecting_station_id FOREIGN KEY (connecting_station_id) REFERENCES stations(id),
	CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines(id)
);

CREATE TABLE connections(
	station_id int NOT NULL,	
	connected_station_id int NOT NULL,
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id),
	CONSTRAINT fk_connected_station_id FOREIGN KEY (connected_station_id) REFERENCES stations(id),
	CONSTRAINT check_identical_station_ids CHECK (station_id != connected_station_id)
);


CREATE TABLE station_services(
	service_id int NOT NULL,
	station_id int NOT NULL,
	CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES services(id),
	CONSTRAINT fk_station_id FOREIGN KEY (station_id) REFERENCES stations(id)
);
