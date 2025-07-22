-- views by multi join,cte,subquery
---------------------------------------------------------------------------

select * from bank;

select * from employees;

select * from customers;

select * from account_openings;

select * from customer_features;

select * from transaction_details;
---------------------------------------------------------------------------
--view-1 bank_cust_emp (multi join)

create view bank_cust_emp as
select b.bank_id,b.bank_name
,b.branch_name,b.city,
c.full_name,c.gender,
c.account_type,c.balance,
e.emp_id,e.emp_name,
e.position,e.salary
from bank as b
inner join 
customers as c on
b.bank_id=c.bank_id
inner join
employees as e on
e.bank_id = b.bank_id

select * from bank_cust_emp;
----------------------------------------------------------------------------------------
--view-2 state_bank_name (cte)

create view state_axis_bank
as
with Maharashtra_axis_bank
as(select * from bank where state ='Maharashtra') 
select * from Maharashtra_axis_bank
where bank_name ='Axis Bank';

select * from state_axis_bank
---------------------------------------------------------------------------
--view-3 ac_type_current (subquery)

create view ac_type_current as
select * from customers as c
where customer_id in(
select customer_id 
from customers where account_type ='Current')

select * from ac_type_current
---------------------------------------------------------------------------