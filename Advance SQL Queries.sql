-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
use assignment;
select * from employee;
select * from employee where deptno=10 and salary >3000;

-- 2. The grading of students based on the marks they have obtained is done as follows

	-- 40 to 50 -> Second Class
	-- 50 to 60 -> First Class
	-- 60 to 80 -> First Class
	-- 80 to 100 -> Distinctions

	-- a. How many students  have graduated with first class?
select * from students;
select count(*) from students where marks >50 and marks<= 80;
	-- b. How many students  have obtained distinction?  [table: students]
select count(*) from students where marks >80 and marks <=100;

-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]

select distinct city from station where id%2 = 0;

-- 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. 
-- In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station,
-- write a query to find the value of N-N1 from station.[table: station]

select * from station;

select count(city) - count(distinct city) from station ;

-- 5. a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

select distinct city from station where left (city, 1) in ('a','e','i','o','u');

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
-- Your result cannot contain duplicates.


SELECT DISTINCT CITY FROM STATION WHERE SUBSTRING(CITY,1,1) in('A','E','I','O','U') AND SUBSTRING(REVERSE(CITY),1,1) in('A','E','I','O','U');

-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

select distinct city from station where left (city, 1) not in ('a','e','i','o','u');

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
-- Your result cannot contain duplicates. [table: station]

SELECT DISTINCT CITY FROM STATION WHERE SUBSTRING(CITY,1,1)not in('A','E','I','O','U') AND SUBSTRING(REVERSE(CITY),1,1)not in('A','E','I','O','U');

-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 
-- 10 months. Sort your result by ascending emp_id. [table: emp]

select * from emp;

select  emp_no, first_name, last_name , salary from emp where salary > 2000 and date_sub(date(now()),interval 10 month)<hire_date;

-- 8.  How much money does the company spend every month on salaries for each department? [table: emp]

-- Expected Result:

select sum(salary), deptno from emp group by deptno order by deptno;

-- 9. How many cities in the CITY table have a Population larger than 100000. [table: city]
select * from city;

select count(name) as 'No of cities with large population' from city where population > 100000;

-- 10. What is the total population of California? [table: city]

select sum(population) from city where district = "California";

-- 11. What is the average population of the districts in each country? [table: city]

select countrycode, avg(population) as 'average population'  from city group by countrycode ;

