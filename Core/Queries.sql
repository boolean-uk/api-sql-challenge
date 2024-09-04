--Set Maida Vale station as closed
update stations set isClosed = true where name = 'Maida Vale';

--Select all stations that are open
select * from stations where isClosed = false;