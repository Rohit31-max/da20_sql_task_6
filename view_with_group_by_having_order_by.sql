--- view with join with group by having order by
---------------------------------------------------------------------------
--refernce tables

select * from bank;

select * from employees;

---------------------------------------------------------------------------
--view-1 bank_emp (join with group by)

create view 
bank_emp as
select b.bank_name,
       b.branch_name,
       e.emp_id,
       e.emp_name,
       e.position,
       e.salary
from bank as b
inner join 
employees as e
on b.bank_id = e.bank_id 
group by b.bank_name,b.branch_name, e.emp_id, e.emp_name,e.position,e.salary

select * from bank_emp;
---------------------------------------------------------------------------
--view 2 (group by having)

create view 
avg_emp_salary as
select b.bank_name,
       e.emp_name,
       avg(e.salary) 
from bank as b
inner join 
employees as e
on b.bank_id = e.bank_id 
group by b.bank_name,e.emp_name
having avg(e.salary) > 800000

select * from avg_emp_salary;
---------------------------------------------------------------------------
--view-3 (order by)

create view 
est_date_order as
select b.bank_name,
       b.established_year,
       e.salary,
	   e.bank_id
from bank as b
left join 
employees as e
on b.bank_id = e.bank_id 
order by b.established_year asc 

select * from est_date_order
---------------------------------------------------------------------------