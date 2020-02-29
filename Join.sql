create table Grouptype(
	Id int primary key identity,
	Name nvarchar
)

ALTER TABLE GroupType ALTER COLUMN Name nvarchar(25) not null


create table Groups(
	Id int primary key identity,
	Name nvarchar(10) not null,
	MaxSize int check(MaxSize<=18),
	GrouptypeId int references Grouptype(Id)
)

select * from Grouptype

select * from Groups

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
join Grouptype as gt
on g.GrouptypeId=gt.Id

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
left join Grouptype as gt
on g.GrouptypeId=gt.Id

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
right outer join Grouptype as gt
on g.GrouptypeId=gt.Id

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
full join Grouptype as gt
on g.GrouptypeId=gt.Id


create table Positions(
	Id int primary key identity,
	Position nvarchar(100),
	Dependency int
)

select * from Positions

select p1.Position,p2.Position 'Dependency' from Positions p1
left join Positions p2
on p1.Dependency=p2.Id

create table Students(
	Id int primary key identity,
	Name nvarchar(100),
	Surname nvarchar(100),
	GroupId int references Groups(Id)
)

select st.Name,
		Surname,
		g.Name 'Group',
		MaxSize,
		gt.Name 'Type' 
from Students st

join Groups g
on st.GroupId=g.Id

join Grouptype gt
on g.GrouptypeId=gt.Id


create table Sizes(
	Id int primary key identity,
	Size nvarchar(10)
)

create table Products(
	Id int primary key identity,
	Name nvarchar(30)
)

select * from Products
cross join Sizes

create table Grades(
	Id int primary key identity,
	MinGrade int,
	MaxGrade int,
	Letter char
)

alter table Students 
add Grade int 

select Name,Surname,Grade,Letter from Students st
join Grades gr

on st.Grade Between gr.MinGrade and gr.MaxGrade