--1. How many stops are in the database.
select count(id)
from stops


--2. Find the id value for the stop 'Craiglockhart'
select id
from stops
where name='Craiglockhart'

--3. Give the id and the name for the stops on the '4' 'LRT' service.
select id,name
from route 
join stops on route.stop=stops.id
where company='LRT' and num='4'

--4. Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having COUNT(*)=2

--5. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

--6.  Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

--7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop=137

--8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

--9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT distinct stopb.name,a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

--10. Find the routes involving two buses that can go from Craiglockhart to Lochend.Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.

select a1,c1,n1,a2,c2
from (SELECT distinct a.num a1, a.company c1, stopb.name n1
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart') x
join
(SELECT distinct c.num a2, c.company c2, stopd.name n2,stopc.name n0
FROM route c JOIN route d ON
  (c.company=d.company AND c.num=d.num)
  JOIN stops stopc ON (c.stop=stopc.id)
  JOIN stops stopd ON (d.stop=stopd.id)
WHERE stopd.name='Lochend')y
on x.n1=y.n0
