#Males vs Females Total Number Of Migrants
SELECT SUM(Number_of_Males),SUM(Number_of_Females) from migrantdata;
#Comparison(Decimal)
SELECT Round(SUM(Number_of_Males)/SUM(Number_of_Females),2) as comparison_estimate from migrantdata;
#Comparison(%)
SELECT ROUND(SUM(Number_of_Males)/(SUM(Number_of_Males)+SUM(Number_of_Females))*100,2) as 'Male%',ROUND(SUM(Number_of_Females)/(SUM(Number_of_Males)+SUM(Number_of_Females))*100,2) as 'Female%' from migrantdata;
#Average Number of Migrants(Genderwise)/year
SELECT Incident_year,SUM(Number_of_Males) as 'Total Number Of Males',SUM(Number_of_Females) as 'Total Number Of Females' from migrantdata group by Incident_year;
#Growth/Decrease Rate 
with cte as(
select Incident_year,SUM(Number_of_Males) as males_no,SUM(Number_of_Females)as females_no,row_number() over (order by Incident_year) as rn1 from migrantdata group by Incident_year)
select t1.Incident_year,t1.males_no,round(coalesce((t1.males_no-t2.males_no),0)*1.0/t1.males_no*100,2) as 'Change Rate(%)',t1.females_no,round(coalesce((t1.females_no-t2.females_no),0)*1.0/t1.females_no*100,2) as 'Change Rate(%)' from cte t1 left join cte t2 on t1.rn1=t2.rn1+1 