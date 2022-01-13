
SELECT supplierid,COUNT(productid) FROM products GROUP BY supplierid ORDER BY supplierid ;


-- NO. OF EMPLOYEES REPORTING TO fULLER AND bUCHMAN
-- REPORTSTO AND COUNT OF EMPLOYEES
SELECT reportsto, COUNT(employeeid)
 FROM public.employees
 GROUP BY reportsto;
 
 
SELECT reportsto, COUNT(employeeid)
FROM public.employees
where reportsto is not null
GROUP BY reportsto;


-reports who has count more than 3


SELECT reportsto, COUNT(employeeid)
 FROM public.employees
 where reportsto is not null
   GROUP BY reportsto
   HAVING COUNT(employeeid)>3;
   
--- region count of customer where region is not null 
SELECT region, COUNT(*)
FROM customers
where region is not null
GROUP BY region
 
--- region count where region is not null and count of customer >2
SELECT region, COUNT(*)
FROM customers
where region is not null
GROUP BY region
HAVING COUNT(*)>2
   HAVING COUNT(employeeid)>2;
