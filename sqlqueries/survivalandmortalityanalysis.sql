#survivor and mortality % per year
with cte as(
select Incident_year,SUM(Number_of_Dead) as Death_Numbers,SUM(Number_of_Survivors)as Survivors_Numbers,row_number() over (order by Incident_year) as rn1 from migrantdata group by Incident_year)
select t1.Incident_year,t1.Death_Numbers,round(coalesce((t1.Death_Numbers-t2.Death_Numbers),0)*1.0/t1.Death_Numbers*100,2) as 'Death Change Rate(%)',t1.Survivors_Numbers,round(coalesce((t1.Survivors_Numbers-t2.Survivors_Numbers),0)*1.0/t1.Survivors_Numbers*100,2) as 'Survivor Change Rate(%)' from cte t1 left join cte t2 on t1.rn1=t2.rn1+1;

#survivor and mortality numbers per origin
SELECT Region_of_Origin,ROUND(AVG(Number_of_Survivors),2) as Average_Survivors,ROUND(AVG(Number_of_Dead),2) as Average_Deaths from migrantdata group by Region_of_Origin;
#Death Numbers according to cause of death
SELECT Cause_of_Death,ROUND(SUM(Number_of_Dead)/(SELECT sum(Number_of_Dead) from migrantdata) *100,2) as 'Death_Distribution(%)' from migrantdata group by Cause_of_Death order by SUM(Number_of_Dead) DESC;