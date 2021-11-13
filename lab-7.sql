create table customers (
    id integer primary key,
    name varchar(255),
    birth_date date
);

create table accounts(
    account_id varchar(40) primary key ,
    customer_id integer references customers(id),
    currency varchar(3),
    balance float,
    "limit" float
);

create table transactions (
    id serial primary key ,
    date timestamp,
    src_account varchar(40) references accounts(account_id),
    dst_account varchar(40) references accounts(account_id),
    amount float,
    status varchar(20)
);

INSERT INTO customers VALUES (201, 'John', '2021-11-05');
INSERT INTO customers VALUES (202, 'Anny', '2021-11-02');
INSERT INTO customers VALUES (203, 'Rick', '2021-11-24');

INSERT INTO accounts VALUES ('NT10204', 201, 'KZT', 1000, null);
INSERT INTO accounts VALUES ('AB10203', 202, 'USD', 100, 0);
INSERT INTO accounts VALUES ('DK12000', 203, 'EUR', 500, 200);
INSERT INTO accounts VALUES ('NK90123', 201, 'USD', 400, 0);
INSERT INTO accounts VALUES ('RS88012', 203, 'KZT', 5000, -100);

INSERT INTO transactions VALUES (1, '2021-11-05 18:00:34.000000', 'NT10204', 'RS88012', 1000, 'commited');
INSERT INTO transactions VALUES (2, '2021-11-05 18:01:19.000000', 'NK90123', 'AB10203', 500, 'rollback');
INSERT INTO transactions VALUES (3, '2021-06-05 18:02:45.000000', 'RS88012', 'NT10204', 400, 'init');

--Task-1
--How can we store large-object types?
--The large object (LOB) data types can store large amounts of binary and character data.
--The CLOB, NCLOB, and BLOB types are sometimes referred to as internal LOB types, and the BFILE type is sometimes referred to as an external LOB type.
--For example:
book_review clob(10KB)
image blob(10MB)
movie blob(2GB)

--Task-2
--2. What is the difference between privilege, role and user?
--Privileges control the ability to run SQL statements. A role is a group of privileges.
--Granting a role to a user gives them the privileges contained in the role.
--A user is an individual person who is included in the role - Bob, Nancy, and Steve might be assigned to the customer service agent role.

--2(1)
create role accountant;
grant select, insert, update   on accounts to accountant;

create role administrator;
grant all privileges on accounts, customers, transactions to administrator;

create role support;
grant select on accounts,customers,transactions to support;

--2(2)
create user lena;
grant administrator to lena;

create user yuliya;
grant support to yuliya;

create user vanya;
grant accountant to vanya;

--2(3)
grant all privileges on accounts, customers, transactions to yuliya with grant option;

--2(4)
revoke update on accounts from lena;

--Task-3(2)
alter table accounts
    alter column account_id set not null;
alter table customers
    alter column name set not null ;
alter table customers
    alter column birth_date set not null ;

--Task-5(1)
create index acc_currency on accounts (customer_id, currency);

--5(2)
create index cur_balance on accounts (currency, balance);

--Task-6(1)
DO
$$
  DECLARE
    bal int;
    lim int;
  BEGIN
    update accounts
    set balance = balance - 500
    where account_id = 'AB10203';
    update accounts
    set balance = balance + 500
    where account_id = 'DK12000';
    select balance into bal from accounts where account_id = 'AB10203';
    select accounts.limit into lim from accounts where account_id = 'AB10203';
    if bal < lim then
        update transactions set status = 'rollback' where id = 3;
    else
        commit;
        update transactions set status = 'commited' where id = 3;
    end if;
  END$$;




