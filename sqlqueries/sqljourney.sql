#removing null values 
DELETE FROM migrantdata where Region_of_Origin IS NULL;
DELETE FROM migrantdata where Country_of_Origin IS NULL;
DELETE FROM migrantdata where Number_of_Dead IS NULL;
DELETE FROM migrantdata where Migration_route IS NULL;
DELETE FROM migrantdata where Information_Source IS NULL;
DELETE FROM migrantdata where Coordinates IS NULL;