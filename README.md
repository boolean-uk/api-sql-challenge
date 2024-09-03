# SQL Challenge

## Learning Objectives

- SQL Language
- SQL Functions

## Instructions

To create a Database for the London Underground, starting with the Bakerloo line. The table should store information about the stations on the line and all of the services that they offer.

## Core Criteria

![](bakerloo_line.png "Bakerloo Line")

Design a suitable table structure that include Line, Station, Services tables. If you would like to include anything else you are free to do so. Also ensure that your design:

- deals with station closures
- shows what other services are available at the station and allow for possible future services. e.g. Paddington now offers the new 'Elizabeth Line' as well as 'Network Rail' services

Write sql queries to:

- Create tables Line, Station, Services
- Insert into tables Line, Station, Services
- Set Maida Vale Station as closed
- Select all open stations
- Select stations from Marylebone to Piccadilly Circus that are closed
- Select stations Elephant & Castle to Harrow & Wealdstone that have 'Network Rail' services (see the stations with the train in the image)
- Select stations from Lambeth North to Kensal Green

| Id  | StationName           |
| --- | --------------------- |
| 1   | Harrow & Wealdstone   |
| 2   | "Kenton"              |
| 3   | "South Kenton"        |
| 4   | "North Wembley"       |
| 5   | "Wembley Central"     |
| 6   | "Stonebridge Park"    |
| 7   | "Harlesden"           |
| 8   | "Willesden Junction"  |
| 9   | "Kensel Green"        |
| 10  | "Queens Park"         |
| 11  | "Kilburn Park"        |
| 12  | "Maida Vale"          |
| 13  | "Warwick Avenue"      |
| 14  | "Paddington"          |
| 15  | "Edgeware Road"       |
| 16  | "Marylebone"          |
| 17  | "Baker Street"        |
| 18  | "Regents Park"        |
| 19  | "Oxford Circus"       |
| 20  | "Piccadilly Circus"   |
| 21  | "Charing Cross"       |
| 22  | "Embankment"          |
| 23  | "Waterloo"            |
| 24  | "Lambeth North"       |
| 25  | "Elephant and Castle" |

## Extension Criteria #1 - Zones

Include Zones in your database design.

- Write a [Postgres Function](https://www.postgresql.org/docs/current/sql-createfunction.html) to append the Zone to the Name e.g.

  | Start               | End                  |
  | ------------------- | -------------------- |
  | Marylebone (Zone 1) | Northfields (Zone 3) |

NOTE: do not write the Zone into the name of the station column!

![](zone_one.png "Bakerloo Line Zone 1")

## Extension Criteria #2 - Journey Times

![](bakerloo_times.png "Bakerloo Line Times")

Update your design and write a [Postgres Function](https://www.postgresql.org/docs/current/sql-createfunction.html) that when passed two station ID's it calculates the time between the stations

Write a query to get the start and end stations with a journey time column
| Start | End | Journey Time |
| --- | --------------- | --- |
| Marylebone | Baker Street | 57 minutes |

## Super Extension Criteria #3

- Add the Picadilly line to your database design
- Write a query to show my old commute from Marylebone to Northfields making sure your function can deal with another line. e.g.

| Start      | End         | Journey Time |
| ---------- | ----------- | ------------ |
| Marylebone | Northfields | 57 minutes   |
