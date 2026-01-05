create table ss06_b4;
use ss06_b4;

drop table if exists order_items;
drop table if exists products;

create table products (
    product_id int primary key,
    product_name VARCHAR(255) not null,
    price DECIMAL(10,2) 
);

create table order_items (
    order_id int,
    product_id int,
    quantity int not null,
    primary key (order_id, product_id),
    foreign key (product_id) references products(product_id)
);

insert into products 
values(1, 'Laptop', 15000000),
(2, 'Chuột', 300000),
(3, 'Bàn phím', 800000),
(4, 'Tai nghe', 1200000),
(5, 'Màn hình', 5000000);

insert into order_items 
values(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 1, 2),
(104, 5, 1),
(105, 4, 3);

select p.product_id, p.product_name, SUM(o.quantity) as total_sold
from products p join order_items o on p.product_id = o.product_id
group by p.product_id, p.product_name;

select p.product_id, p.product_name, SUM(o.quantity * p.price) as revenue
from products p
join order_items o on p.product_id = o.product_id
group by p.product_id, p.product_name;

select p.product_id, p.product_name, SUM(o.quantity * p.price) as revenue
from products p
join order_items o on p.product_id = o.product_id
group by p.product_id, p.product_name
having SUM(o.quantity * p.price) > 5000000;

select p.product_id, p.product_name, avg(o.quantity * p.price) as avg_order_value
from products p
join order_items o on p.product_id = o.product_id
group by p.product_id, p.product_name;
