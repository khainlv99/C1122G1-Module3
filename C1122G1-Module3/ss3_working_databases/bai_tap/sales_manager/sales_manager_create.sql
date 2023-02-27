create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer (
    customer_id int primary key not null auto_increment,
    customer_name varchar(50) not null,
    customer_age int
);
insert into customer values(1,'Minh Quan',10);
insert into customer values(2,'Ngoc Oanh',20);
insert into customer values(3,'Hong Ha',50);
select * from customer;

create table `order` (
    order_id int primary key not null auto_increment,
    customer_id int not null,
    oder_date datetime,
    order_total_price int,
    foreign key (customer_id) references customer (customer_id)
); 
insert into `order`(order_id, customer_id, oder_date) values(1,1,20060321);
insert into `order`(order_id, customer_id, oder_date) values(2,2,20060323); 
insert into `order`(order_id, customer_id, oder_date) values(3,1,20060316);
select * from `order`;
create table `product`(
	product_id int primary key not null auto_increment,
    product_name varchar(50) not null,
    product_price int default 0
);
insert into product values(1,'May Giat',3);
insert into product values(2,'Tu Lanh',5);
insert into product values(3,'Dieu Hoa',7);
insert into product values(4,'Quat',1);
insert into product values(5,'Bep Dien',2);
select * from `product`;
create table order_detail (
    order_id int not null,
    product_id int not null,
    od_QTY int default 0,
    primary key (order_id , product_id),
    foreign key (order_id) references `order` (order_id),
    foreign key (product_id) references `product` (product_id)
);
insert into order_detail values(1,1,3);
insert into order_detail values(1,3,7);
insert into order_detail values(1,4,2);
insert into order_detail values(2,1,1);
insert into order_detail values(3,1,8);
insert into order_detail values(2,5,4);
insert into order_detail values(2,3,3);
select * from order_detail;

drop database quan_ly_ban_hang;