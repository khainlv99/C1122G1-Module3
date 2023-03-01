use `library`;
-- Tạo index cho cột  title của bảng books--
create index index_name on books(name);
drop index index_name on books;

-- Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn--
create view view_borows_book as select books.name, count(borrows.id) as `muon`
from books
join borrows on books.id= borrows.book_id
group by books.name
order by muon asc;

-- stored procedure thêm mới book trong database với tham số kiểu IN--
delimiter //
create procedure add_books(in id int, name_book varchar(50),in page_size int,in author_id int,in category_id int
)
begin
insert into books(id, name, page_size, author_id, category_id) values (id,name_book,page_size,author_id,category_id);
end // 
delimiter ;
insert into books(id, name, page_size, author_id, category_id) values (1,'Khai',20,1,2);
call add_books(2,'Khai1',20,1,2);