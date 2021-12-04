--1. Create a function that:
--a. Increments given values by 1 and returns it.
create function inc(val integer) returns integer AS
    $$
BEGIN
RETURN val + 1;
    END; $$ language plpgsql;

--b. Returns sum of 2 numbers.

create or replace function get_sum(
a numeric,
b numeric)
RETURNS numeric as $$
    BEGIN
    RETURN a + b;
    END; $$
language plpgsql;

--c. Returns true or false if numbers are divisible by 2.

CREATE FUNCTION if_div(a integer)RETURNS bool AS $$
BEGIN
    IF a % 2=0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    end if;
end;
    $$
language plpgsql;

--d. Checks some password for validity.

create function password(passw varchar) returns bool AS
$$
BEGIN
    IF (length(passw) > 6)

        then return true;
    else
        return false;
     END IF;

END;
$$ language plpgsql;

create or replace function output(a numeric, OUT square numeric, OUT cub numeric) RETURNS record as $$
    BEGIN
        square := a * a;
        cub := a * a * a;
    end;
    $$
language plpgsql;

--e. Returns two outputs, but has one input.

--Task - 3
--A procedures or function is a group or set of SQL and PL/SQL statements that perform a specific task."
--A function and procedure is a named PL/SQL Block which is similar .
--The major difference between a procedure and a function is, a function must always return a value,
--but a procedure may or may not return a value.
