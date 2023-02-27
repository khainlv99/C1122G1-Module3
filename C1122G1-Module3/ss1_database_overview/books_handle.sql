create database book_management;
use book_management;

create table books(
	id int primary key auto_increment,
    name varchar(45) null,
    page_size int null,
    author varchar(45) null
);

INSERT INTO books (name,page_size,author)
VALUES ('Toán', 45,'Nguyễn Thái Học');
INSERT INTO books (name,page_size,author)
VALUES ('Văn', 34,'Trần Mình Hoàng');
INSERT INTO books (name,page_size,author)
VALUES ('Sử', 56,'Dương Trung Quốc');
INSERT INTO books (name,page_size,author)
VALUES ('Địa', 76,'Lê Văn Hiến');
INSERT INTO books (name,page_size,author)
VALUES ('Hóa', 32,'Hà Văn Minh');

-- Cập nhật số trang page_size=50 với sách có title = "Sử"
SET SQL_SAFE_UPDATES = 0; -- fix lỗi 1175 để tắt chế độ an toàn
update books
set page_size = 50
where name='Sử';

-- Xoá sách có id =5
delete from books where id=5;

-- Xoá bảng books
drop table books;

-- Xoá cơ sở dữ liệu book_management
drop database book_management;
