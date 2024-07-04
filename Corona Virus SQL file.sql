
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
select *
from dbo.[Corona Virus Dataset]
where Province is null
or	[Country/Region] is null
or Latitude is null
or Longitude is null
or Date is null	
or Confirmed is null
or Deaths is null
or Recovered is null



--Q2. If NULL values are present, update them with zeros for all columns. 
				/*
				No null values are present
				*/
select ISNULL(Province, 0)
from dbo.[Corona Virus Dataset]



-- Q3. check total number of rows
select count(*)
from dbo.[Corona Virus Dataset]



-- Q4. Check what is start_date and end_date
select min(date) as start_date, max(date) as end_date
from dbo.[Corona Virus Dataset]



-- Q5. Number of month present in dataset
select DATEDIFF(month, min(date), max(date)) as '# Months'
from dbo.[Corona Virus Dataset]



-- Q6. Find monthly average for confirmed, deaths, recovered
select year(Date) as 'Year', MONTH(Date) as 'Month', AVG(Confirmed) as 'Confirmed_AVG',	AVG(Deaths) as 'Death_AVG', AVG(Recovered) as 'Recovered_AVG'
from dbo.[Corona Virus Dataset]
group by year(Date), MONTH(Date)
order by Year, Month



-- Q7. Find most frequent value for confirmed, deaths, recovered each month
/*
*/
select top 1 Deaths, count(*) as 'Deaths_Frequency', Confirmed, count(*) as 'Confirmed_Frequency', Recovered, count(*) as 'Recovered_Frequency'
from dbo.[Corona Virus Dataset]
group by Deaths, Confirmed, Recovered
order by Deaths_Frequency desc



-- Q8. Find minimum values for confirmed, deaths, recovered per year
select top 1 year(Date) as 'Year', sum(Confirmed) as 'Confirmed/Year', SUM(Deaths) as 'Deaths/Year', SUM(Recovered) as 'Recovered/Year'
from dbo.[Corona Virus Dataset]
group by YEAR(Date)
order by Year asc



-- Q9. Find maximum values of confirmed, deaths, recovered per year
select top 1 year(Date) as 'Year', sum(Confirmed) as 'Confirmed/Year', SUM(Deaths) as 'Deaths/Year', SUM(Recovered) as 'Recovered/Year'
from dbo.[Corona Virus Dataset]
group by YEAR(Date)
order by Year desc



-- Q10. The total number of case of confirmed, deaths, recovered each month
select year(Date) as 'Year', MONTH(Date) as 'Month', sum(Confirmed) as 'Total_Confirmed',	sum(Deaths) as 'Total_Death', sum(Recovered) as 'Total_Recovered'
from dbo.[Corona Virus Dataset]
group by year(Date), MONTH(Date)
order by Year, Month



-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
select SUM(Confirmed) as 'Total_confirmed', AVG(Confirmed) as 'AVG_Confirmed', VAR(Confirmed) as 'VAR_Confirmed', STDEV(Confirmed) as 'STDEV_Confirmed'
from dbo.[Corona Virus Dataset]



-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
select YEAR(Date) as 'Year', MONTH(Date) as 'Month', SUM(Confirmed) as 'Total_confirmed', AVG(Confirmed) as 'AVG_Confirmed', VAR(Confirmed) as 'VAR_Confirmed',
STDEV(Confirmed) as 'STDEV_Confirmed'
from dbo.[Corona Virus Dataset]
group by YEAR(Date), MONTH(Date)
order by Year, Month



-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
select YEAR(Date) as 'Year', MONTH(Date) as 'Month', SUM(Recovered) as 'Total_Recovered', AVG(Recovered) as 'AVG_Recovered', VAR(Recovered) as 'VAR_Recovered',
STDEV(Recovered) as 'STDEV_Recovered'
from dbo.[Corona Virus Dataset]
group by YEAR(Date), MONTH(Date)
order by Year, Month



-- Q14. Find Country having highest number of the Confirmed case
select top 1 [Country/Region], SUM(Confirmed) as 'Total_Confirmed'
from dbo.[Corona Virus Dataset]
group by [Country/Region]
order by Total_Confirmed Desc



-- Q15. Find Country having lowest number of the death case
select top 1 [Country/Region], SUM(Deaths) as 'Total_Deaths'
from dbo.[Corona Virus Dataset]
group by [Country/Region]
order by Total_Deaths asc




-- Q16. Find top 5 countries having highest recovered case
select top 5 [Country/Region], SUM(Recovered) as 'Total_Recovered'
from dbo.[Corona Virus Dataset]
group by [Country/Region]
order by Total_Recovered desc