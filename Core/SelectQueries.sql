/* Select all open stations */
SELECT 
	* 
FROM 
	Stations 
WHERE 
	Stations.IsClosed = FALSE;

/* Select stations from Marylebone to Piccadilly Circus that are closed */
SELECT 
	* 
FROM 
	Stations
WHERE 
	Stations.IsClosed = TRUE 
AND 
	Stations.ID BETWEEN 16 AND 20;

/* Select stations Elephant & Castle to Harrow & Wealdstone that have 'Network Rail' services (see the stations with the train in the image) */
SELECT 
  Stations.Name 
FROM 
  Stations
JOIN StationService ON Stations.ID = StationService.StationID
JOIN Services ON StationService.ID = Services.ID
WHERE 
  Stations.ID BETWEEN 1 AND 25 
AND 
  Services.Name = 'Network Rail';



/* Select stations from Lambeth North to Kensal Green */
SELECT 
  * 
FROM 
	Stations
WHERE 
  Stations.ID BETWEEN 9 AND 24;