
--1. Create a view named ‘customer_san_jose’ which comprises of only those
--customers who are from San Jose

create view Customer_san_jose as
select * from Customers
where city = 'san jose'

select * from Customer_san_jose


--2. Inside a transaction, update the first name of the customer to Francis
--where the last name is Jordan:
--a. Rollback the transaction
--b. Set the first name of customer to Alex, where the last name is
--Jordan
select * from Customers

begin transaction 
update  Customers set 
First_name='Francis' where 
Last_name=' Jordan'
commit transaction
rollback transaction

begin transaction 
update  Customers set 
First_name='Alex' where 
Last_name=' Jordan'
commit transaction


begin tran 
update Customers set First_name='Francis' where Last_name='Rai'
rollback tran


--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error
--message. 
begin try 
select 100/0 as error
end try 
begin catch
select 
ERROR_MESSAGE() as ErrorMessage
end catch




--4. Create a transaction to insert a new record to Orders table and save it

begin transaction 
insert into Customers values
(70,'Sam', 'Smith', 'Smith@gmail.com','19th street','Las vegas', 'Nevada', 646516)
commit transaction 