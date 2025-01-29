


INSERT INTO zones
(zone_name)
VALUES
("Zone 1"),
("Zone 2")
;



INSERT INTO stations
(open_status, station_name, zone_id)
VALUES
(TRUE,	"Harrow & Wealdstone", 2), -- id 1
(TRUE,	"Kenton"             , 2),
(TRUE,	"South Kenton"       , 2),
(TRUE,	"North Wembley"      , 2),
(TRUE,	"Wembley Central"    , 2),
(TRUE,	"Stonebridge Park"   , 2),
(TRUE,	"Harlesden"          , 2),
(TRUE,	"Willesden Junction" , 2),
(TRUE,	"Kensel Green"       , 2),
(TRUE,	"Queens Park"        , 2),
(TRUE,	"Kilburn Park"       , 2),
(TRUE,	"Maida Vale"         , 2),
(TRUE,	"Warwick Avenue"     , 2),
(TRUE,	"Paddington"         , 1),
(TRUE,	"Edgeware Road"      , 1),
(TRUE,	"Marylebone"         , 1),
(TRUE,	"Baker Street"       , 1),
(TRUE,	"Regents Park"       , 1),
(TRUE,	"Oxford Circus"      , 1),
(TRUE,	"Piccadilly Circus"  , 1),
(TRUE,	"Charing Cross"      , 1),
(TRUE,	"Embankment"         , 1),
(TRUE,	"Waterloo"           , 1),
(TRUE,	"Lambeth North"      , 1),
(TRUE,	"Elephant and Castle", 1) -- id 25
;


INSERT INTO lines
(start_station, end_station)
VALUES
(1, 25) -- id 1
;

INSERT INTO connections
(station_id, connected_station_id)
VALUES
(1,  2  ),
(2,  3  ),
(3,  4  ),
(4,  5  ),
(5,  6  ),
(6,  7  ),
(7,  8  ),
(8,  9  ),
(9,   10 ),
(10,  11  ),
(11,  12  ),
(12,  13  ),
(13,  14  ),
(14,  15  ),
(15,  16  ),
(16,  17  ),
(17,  18  ),
(18,  19  ),
(19,  20  ),
(20,  21  ),
(21,  22  ),
(22,  23  ),
(23,  24  ),
(24,  25  )
;

INSERT INTO connecting_lines
(duration, line_id, station_id, connecting_station_id)
VALUES
(15, 1, 1,  2  ),
(15, 1, 2,  3  ),
(15, 1, 3,  4  ),
(15, 1, 4,  5  ),
(15, 1, 5,  6  ),
(15, 1, 6,  7  ),
(15, 1, 7,  8  ),
(15, 1, 8,  9  ),
(15, 1, 9,   10 ),
(15, 1, 10,  11  ),
(15, 1, 11,  12  ),
(15, 1, 12,  13  ),
(15, 1, 13,  14  ),
(15, 1, 14,  15  ),
(15, 1, 15,  16  ),
(15, 1, 16,  17  ),
(15, 1, 17,  18  ),
(15, 1, 18,  19  ),
(15, 1, 19,  20  ),
(15, 1, 20,  21  ),
(15, 1, 21,  22  ),
(15, 1, 22,  23  ),
(15, 1, 23,  24  ),
(15, 1, 24,  25  )
-- (15, 1, 25,  25  ) -- id 1
;


INSERT INTO services
(service_name, line_id)
VALUES
("Elizabeth Line"), -- 1
("National Rail")--("Network Rail")    -- 2
("London Underground")    -- 4
("London Overground")    -- 5
("Docklands Light Railway (DLR)")    -- 6
("Tramlink")    -- 7
("London River Services (River)")    -- 8
("London Buses")    -- 9
;




INSERT INTO station_services
(service_id, station_id)
VALUES
(1   ,1),   -- "Harrow & Wealdstone"
(2   ,1),   -- "Harrow & Wealdstone"
(1   ,2), -- "Kenton"             
(1   ,3), -- "South Kenton"       
(1   ,4), -- "North Wembley"      
(1   ,5), -- "Wembley Central"    
(2   ,5), -- "Wembley Central"    
(1   ,6), -- "Stonebridge Park"   
(1   ,7), -- "Harlesden"          
(1   ,8), -- "Willesden Junction" 
(1   ,9), -- "Kensel Green"       
(1   ,10), -- "Queens Park"        
(2   ,10), -- "Queens Park"        
(4   ,11), -- "Kilburn Park"    -- No defined Service   
(4   ,12), -- "Maida Vale"      -- No defined Service   
(4   ,13), -- "Warwick Avenue"  -- No defined Service   
(1   ,14), -- "Paddington"         
(2   ,14), -- "Paddington"         
--(   ,15), -- "Edgeware Road"    -- No defined Service  
(2   ,16), -- "Marylebone"         
(   ,17), -- "Baker Street"       
(   ,18), -- "Regents Park"       
(   ,19), -- "Oxford Circus"      
(   ,20), -- "Piccadilly Circus"  
(   ,21), -- "Charing Cross"      
(   ,22), -- "Embankment"         
(   ,23), -- "Waterloo"           
(   ,24), -- "Lambeth North"      
(   ,25) -- "Elephant and Castle",
;
