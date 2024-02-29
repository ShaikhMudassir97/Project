-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);
-- View
select * from Programmer


---ASSIGNMENT 7

--1. Find out the selling cost average for packages developed in Pascal.
select avg(scost) from Software
where Developin ='PASCAL'

--2. Display the names and ages of all programmers.
SELECT pname,datediff(year,dob,SYSDATETIME()) as age from programmer


--3. Display the names of those who have done the DAP Course.
select pname from studies
where course='DAP'

--4. Display the names and date of birth of all programmers born in January.
SELECT pname,dob from programmer
where month(dob)=01

--5. What is the highest number of copies sold by a package?
select max(sold) from software

--6. Display lowest course fee.
select min(course_fee) from studies

--7. How many programmers have done the PGDCA Course?
select count(pname) from studies
where course='PGDCA'


--8. How much revenue has been earned through sales of packages
--developed in C?
select sum(scost* sold) as revenue from software
where Developin='c'

--9. Display the details of the software developed by Ramesh.
select * from software 
where pname='Ramesh'

--10. How many programmers studied at Sabhari?
select count(pname) from studies
where institute='sabhari'

--11. Display details of packages whose sales crossed the 2000 mark.
select * from software 
where (sold* scost)>2000

--12. Display the details of packages for which development costs have been
--recovered.
select * from software
where scost*sold > dcost

--13. What is the cost of the costliest software development in Basic?
select max(dcost) from software
where Developin='Basic'

--14. How many packages have been developed in dBase?
select count(title) from software
where Developin='dbase'

--15. How many programmers studied in Pragathi?
select count(pname) from studies
where institute='pragathi'

--16. How many programmers paid 5000 to 10000 for their course?
select count(pname) from studies
where Course_fee between 5000 and 10000

--17. What is the average course fee?
select avg(course_fee) from studies

--18. Display the details of the programmers knowing C.
select * from programmer
where 'c' in (prof1,prof2)


--19. How many programmers know either COBOL or Pascal?
select count(pname) from programmer
where 'cobol' in(prof1,prof2) or 'pascal' in(prof1,prof2)


--20. How many programmers don’t know Pascal and C?
select count(pname) from programmer
where 'c' not in(prof1,prof2) or 'pascal' not in(prof1,prof2)

--21. How old is the oldest male programmer?
select datediff(year,dob,SYSDATETIME()) as age
from programmer
where gender='m' and dob=(select max(dob) from programmer where Gender='m')

--22. What is the average age of female programmers?
select avg(datediff(year,dob,SYSDATETIME()))as age from programmer
where gender='f'


--23. Calculate the experience in years for each programmer and display with
--their names in descending order.
select pname,datediff(year,doj,SYSDATETIME()) from programmer
order by pname desc


--24. Who are the programmers who celebrate their birthdays during the
--current month?
select pname from programmer
where month(dob)=month(SYSDATETIME())


--25. How many female programmers are there?
select count(pname) from programmer
where Gender='f'

--26. What are the languages studied by male programmers?
select distinct prof1,prof2 from programmer
where gender='m'


--27. What is the average salary?
select avg(salary) from programmer

--28. How many people draw a salary between 2000 to 4000?
select count(pname) from programmer
where salary between(2000) and (4000)


--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
select * from programmer
where prof1  not in ('Clipper', 'COBOL','PASCAL') and
prof2  not in ('Clipper', 'COBOL','PASCAL')


--30. Display the cost of packages developed by each programmer.
select pname,dcost,scost from software

--31. Display the sales value of the packages developed by each
--programmer.
select pname,(scost*sold) as sales from software

--32. Display the number of packages sold by each programmer.
select pname,count(title) from software group by pname

--33. Display the sales cost of the packages developed by each programmer
--language wise.
select pname,sum(scost*sold) as sales,Developin from software
group by Developin,pname


--34. Display each language name with the average development cost,
--average selling cost and average price per copy.
select developin,avg(dcost) as avg_dcost ,avg(scost) avg_scost from software
group by Developin

--35. Display each programmer’s name and the costliest and cheapest
--packages developed by him or her.
select pname,max(dcost) max_dcost,min(dcost) min_dcost from software group by pname

--36. Display each institute’s name with the number of courses and the
--average cost per course.
select institute,count(course) freq ,avg(Course_fee) avg_fee
from studies group by institute


--37. Display each institute’s name with the number of students.
select institute,count(pname) from studies group by institute

--38. Display names of male and female programmers along with their
--gender.
select pname,gender from programmer order by Gender

--39. Display the name of programmers and their packages.
select pname,title from software order by Pname

--40. Display the number of packages in each language except C and C++.
select developin,count(title) from software
group by Developin
having Developin not in ('c','c++')

--41. Display the number of packages in each language for which
--development cost is less than 1000.
SELECT developin, COUNT(*) as package_count
FROM software
WHERE dcost < 1000
GROUP BY developin;

--42. Display the average difference between SCOST and DCOST for each
--package.
select title,avg(scost-dcost) as avg_price_diff from software
group by Title


--43. Display the total SCOST, DCOST and the amount to be recovered for
--each programmer whose cost has not yet been recovered.
select pname,title,scost,dcost,(dcost-(scost*sold)) as recover_price 
from software where dcost>scost*sold


--44. Display the highest, lowest and average salaries for those earning more
--than 2000.
select pname,max(salary) max_sal,min(salary) min_sal ,
avg(salary) avg_sal from programmer group by Pname,salary
having salary>2000


--45. Who is the highest paid C programmer?
select pname,salary from programmer 
where salary=(select max(salary) as max_salary from programmer
where prof1='c' or prof2='c') and (prof1='c' or prof2='c')

--46. Who is the highest paid female COBOL programmer?
select pname,salary,gender from programmer 
where salary=(select max(salary) as max_salary from programmer
where prof1='cobol' or prof2='cobol' and gender='f') and (prof1='cobol' or prof2='cobol' and gender='f')

--47. Display the names of the highest paid programmers for each language.
WITH MY_CTE AS(
				SELECT PNAME,PROF1, SALARY
				FROM
					PROGRAMMER
				UNION
				SELECT PNAME,PROF2,SALARY
				FROM
					PROGRAMMER
			)
select pname,prof1 as Profession,salary,SAL_RANK from 
(SELECT 
		*,
RANK() OVER(PARTITION BY PROF1
ORDER BY SALARY DESC) AS SAL_RANK
FROM MY_CTE) as o where sal_rank=1


--48. Who is the least experienced programmer?
select pname from programmer
where doj=(select max(doj) from programmer)


--49. Who is the most experienced male programmer knowing PASCAL?
select pname from programmer
where doj=(select min(doj) from programmer 
where gender='m' and prof1='pascal' or prof2='pascal') 
and
(gender='m' and prof1='pascal' or prof2='pascal')


--50. Which language is known by only one programmer?
with cte_50 as (
select Pname , prof1 as languages,salary 
from programmer
				UNION
				SELECT PNAME,PROF2  ,SALARY
				FROM
					PROGRAMMER
)
select pname,languages,salary from cte_50
where languages in (select languages from cte_50 group by languages
having count(languages)=1)


--51. Who is the above programmer referred in 50?
--> has been answered above in question no. 50

--52. Who is the youngest programmer knowing dBase?
select pname from programmer 
where dob=(select max(dob) from programmer
where prof1='dbase' or prof2='dbase') and (prof1='dbase' or prof2='dbase')


--53. Which female programmer earning more than 3000 does not know C,
--C++, Oracle or dBase?
select pname from programmer
where gender='f' and salary>3000 and prof1 not in ('c++','c','oracle','dbase')  and prof2  not in ('c++','c','oracle','dbase')

--54. Which institute has the most number of students?

select institute,count(institute) as number from studies
group by institute having count(institute)=(select top(1) count(institute) as number from studies
group by institute order by count(institute) desc)

--55. What is the costliest course?
select course,Course_fee from studies
where course_fee=(select max(course_fee) from studies)

--56. Which course has been done by the most number of students?
go 
with xyz
as(select course,
count(course)as noOfCourse
from studies
group by course
)

select course from xyz where noOfCourse = (select max(noOfCourse) from xyz)

--57. Which institute conducts the costliest course?
select institute from studies
where course_fee=(select max(course_fee) from studies)


--58. Display the name of the institute and the course which has below
--average course fee.
select institute from studies
where course_fee=(select max(course_fee) from studies) 

--59. Display the names of the courses whose fees are within 1000 (+ or -) of
--the average fee.
select institute,course,course_fee from studies
where Course_fee between
(select (avg(Course_fee)-1000) from studies)
and (select (avg(Course_fee)+1000) from studies)

--60. Which package has the highest development cost?
select title from software
where dcost=(select max(dcost) from software)

--61. Which course has below average number of students?
with cte_61 as(
select course,count(course) as avg_std from studies
group by course
)
select * from cte_61
where avg_std<(select avg(avg_std) from cte_61)

--62. Which package has the lowest selling cost?
select distinct title from software
where scost=(select min(scost) from software)

--63. Who developed the package that has sold the least number of copies?
select pname from software
where sold=(select min(sold) from software)

--64. Which language has been used to develop the package which has the
--highest sales amount?
select distinct Developin from software
where sold=(select max(sold) from software)

--65. How many copies of the package that has the least difference between
--development and selling cost were sold?
select sold from software
where (dcost-scost)=
(select min(dcost-scost) as cost from software)

--66. Which is the costliest package developed in Pascal?
select title from software
where dcost=( select max(dcost) from software
where Developin='pascal') and Developin='pascal'

--67. Which language was used to develop the most number of packages?
-- Create a CTE to calculate the maximum dev_count
go 
with xyz
as(
select developin,count(developin) sid from software group by developin
)

select developin from xyz where sid = (select max(sid) from xyz)


--68. Which programmer has developed the highest number of packages?
go 
with xyz 
as(
select pname,count(pname) as sid from software group by pname
)

select pname from xyz where sid = (select max(sid) from xyz)

--69. Who is the author of the costliest package?
select pname,dcost from software
where dcost=(select max(dcost) from software)

--70. Display the names of the packages which have sold less than the
--average number of copies.
select pname,title from software
where sold<(select avg(sold) from software)

--71. Who are the authors of the packages which have recovered more than
--double the development cost?
select pname,title from software
where (scost*sold)>(dcost* 2)

--72. Display the programmer names and the cheapest packages developed
--by them in each language.
select pname,title from software
where dcost=(select min(dcost) from software)

--73. Display the language used by each programmer to develop the highest
--selling and lowest selling package.
with cte73 as(			
select pname,sold ,Sold_RANK from 
(SELECT 
		*,
RANK() OVER(PARTITION BY pname
ORDER BY sold desc) AS Sold_RANK
FROM software ) as o)
select * from cte73

--74. Who is the youngest male programmer born in 1965?
select * from programmer
where gender='m' and year(dob)=1965
and dob=(select min(dob) from programmer
where year(dob)=1965)

--75. Who is the oldest female programmer who joined in 1992?
select * from programmer
where gender='f' and year(doj)=1992
and doj=(select max(doj) from programmer
where year(doj)=1992)

--76. In which year was the most number of programmers born?
with cte76 as(
select year(dob) as dob,count(year(dob)) as dob_count from programmer
group by year(dob))
select dob,dob_count from cte76
where dob_count=(select max(dob_count)  from cte76)

--77. In which month did the most number of programmers join?
with cte77 as(
select datename(month,doj) as doj,count(month(doj)) as month_count from programmer
group by datename(month,doj))
select doj,month_count from cte77
where month_count=(select max(month_count)  from cte77)

--78. In which language are most of the programmer’s proficient?

go
with xyz 
as(
select united.language,count(*) as noOfProgrammer from
(select prof1 as language from programmer
union all
select prof2 from programmer) as united
group by language
)

select language from xyz where noOfProgrammer in (select max(noOfProgrammer) from xyz)

--79. Who are the male programmers earning below the average salary of
--female programmers?
select pname,salary from programmer
where Gender='m' and salary<(select avg(salary) from programmer
where gender='f')

--80. Who are the female programmers earning more than the highest paid?
 

--81. Which language has been stated as the proficiency by most of the
--programmers?
go
with xyz 
as(
select united.language,count(*) as noOfProgrammer from
(select prof1 as language from programmer
union all
select prof2 from programmer) as united
group by language
)

select language from xyz where noOfProgrammer in (select max(noOfProgrammer) from xyz)


--82. Display the details of those who are drawing the same salary.
SELECT pName,salary
FROM programmer
WHERE Salary IN (
    SELECT Salary
    FROM programmer
    GROUP BY Salary
    HAVING COUNT(*) > 1
) order by salary desc

--83. Display the details of the software developed by the male programmers
--earning more than 3000.
--83
select * from software sw
 join programmer pg
on sw.pname=pg.pname
where pg.Gender='m' and pg.salary>3000

--84. Display the details of the packages developed in Pascal by the female
--programmers.
select * from software sw
 join programmer pg
on sw.pname=pg.pname
where pg.Gender='f' and sw.Developin='pascal'

--85. Display the details of the programmers who joined before 1990.
select * from programmer
where year(doj)<1990


--86. Display the details of the software developed in C by the female
--programmers at Pragathi.
select * from software sw
 join programmer pg
on lower(sw.pname)=lower(pg.pname)
join studies std
on lower(sw.pname)=lower(std.Pname)
where pg.Gender='f' and sw.Developin='c' and std.institute='Pragathi'


--87. Display the number of packages, number of copies sold and sales value
--of each programmer institute wise.
select sw.title,sw.sold,(sw.scost*sw.sold) as sales
from software sw
join studies std 
on sw.Pname=std.Pname

--88. Display the details of the software developed in dBase by male
--programmers who belong to the institute in which the most number of
--programmers studied.
with cte88 as(
select institute,count(institute) as freq
from studies group by institute)
select * from software sw
join programmer pw 
on sw.pname=pw.Pname
join studies std
on sw.pname=std.pname
where developin='dbase' and gender='m' and institute=(
select institute from cte88
where freq=(select max(freq) from cte88))

--89. Display the details of the software developed by the male programmers
--born before 1965 and female programmers born after 1975.
select * from software sw, programmer pw  
where
sw.pname=pw.Pname
and (gender= 'm'and year(dob)<1965)
or 
(gender='f'and year(dob)>1975)

--90. Display the details of the software that has been developed in the
--language which is neither the first nor the second proficiency of the
--programmers.
select * from programmer p ,software s

where p.pname=s.Pname
and
Developin not in (prof1,prof2)

--91. Display the details of the software developed by the male students at
--Sabhari.
select * from programmer p , studies std 
where 
p.Pname=std.Pname
and
gender='m'
and
institute='sabhari'

--92. Display the names of the programmers who have not developed any
--packages.
 select pname from programmer
 where pname not in(select pname from software);

--93. What is the total cost of the software developed by the programmers of
--Apple?
select sum(sold*scost) as total_cost from software 
where  pname in (select pname from studies
where institute='apple')

--94. Who are the programmers who joined on the same day?
select p1.pname,p1.doj from programmer p1,programmer p2
where
p1.pname<>p2.Pname
and
p1.doj=p2.doj order by doj

--95. Who are the programmers who have the same Prof2?
select  distinct p1.pname,p1.prof2 from programmer p1 , programmer p2
where
p1.Pname<>p2.Pname and p1.prof2=p2.prof2
order by prof2

--96. Display the total sales value of the software institute wise.
select institute,sum(sold*scost) as total_cost from software s 
join 
studies std
on s.Pname=std.Pname
group by 
institute

--97. In which institute does the person who developed the costliest package
--study?

SELECT s.pname, std.institute
FROM software s
JOIN studies std ON s.pname = std.pname
WHERE s.dcost = (SELECT MAX(dcost) FROM software);


--98. Which language listed in Prof1, Prof2 has not been used to develop any
--package?
select s.pname ,developin,(prof1+ ',' + prof2) as prof from software s ,programmer p 
where s.pname=p.pname
and Developin not in (prof1,prof2)

--99. How much does the person who developed the highest selling package
--earn and what course did he/she undergo?
select p.pname,salary ,title,developin,sold,institute
from programmer p ,software s ,studies std
where p.pname=s.Pname and p.Pname=std.Pname
and sold=(select max(sold) from software)

--100. What is the average salary for those whose software sales is more than
--50,000?
select avg(salary) from software s , programmer p
where p.pname=s.pname and (sold*scost) >50000

--101. How many packages were developed by students who studied in
--institutes that charge the lowest course fee?
select count(title) from software s , studies std
where s.pname=std.pname
and Course_fee=(select min(Course_fee) from studies)


--102. How many packages were developed by the person who developed the
--cheapest package? Where did he/she study?
with cte102 as (
select pname,count(title) as freq from software
group by pname)
select c.pname,title,freq from cte102 c,studies std ,software s
where c.pname =s.pname and std.Pname=s.Pname and
dcost=(select min(dcost) from software)

--103. How many packages were developed by female programmers earning
--more than the highest paid male programmer?
with cte103 as (
select pname,count(title) as freq from software
group by pname)
select c.pname,freq from cte103 c
join 
programmer p
on c.Pname=p.Pname
where 
 gender='f' and
salary>(select max(salary) from programmer 
where gender='m')


--104. How many packages are developed by the most experienced
--programmers from BDPS?
with cte104 as (
select pname,count(title) as freq from software
group by pname)
select c.pname,freq from cte104 c
join 
programmer p
on c.Pname=p.Pname
join 
studies std
on c.Pname=std.Pname
where 
 institute='BDPS' and
doj=(select min(doj) from programmer p , studies std
where p.pname=std.pname and 
institute='BDPS')

--105. List the programmers (from the software table) and the institutes they
--studied at.
select distinct s.pname,institute from software s , studies std
where s.Pname=std.Pname

--106. List each PROF with the number of programmers having that PROF
--and the number of the packages in that PROF.
go 
with xyz 
as(
select prof1 from programmer union select prof2 from programmer
)

select developin,count(pname) noOfProgrammers,count(title) noOfPackages from xyz,software s 
where xyz.prof1=s.developin group by developin



--107. List the programmer names (from the programmer table) and the
--number of packages each has developed
select pname,count(pname) as no_of_packages from software group by pname