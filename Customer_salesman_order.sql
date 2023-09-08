use mydb_1;

-- Write a SQL statement to prepare a list with salesman name, customer name and their cities for the 
-- salesmen and customer who belongs to the same city.   

select salesman.name,customer.cust_name,salesman.city from salesman inner join customer on salesman.city=customer.city;


-- Write a SQL statement to make a list with order no, purchase amount, 
-- customer name and their cities for those orders which order amount between 500 and 2000

select orders.order_no, orders.purch_amt, customer.cust_name,
customer.city from orders inner join customer on orders.customer_id=
customer.cusomer_id having purch_amt between 500 and 2000;

-- Write a SQL statement to know which salesmen are working for which customer.

select salesman.name, customer.cust_name
from salesman inner join customer on
salesman.salesman_id=customer.salesman_id 
inner join orders on salesman.salesman_id=orders.salesman_id
group by salesman.salesman_id,salesman.name, customer.cust_name;

-- Write a SQL statement to find the list of customers who appointed a salesman for their jobs who 
-- gets a commission from the company is more than 12%.

select salesman.commission, customer.cust_name
from salesman inner join customer on
salesman.salesman_id=customer.salesman_id 
inner join orders on salesman.salesman_id=orders.salesman_id
group by salesman.salesman_id,salesman.name, customer.cust_name
having commission > 0.12;

-- Write a SQL statement to find the list of customers who appointed a salesman for their jobs 
-- who does not live in the same city where their customer lives, and gets a commission is above 12%

select salesman.name,salesman.city, customer.cust_name,customer.City,salesman.commission
from salesman inner join customer on
salesman.salesman_id=customer.salesman_id 
inner join orders on salesman.salesman_id=orders.salesman_id
group by salesman.name,salesman.city, customer.cust_name,customer.City,salesman.commission
having commission > 0.12 and customer.City <> salesman.city;

-- Write a SQL statement to make a list in ascending order 
-- for the customer who works either through a salesman or by own.

select customer.cust_name,salesman.name,salesman.salesman_id 
from customer left join salesman 
on customer.salesman_id = salesman.salesman_id order by cust_name asc;

-- Write a SQL statement to make a list in ascending order for the salesmen who works 
-- either for one or more customer or not yet join under any of the customers.

select salesman.name, salesman.salesman_id, customer.cust_name from 
salesman left join customer on 
customer.salesman_id = salesman.salesman_id 
order by salesman.name asc;








