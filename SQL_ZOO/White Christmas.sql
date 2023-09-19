--1. Show the average daily temperature for August 10th 1964
SELECT m8/10 FROM hadcet
  WHERE yr=1964 AND dy=10

--2. Show the twelve temperatures.
SELECT yr-1811 as age, m12/10 FROM hadcet
  WHERE yr BETWEEN 1812 and 1812+11 AND dy=25

--3. For each age 1-12 show which years were a White Christmas. Show 'White Christmas' or 'No snow' for each age.
SELECT yr-1811 as age, case when min(m12)<0 then 'White Christmas' else 'No Snow' end
 FROM hadcet
 WHERE yr BETWEEN 1812 and 1812+11 AND (dy<=25 AND dy>=21)
group by yr-1811


--4. List all the years and the wcc for children born in each year of the data set. Only show years where the wcc was at least 7.
select yob,wcc
from (select y as yob,SUM(wc) OVER (ORDER BY y ROWS BETWEEN 2 FOLLOWING AND 11 FOLLOWING) as wcc
from (SELECT yr as y, (case when min(m12)<0 then '1' else '0' end)as wc
 FROM hadcet
 WHERE  dy<=25 AND dy>=21
GROUP BY yr) as oneyear) as res
where wcc>=7

--5. Here are the average temperatures for August by decade. You decide.
SELECT ROUND(yr,-1) decade, ROUND(AVG(NULLIF(m8,-999))/10,1)
  FROM hadcet
GROUP BY ROUND(yr,-1)
