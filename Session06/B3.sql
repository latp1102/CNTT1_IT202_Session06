create table ss06_b3;
use ss06_b3;

create table orders(
	order_id int primary key,
    order_date date,
    total_amount decimal(10,2),
    status enum('pending', 'completed', 'cancelled')
);

insert into orders
values(101, '2025-01-01', 10000, 'completed'),
(102, '2025-01-05', 20000, 'pending'),
(103, '2025-01-03', 30000, 'completed'),
(104, '2025-01-04', 40000, 'cancelled'),
(105, '2025-01-06', 50000000, 'completed');

select order_date, sum(total_amount) as total_revenue
from orders
where status = 'completed'
group by order_date;

select order_date, count(total_amount) as total_orders
from orders
where status = 'completed'
group by order_date;

select order_date, sum(total_amount) as total_revenue
from orders
where status = 'completed'
group by order_date
having sum(total_amount) > 10000000;

