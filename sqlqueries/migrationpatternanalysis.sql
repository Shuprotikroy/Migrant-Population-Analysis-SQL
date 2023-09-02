#Total Numbers
SELECT Migration_route,SUM(Number_of_Dead) as Dead_Migrants,SUM(Number_of_Survivors) as Survivor_Migrants,SUM(Minimum_Estimated_Number_of_Missing) as Minimum_Missing_Migrants FROM globalmigrantsdb.migrantdata GROUP BY Migration_route;
SELECT Migration_route,SUM(Number_of_Males) as Total_Males,SUM(Number_of_Females) as Total_Females,SUM(Number_of_Children) as Total_Children FROM globalmigrantsdb.migrantdata GROUP BY Migration_route;
#Cause of Death
with codtable as (
SELECT Migration_route,Cause_of_Death,COUNT(Cause_of_Death) as count_no from migrantdata group by Migration_route,Cause_of_Death order by count_no desc)
SELECT Migration_route,Cause_of_Death,MAX(count_no) from codtable group by Migration_route;
#Average Numbers
SELECT Migration_route,ROUND(AVG(Number_of_Dead),2) as Avg_Dead_Migrants,ROUND(AVG(Number_of_Survivors),2) as Avg_Survivor_Migrants,ROUND(AVG(Minimum_Estimated_Number_of_Missing),2) as Avg_Minimum_Missing_Migrants FROM globalmigrantsdb.migrantdata GROUP BY Migration_route;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));