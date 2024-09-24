/* Set Maida Vale Station as closed */
UPDATE 
	Stations 
SET 
	Stations.IsClosed = TRUE 
WHERE 
	Name = 'Maida Vale';