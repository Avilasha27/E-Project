create database ProjectDb

use ProjectDb

/*Project Table       Base Table-PK
  Employee Table      ForeignKey Table
*/

create table TableProject(
ProjectId int primary key,
ProjectName varchar(100),
ProjectDuration int,
ClientName varchar(100),
WorkLocation varchar(100)
)

create table TableEmployee(
EmployeeId int primary key,
FirstName varchar(100),
LastName varchar(100) default 'N/A',
EmailId varchar(100) unique,
Age int check(age>20 and age<40),
Salary money,
ProjectId int foreign key references TableProject(ProjectId)
)
insert into TableProject values(1,'E-Shop',70,'Flipkart','Bangalore')
insert into TableProject values(2,'E-Bill',50,'Accenture','Delhi')
insert into TableProject values(3,'E-Banking',60,'HDFC','Chennai')
insert into TableProject values(4,'E-Healthcare',100,'Apollo','Mumbai')

select * from TableProject

alter table TableEmployee add Skill varchar(100)
select * from TableEmployee

insert into TableEmployee values(101,'Santosh','H B','san@g.com',30,40000,1,'DotNet')
insert into TableEmployee values(102,'Sony','N/A','sony@g.com',32,30000,2,'BI')
insert into TableEmployee values(103,'Adam','George','adam@g.com',36,80000,3,'Oracle')

select * from TableEmployee

select (FirstName+LastName) 'Employee Name', EmailId from TableEmployee where Salary>25000 and Salary<50000

select * from TableProject where WorkLocation in('Chennai','Bangalore')

select sum(ProjectDuration),WorkLocation from TableProject group by WorkLocation 

/*Get specific records*/
select e.FirstName,e.EmailId,e.Skill,p.ProjectName from TableEmployee e inner join TableProject p on e.ProjectId=p.ProjectId

/*Get all projects and only matching employee from TableEmployee*/
select p.ProjectName,p.ClientName,e.FirstName,e.EmailId from TableProject p left join TableEmployee e on p.ProjectId=e.ProjectId

/*Get all employees and only matching employee from TableProject*/
select p.ProjectName,p.ClientName,e.FirstName,e.EmailId from TableProject p right join TableEmployee e on p.ProjectId=e.ProjectId

/*Get all employees and projects from both tables*/
select * from TableProject full outer join TableEmployee on TableEmployee.ProjectId=TableProject.ProjectId

select * from TableEmployee cross join TableProject
insert into TableProject values(5,'E-Bill',130,'Tutorial','Hyd')

/*Subquery*/

/*Get EmpId,FirstName and Email who works under Project E-Shop and E-Banking*/
select EmployeeId,FirstName,EmailId from TableEmployee where ProjectId in(select ProjectId from ProjectTable where ProjectName='E-shop' or ProjectName='E-Banking')

insert into TableProject values(6,'E-Learning',130,'TutorialsTeacher','Hyd')

select * from TableProject

select EmployeeId,FirstName,EmailId from TableEmployee where ProjectId in(select projectId from TableProject where ProjectDuration<150)

/*Reverse Inner Query wth Outer*/
select ProjectName, WorkLocation from TableProject where ProjectId in (select ProjectId from TableEmployee where EmployeeId = 101)

insert into TableEmployee values(105,'Virat','K','virat@g.com',35,50000,6,'Oracle')

/*Group by using join*/
select p.ProjectName, count(e.EmployeeId) as EmployeeCount from TableEmployee e inner join TableProject p on e.ProjectId = p.ProjectId group by p.ProjectName;

