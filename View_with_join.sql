---- 3 view with joins
---------------------------------------------------------------------------
--Tables from Bank_database

select * from bank

select * from employees

select * from customers

select * from account_openings

select * from customer_features

select * from transaction_details
---------------------------------------------------------------------------
--view 1

create view bank_with_employees as
select b.bank_id, 
       b.bank_name,
       b.branch_name,
       b.city,
       e.emp_id,
       e.emp_name,
       e.position 
from bank as b
inner join employees as e 
on b.bank_id = e.bank_id;

select * from bank_with_employees;
---------------------------------------------------------------------------
--view 2

create view customer_bank_info as
select c.customer_id,
       c.full_name,
       c.account_type,
       c.balance,
       b.bank_name,
       b.branch_name,
       b.city,
       b.ifsc_code 
from customers as c 
inner join bank as b
on c.bank_id = b.bank_id;

select * from customer_bank_info;
---------------------------------------------------------------------------
--view 3

create view cust_trans_detail as
select c.customer_id,
       c.full_name,
       c.gender,
       t.transaction_id,
       t.bank_id,
       t.amount,
       t.transaction_type
from customers as c
inner join transaction_details as t
on c.customer_id = t.customer_id;

select * from cust_trans_detail;
---------------------------------------------------------------------------