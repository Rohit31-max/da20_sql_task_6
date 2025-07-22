--create 3 views by where,group by,having and order by
---------------------------------------------------------------------------

select * from bank;

select * from employees;

select * from customers;

select * from account_openings;

select * from customer_features;

select * from transaction_details;
---------------------------------------------------------------------------
--view-1 saving_ac_type (where)

create view saving_ac_type as
select * from customers
where account_type = 'Savings'

select * from saving_ac_type;
------------------------------------------------------------------------------
--view-2-trans_amt_sum (group by)

select * from transaction_details;

create view trans_amt_sum as
select transaction_type, 
sum(amount)as sum_of_amt 
from transaction_details 
group by transaction_type;

select * from trans_amt_sum
----------------------------------------------------------------------------------------------
--view-3 (having)

select * from customer_features;

create view loan_amt as
select feature_name,
interest_rate,
sum(amount) 
from customer_features 
group by 
feature_name, interest_rate
having interest_rate > 6

 select * from loan_amt;
 ---------------------------------------------------------------------------------------
 ---view-4 (order by)

select * from transaction_details;

create view Deposit_Withdrawal as
select * from transaction_details 
where transaction_type 
in ('Deposit','Withdrawal') 
order by bank_id asc;

select * from Deposit_Withdrawal;
--------------------------------------------------------------------------------------------------------