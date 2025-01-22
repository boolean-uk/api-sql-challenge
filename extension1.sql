CREATE TABLE zones(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40)
);

INSERT INTO zones(name)
VALUES
    ('Zone 1'),
    ('Zone 2'),
    ('Zone 3');

ALTER TABLE stations
    ADD COLUMN zone_id INTEGER,
    ADD CONSTRAINT fk_zone FOREIGN KEY (zone_id) REFERENCES zones(id);

    UPDATE stations
SET zone_id = 1

UPDATE stations
SET zone_id = 2
WHERE id <= 13


CREATE FUNCTION withzone(start_text VARCHAR(40))
RETURNS VARCHAR(86)
LANGUAGE plpgsql
AS $$
DECLARE
  zone_name VARCHAR(46);
  zone_idd INT;
BEGIN
	SELECT zone_id INTO zone_idd
  FROM stations
  WHERE name = start_text;
  
  SELECT name INTO zone_name
  FROM zones
  WHERE id = zone_idd;

  RETURN CONCAT(start_text, CONCAT(CONCAT(' (',zone_name)),')');
END;
$$;