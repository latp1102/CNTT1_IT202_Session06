create database ss06_b2;
use ss06_b2;

drop table if exists orders;
drop table if exists customers;

create table customers(
	customer_id int primary key,
    full_name varchar(255) not null,
    city varchar(255)
);

create table orders(
	order_id int primary key,
    customer_id int not null,
    order_date date,
    total_amount decimal(10,2),
    status enum('pending', 'completed', 'cancelled')
);

insert into customers
values(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'TP HCM'),
(3, 'Lê Văn Cường', 'Đà Nẵng'),
(4, 'Phạm Thị Dung', 'Hải Phòng'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

insert into orders
values(101, 1, '2025-01-01', 10000, 'completed'),
(102, 1, '2025-01-05', 20000, 'pending'),
(103, 2, '2025-01-03', 30000, 'completed'),
(104, 3, '2025-01-04', 40000, 'cancelled'),
(105, 3, '2025-01-06', 50000, 'completed');

select c.customer_id, c.full_name, SUM(o.total_amount) as total_spent
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, MAX(o.total_amount) as max_order_value
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, SUM(o.total_amount) as total_spent
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
order by total_spent desc;

