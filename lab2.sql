---task 1---
-- Data-definition language (DDL). The SQL DDL provides commands for defining relation schemas, deleting relations, and modifying relation schemas. It is used to create database schema and can be used to define some constraints as well.
--  Data-manipulation language (DML). The SQL DML provides the ability to query information from the database and to insert tuples into, delete tuples from, and modify tuples in the database. It is used to add, retrieve or update the data.
-- DDL commands:

create table department
  (dept_name varchar(15),
  building varchar(25),
  primary key (dept_name));

drop table department

alter table team rename column player to pla

--DML commands:
delete from team

update instructor
set salary= salary * 1.05;

insert into course
values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);

select team_name
from team;




----task 2----
create table customers(
    id int,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null,
    primary key (id));

create table products(
    id varchar,
    name varchar not null,
    description text,
    price double precision not null check (price>0),
    primary key (id),
    foreign key(name) references products);

create table order_items(
    order_code int not null,
    product_id varchar not null,
    quantity int not null check(quantity>0),
    primary key (order_code,product_id));

create table orders(
    code int not null,
    customer_id int,
    total_sum double precision not null check(total_sum>0),
    is_paid boolean not null,
    primary key (code),
    foreign key (customer_id) references orders);

----task 3----
create table students(
    full_name varchar(60) not null,
    age int not null,
    birth_date date not null,
    gender varchar(6) not null,
    average_grade double precision not null,
    information_about_yourself text not null,
    need_for_dormitory boolean not null,
    additional_info text not null,
    primary key (full_name));

insert into students values ('Kuanysh Ayazhan', 18, '07.05.2003', 'female', 3.05, 'height:168,zodiac sign:taurus', false, 'born in Korday');
insert into students values ('Akezhan Korlan', 18, '26.03.2003', 'female', 3.70, 'height:160,zodiac sign:aries, loves watching romance kdramas', false, 'studies at KAZNPU');
insert into students values ('Ilyasova Aizada', 18, '07.09.2003', 'female', 2.78, 'height:165,zodiac sign:virgo', false, 'hates her groupmates');
insert into students values ('Sraylova Aizhan', 17, '11.07.2004', 'female', 2.78, 'height:166,zodiac sign:gemini', false, 'future medic, bruh');
insert into students values ('Temirbekova Togzhan', 15, '14.03.2006', 'female', 4, 'height:159,zodiac sign:aries', false, 'likes math(ew)');
insert into students values ('Tolbassy Fariza', 16, '13.08.2005', 'female', 3.5, 'height:160,zodiac sign:lion', false, 'sick with IELTS...');
insert into students values ('Toktarbay Dinara', 1, '05.11.2003', 'female', 2.80, 'height:168,zodiac sign:scorpio', false, 'obsessed with kakashi');

---b---
create table instructors(
    full_name varchar(60) not null,
    speaking_languages  varchar(15) not null,
    work_experience double precision not null,
    possibility_of_remote_lessons boolean not null,

    primary key (full_name));

insert into instructors values ('Bakranov Nurlan', 'eng,kz,rus', '5.2', true)
insert into instructors values ('Marat Nurtas', 'eng,kz,rus', '10', true)
insert into instructors values ('Polozova Viktorya', 'eng,rus', '7', false)
insert into instructors values ('Kuralbaev Aibek', 'eng,kz,rus', '6', false)

---c---
create table lesson_participants(
    lesson_title varchar(20) not null,
    teaching_instructor  varchar(40) not null,
    studying_students varchar(40) not null,
    room_number int not null,

    primary key (lesson_title, teaching_instructor));
drop table lesson_participants

insert into lesson_participants values ('ads', 'Alimzhan Amanaov', 'Toktarbay Dinara', 388)

---task 4---
insert into customers values ('066854', 'Hatake Kakashi','10-06-26', 'kazakhstan 29')

update customers
set id=id * 2;

delete from customers



