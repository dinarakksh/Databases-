create table Aliexpress(
ID int,
country varchar(30),
postcode int,
username varchar(30),
primary key(ID));

create table app(
app_ID int,
ID int,
website varchar(30),
name_of_app varchar(30),
primary key(website),
foreign key(ID) references aliexpress);

create table store(
store_ID int,
employee_id int,
store_name varchar(30),
ratings double precision ,
location varchar(25),
primary key(store_ID),
foreign key(employee_id) references employee);

create table employee(
ID int,
employee_id int,
full_name varchar(30),
email_address varchar(25),
primary key(employee_id),
foreign key(ID) references aliexpress);

create table linnworks(
track_id int,
linn_ID int,
subscription varchar(30),
employee_id int,
username2 varchar(25),
primary key(linn_ID),
foreign key(employee_id) references employee, foreign key (track_id) references tracking);

create table inventory(
inventory_ID int,
store_ID int,
num_in_stores int,
num_in_warehouse int,
reorders int,
city varchar(20),
product_id int,
primary key(inventory_ID),
foreign key(store_ID) references store, foreign key(product_id) references products);
drop table inventory cascade
--alter table inventory add column city_of_inventory varchar(20);


create table manufacturer(
    manufacturer_id int,
    num_of_inventory int,
    reorders int,
    inventory_ID int,
    primary key(manufacturer_id),
    foreign key (inventory_ID) references inventory, foreign key (reorders) references inventory);

create table products(
    employee_id int,
    product_id int,
    product_name varchar(35),
    price int,
    ID int,
    num_of_orders int,
    discounts bool,
    year int,
    primary key (product_id),
    foreign key (ID) references aliexpress, foreign key (employee_id) references employee
);
drop table products cascade
create table customer(
    customer_id int,
    purchase_sum int ,
    username2 varchar(20),
    website varchar(30),
    order_number int,
    date date,
    primary key (customer_id),
    foreign key (website) references app
);
drop table customer cascade
create table reg_details(
    users_id int,
    product_id int,
    phone_number bigint,
    address varchar(30),
    bank_card bigint,
    city varchar(15),

    users_country varchar(20),
    primary key (users_id),
    foreign key (product_id) references products
);

create table tracking(
    track_id int,
    delivery_name varchar(30),
    order_time date,
    disput_status varchar(6),
    product_id int,
    status char(10),
    users_id int,
    primary key (track_id),
    foreign key(product_id) references products, foreign key(users_id) references reg_details
);

create table contract(
    contract_ID int,
    purchase_num int,
    users_id int,
    primary key(contract_id),
    foreign key(users_id) references reg_details
);

create table dealer(
    dealer_code int,
    d_name varchar(15),
    manufacturer_id int,
    product_id int,
    primary key (dealer_code),
    foreign key (manufacturer_id) references manufacturer, foreign key(product_id) references products

);

INSERT INTO aliexpress VALUES (5940515, 'China', 0565, 'aliexpress');

INSERT INTO app VALUES (0027, 5940515, 'aliexpress.com', 'aliexpress' );

INSERT INTO store VALUES (0001,185, 'HENGYI store', 4.8, 'China' );
INSERT INTO store VALUES (2,22, 'JQ store', 4.7, 'China' );
INSERT INTO store VALUES (3,630, 'shop 505', 4.8, 'China' );
INSERT INTO store VALUES (4,42, 'McGrady', 4.9, 'China' );
INSERT INTO store VALUES (5,102, 'HEWITTISD', 4.8, 'China' );
INSERT INTO store VALUES (6,340, 'Yajie store', 4.4, 'China' );
INSERT INTO store VALUES (7,103, 'arctic monkeys', 5, 'China' );
INSERT INTO store VALUES (8,104, 'OLOEY', 4.6, 'China' );
INSERT INTO store VALUES (9,800, 'SONGDA', 4.8, 'China' );
INSERT INTO store VALUES (10,123, 'SHAKALAKA', 4.9, 'China' );
INSERT INTO store VALUES (11,105, 'ghrqx', 4.7, 'China' );


INSERT INTO employee VALUES (5940515, 185, 'Li', 'hengyi@gmail.com');
INSERT INTO employee VALUES (5940515,022, 'Zhang', 'minghong@gmail.com');
INSERT INTO employee VALUES (5940515,630, 'Super idol de xiaorong', 'superidol@gmail.com');
INSERT INTO employee VALUES (5940515,42, 'Kim', 'chenssss@gmail.com');
INSERT INTO employee VALUES (5940515,102, 'Zhao', 'zhao@gmail.com');
INSERT INTO employee VALUES (5940515,340, 'Huang', 'huang@gmail.com');
INSERT INTO employee VALUES (5940515,103, 'Wu', 'kriswu@gmail.com');
INSERT INTO employee VALUES (5940515,104, 'Guo', 'guosqwer@gmail.com');
INSERT INTO employee VALUES (5940515,800, 'Tang', 'tangsss@gmail.com');
INSERT INTO employee VALUES (5940515,123, 'Feng', 'fengchen@gmail.com');
INSERT INTO employee VALUES (5940515,105, 'xue hua piao piao bei feng', 'mingh@gmail.com');

INSERT INTO linnworks VALUES (22245, 3258, 'Linnworks', 185, 'hengyi');

INSERT INTO tracking VALUES (1234567,'Cainao super economy', '2021-11-05','opened', 5700, 'Sent', 1);
INSERT INTO tracking VALUES (1234454,'Cainao super economy', '2020-02-26','no', 1298, 'Received', 2);
INSERT INTO tracking VALUES (1234484,'ePacket', '2020-02-26','no', 1298, 'Received', 2);
INSERT INTO tracking VALUES (2234567,'China Post Small Packet', '2019-07-06','no', 630, 'Received', 3);
INSERT INTO tracking VALUES (3234454,'Aliexpress Standard Shipping', '2017-12-16','no', 452, 'Received', 1);
INSERT INTO tracking VALUES (7234484,'Posti Finland', '2021-09-20','no', 452, 'Received', 2);


INSERT INTO products VALUES (185, 5700, 'galaxy a52', 350, 5940515, 12305, false, 2020 );
INSERT INTO products VALUES (103, 1298,'acer aspire 7' , 195,5940515, 13127, false, 2020);
INSERT INTO products VALUES (340, 630,'macbook pro', 22 ,5940515, 8524, true, 2019);
INSERT INTO products VALUES (800, 607,'ps4',  45, 5940515, 201,true, 2020);
INSERT INTO products VALUES (105, 452,'iphone 12', 140,5940515, 9000,true, 2020);
INSERT INTO products VALUES (104, 5657,'asus zenbook ux325', 17,5940515, 325, false, 2017);
INSERT INTO products VALUES (185, 5633,'asus flip Si i7', 85,5940515, 9000,true, 2020);


INSERT INTO reg_details VALUES(1, 5700, 5008171706316467,'Adderley Rue', 111111, 'Murfreesboro', 'usa');
INSERT INTO reg_details VALUES(2, 607, 5008171706556467,'Thomas  Alley', 111222, 'Otawa', 'canada');
INSERT INTO reg_details VALUES(3, 607, 5008171886556467,'Bicknell  Boulevard', 111232, 'kyoto', 'japan');
INSERT INTO reg_details VALUES(4, 5657, 5008451886556467,'Cadogan  Drive', 113232, 'almaty', 'kazakhstan');

INSERT INTO customer VALUES (15,11000,'wkakashih','aliexpress.com', 24, '2021-11-01');
INSERT INTO customer VALUES (16,23,'kakashi','aliexpress.com', 3, '2021-10-01');
INSERT INTO customer VALUES (17,570,'nakopako','aliexpress.com', 8, '2020-08-01');
INSERT INTO customer VALUES (18,11200,'kaz_brekker','aliexpress.com', 30, '2021-12-04');
INSERT INTO customer VALUES (19,1,'Ash','aliexpress.com', 1, '2020-06-17');
INSERT INTO customer VALUES (20,11000,'Eiji','aliexpress.com',15, '2021-11-04');
INSERT INTO customer VALUES (21,2594,'devilmancrybaby','aliexpress.com', 62, '2021-12-01');
INSERT INTO customer VALUES (22,20020,'Aaron Warner','aliexpress.com', 500, '2017-11-01');
INSERT INTO customer VALUES (23,0,'Julette','aliexpress.com', 0, '2021-11-19');
INSERT INTO customer VALUES (24,546,'nil','aliexpress.com', 6,'2021-11-27');
INSERT INTO customer VALUES (25,21,'andrew','aliexpress.com', 2, '2021-11-30');

INSERT INTO dealer VALUES (2003, 'James Hoog', 80, 607);
INSERT INTO dealer VALUES (5002, 'Nail Knite', 81, 1298);
INSERT INTO dealer VALUES (5003, 'Pit Alex', 82, 630);
INSERT INTO dealer VALUES (5004, 'Paul Adam', 83, 452);
INSERT INTO dealer VALUES (2004, 'Lauson Hen', 84, 5700);
INSERT INTO dealer VALUES (5005, 'Kendrick Lamar', 85, 5657);
INSERT INTO dealer VALUES (5006, 'Elise Woodcock', 86, 5633);


INSERT INTO manufacturer VALUES (80, 2, 0, 5);
INSERT INTO manufacturer VALUES (81, 8, 6, 6);
INSERT INTO manufacturer VALUES (82, 150, 9, 5);
INSERT INTO manufacturer VALUES (83, 230, 12, 5);
INSERT INTO manufacturer VALUES (84, 127, 11, 5);
INSERT INTO manufacturer VALUES (85, 254, 23, 5);
INSERT INTO manufacturer VALUES (86, 47, 0, 5);
INSERT INTO manufacturer VALUES (87,23, 9, 5);

INSERT INTO inventory VALUES(5, 1, 5, 6, 0, 'California', 5700);
INSERT INTO inventory VALUES(6, 2, 50, 100, 6, 'Mexico', 1298);
INSERT INTO inventory VALUES(7, 3, 25, 0, 9, 'Tokyo', 607);
INSERT INTO inventory VALUES(8, 4, 23, 150, 12, 'Almaty', 452);
INSERT INTO inventory VALUES(9, 6, 38, 50, 11, 'New York', 5657);
INSERT INTO inventory VALUES(10, 7, 98, 353, 23, 'Ravka', 5633);
INSERT INTO inventory VALUES(11, 8, 20, 21, 0, 'Kerchiya', 630);
INSERT INTO inventory VALUES(12, 9, 61, 0, 9, 'Konoha', 5700);

drop table products cascade;

--• Assume the package shipped by USPS with tracking number 123456 is reported to have been
--destroyed in an accident. Find the contact information for the customer. Also, find the contents
--of that shipment and create a new shipment of replacement items.

select *
from tracking
where delivery_name = 'Cainao super economy' and track_id = 1234454;

-- • Find the customer who has bought the most (by price) in the past year.'-

select username2 from customer
order by purchase_sum  desc limit 1;

--• Find the top 2 products by dollar-amount sold in the past year.

select *
from products
order by price desc limit 2;

--Find the top 2 products by unit sales in the past year.

select * from products
where discounts = true and year = 2020
order by price desc limit 2;

--• Find those products that are out-of-stock at every store in California.

select * from inventory
where city = 'California' and num_in_warehouse = 0;

--• Find those packages that were not delivered within the promised time.

select * from tracking
where disput_status = 'opened';

--Generate the bill for each customer for the past month.

select username2, purchase_sum, date from customer
where date > '2021-11-04';

