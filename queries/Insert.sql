


INSERT INTO zones
(zone_name)
VALUES
("Zone 1")
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
(expected_duration_a_to_b, station_id, a_linked_station, b_linked_station)
VALUES
(15, 1, 1, 2),
(15, 2, 1, 3),
(15, 3, 2, 4),
(15, 4, 3, 5),
(15, 5, 4, 6),
(15, 6 , 5 ,   7 ),
(15, 7 , 6 ,   8 ),
(15, 8 , 7 ,   9  ),
(15, 9 , 8 ,   10 ),
(15, 10 , 9 ,  11 ),
(15, 11 , 10 , 12 ),
(15, 12 , 11 , 13 ),
(15, 13 , 12 , 14 ),
(15, 14 , 13 , 15 ),
(15, 15 , 14 , 16 ),
(15, 16 , 15 , 17 ),
(15, 17 , 16 , 18 ),
(15, 18 , 17 , 19 ),
(15, 19 , 18 , 20 ),
(15, 20 , 19 , 21 ),
(15, 21 , 20 , 22 ),
(15, 22 , 21 , 23 ),
(15, 23 , 22 , 24 ),
(15, 24 , 23 , 25 ),
(15, 25 , 24 , 25 ),
;

INSERT INTO platforms
(line_id, station_id)
VALUES
()
;

INSERT INTO services
(service_name, line_id)
VALUES
()
;


INSERT INTO station_services
(service_id, station_id)
VALUES
()
;

1   TRUE,	"Harrow & Wealdstone", 2
2   TRUE,	"Kenton"             , 2
3   TRUE,	"South Kenton"       , 2
4   TRUE,	"North Wembley"      , 2
5   TRUE,	"Wembley Central"    , 2
6   TRUE,	"Stonebridge Park"   , 2
7   TRUE,	"Harlesden"          , 2
8   TRUE,	"Willesden Junction" , 2
9   TRUE,	"Kensel Green"       , 2
10  TRUE,	"Queens Park"        , 2
11  TRUE,	"Kilburn Park"       , 2
12  TRUE,	"Maida Vale"         , 2
13  TRUE,	"Warwick Avenue"     , 2
14  TRUE,	"Paddington"         , 1
15  TRUE,	"Edgeware Road"      , 1
16  TRUE,	"Marylebone"         , 1
17  TRUE,	"Baker Street"       , 1
18  TRUE,	"Regents Park"       , 1
19  TRUE,	"Oxford Circus"      , 1
20  TRUE,	"Piccadilly Circus"  , 1
21  TRUE,	"Charing Cross"      , 1
22  TRUE,	"Embankment"         , 1
23  TRUE,	"Waterloo"           , 1
24  TRUE,	"Lambeth North"      , 1
25  TRUE,	"Elephant and Castle", 1