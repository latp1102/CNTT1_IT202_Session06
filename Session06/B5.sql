create table ss06_b5;
use ss06_b5;

create table customers(
    customer_id int primary key,
    full_name varchar(255) not null,
    city varchar(255)
);

create table orders(
    order_id int primary key,
    customer_id int not null,
    order_date date,
    total_amount decimal(15,0),
    status enum('pending', 'completed', 'cancelled'),
    foreign key (customer_id) references customers(customer_id)
);

insert into customers
values(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'TP HCM'),
(3, 'Lê Văn Cường', 'Đà Nẵng');

insert into orders
values(101, 1, '2025-01-01', 4000000, 'completed'),
(102, 1, '2025-01-05', 3500000, 'completed'),
(103, 1, '2025-01-10', 3000000, 'completed'),

(104, 2, '2025-01-03', 2000000, 'completed'),
(105, 2, '2025-01-06', 1500000, 'completed'),

(106, 3, '2025-01-04', 6000000, 'completed'),
(107, 3, '2025-01-07', 5000000, 'completed'),
(108, 3, '2025-01-09', 2000000, 'completed');

select c.customer_id, c.full_name, COUNT(o.order_id) as total_orders, 
sum(o.total_amount) as total_spent,
avg(o.total_amount) as avg_order_value
from customers c join orders o on c.customer_id = o.customer_id
where o.status = 'completed'
group by c.customer_id, c.full_name
having COUNT(o.order_id) >= 3 and sum(o.total_amount) > 10000000
order by total_spent desc;

