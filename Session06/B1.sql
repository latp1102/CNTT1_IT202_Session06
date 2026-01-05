create database ss06_b1;
use ss06_b1;
drop table if exists orders;
drop table if exists customers;
create table customers(
	customer_id int primary key,
    full_name VARCHAR(255) not null,
    city varchar(255)
);

create table orders(
	order_id int primary key,
    customer_id int not null,
    order_date date,
    status enum('pending', 'completed', 'cancelled')
);

insert into customers
values(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'TP HCM'),
(3, 'Lê Văn Cường', 'Đà Nẵng'),
(4, 'Phạm Thị Dung', 'Hải Phòng'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

insert into orders
values(101, 1, '2025-01-01', 'completed'),
(102, 1, '2025-01-05', 'pending'),
(103, 2, '2025-01-03', 'completed'),
(104, 3, '2025-01-04', 'cancelled'),
(105, 3, '2025-01-06', 'completed');

select o.order_id, c.full_name, o.order_date, o.status
from orders o join customers c on o.customer_id = c.customer_id;

select c.customer_id, c.full_name, COUNT(o.order_id) as total_orders
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;
