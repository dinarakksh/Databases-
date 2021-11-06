create table dealer (
    id integer primary key ,
    name varchar(255),
    location varchar(255),
    charge float
);

INSERT INTO dealer (id, name, location, charge) VALUES (101, 'Ерлан', 'Алматы', 0.15);
INSERT INTO dealer (id, name, location, charge) VALUES (102, 'Жасмин', 'Караганда', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (105, 'Азамат', 'Нур-Султан', 0.11);
INSERT INTO dealer (id, name, location, charge) VALUES (106, 'Канат', 'Караганда', 0.14);
INSERT INTO dealer (id, name, location, charge) VALUES (107, 'Евгений', 'Атырау', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (103, 'Жулдыз', 'Актобе', 0.12);

create table client (
    id integer primary key ,
    name varchar(255),
    city varchar(255),
    priority integer,
    dealer_id integer references dealer(id)
);

INSERT INTO client (id, name, city, priority, dealer_id) VALUES (802, 'Айша', 'Алматы', 100, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (807, 'Даулет', 'Алматы', 200, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (805, 'Али', 'Кокшетау', 200, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (808, 'Ильяс', 'Нур-Султан', 300, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (804, 'Алия', 'Караганда', 300, 106);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (809, 'Саша', 'Шымкент', 100, 103);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (803, 'Маша', 'Семей', 200, 107);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (801, 'Максат', 'Нур-Султан', null, 105);

create table sell (
    id integer primary key,
    amount float,
    date timestamp,
    client_id integer references client(id),
    dealer_id integer references dealer(id)
);

INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (201, 150.5, '2012-10-05 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (209, 270.65, '2012-09-10 00:00:00.000000', 801, 105);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (202, 65.26, '2012-10-05 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (204, 110.5, '2012-08-17 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (207, 948.5, '2012-09-10 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (205, 2400.6, '2012-07-27 00:00:00.000000', 807, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (208, 5760, '2012-09-10 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (210, 1983.43, '2012-10-10 00:00:00.000000', 804, 106);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (203, 2480.4, '2012-10-10 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (212, 250.45, '2012-06-27 00:00:00.000000', 808, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (211, 75.29, '2012-08-17 00:00:00.000000', 803, 107);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (213, 3045.6, '2012-04-25 00:00:00.000000', 802, 101);

---drop table classroom;
-- drop table dealer;
-- drop table sell;

--Task 1(a)
select * from dealer cross join client;
--1(b)
select del.name, cli.name, cli.city, cli.priority, se.id as s_num, se.date, se.amount from dealer as del
inner join client as cli on del.id = cli.dealer_id
inner join sell as se on cli.id = se.client_id
order by del.id;
--1(c)
select * from dealer
cross join client
where dealer.location = client.city;
--1(d)
select sell.id, sell.amount, client.name, client.city
from sell inner join client on sell.client_id = client.id
where sell.amount between 100 and 500;
--1(e)
select client.name,dealer.id as id
from client
full join dealer on dealer.id=client.dealer_id
--1(f)
select client.name, client.city, dealer.name, dealer.charge
from dealer
full join client on dealer.id = client.dealer_id
--1(g)
select client.name, client.city, dealer.name, dealer.charge from client
inner join dealer  on dealer.id = client.dealer_id
where dealer.charge > 0.12;
--1(h)
select client.name, client.city, sell.id, sell.date, amount, dealer.name, dealer.charge
from client left join dealer on client.dealer_id = dealer.id left join sell on client.id = sell.client_id;
--1(i)
select sell.client_id, client.name, client.priority, dealer.name,sell.id,sell.amount from sell
left outer join  client on sell.client_id = client.id
right outer join dealer on sell.dealer_id = dealer.id
where priority is not null and Amount> 2000;

--Task 2(a)
create  view  am1
AS
select
date, count (distinct client_id),
 avg (amount), sum (amount)
 from sell
 group by date
 order by date;

--2(b)
create view sum1
AS
select
        date, sum (amount)
        from sell
        group by date
        order by sum (amount) desc limit 5;

--2(c)
create view d1
    AS
select dealer_id, count(dealer_id), avg(amount), sum(amount)
from sell
group by dealer_id
order by dealer_id;

--2(d)
create view earn1
    AS
select location, sum(total)
from (select dealer.location, sum(amount) * dealer.charge as total
      FROM sell
      inner join dealer on sell.dealer_id = dealer.id
      group by dealer.location, dealer.charge) dealer
group by location
having location = dealer.location;
--2(f)
create view city1
    AS
select city, count(city), sum(amount), avg(amount)
from client
         inner join sell on client.id = sell.client_id
GROUP BY city;
--2(e)
create view city2
    AS
select location, count(sell.id), sum(amount), avg(amount)
from sell
         inner join dealer on sell.dealer_id = dealer.id
group by location;

--2(g)
create view loc1
    AS
    select location, sum(sell.amount) as loc_sum
        from sell inner join dealer  on sell.dealer_id = dealer.id
            group by location;
create view city3
    AS
    select city, sum(sell.amount) city_sum
        from sell  inner join client  on client.id = sell.client_id
            group by city;
select city, loc_sum, city_sum
    from loc1 inner join city3 on location = city
        where loc_sum < city_sum;