use library;

-- Thông kê các đầu sách được mượn nhiều nhất
select max(muon)
from(SELECT books.name, COUNT(book_id) AS muon
FROM borrows
JOIN books ON borrows.book_id = books.id
GROUP BY book_id
ORDER BY muon DESC) as max;

-- Thống kê các đầu sách chưa từng được mượn--
select books.name,books.id,count(books.id) as muon 
from borrows
join books on books.id = borrows.book_id
group by books.id
having muon = (
select count(books.id) as muon from borrows
join books on books.id = borrows.book_id
group by books.id
order by muon desc limit 0
);
-- Thống kê các đầu sách chưa được mượn --
select books.name,books.id
from borrows
inner join books on books.id = borrows.book_id
where  not exists (select books.id where curdate() between borrows.borrow_date and borrows.return_date)
group by books.id;

select books.name,books.id
from books
left join borrows on books.id=borrows.book_id 
where borrows.book_id not in (select borrows.book_id from borrows where curdate() between borrows.borrow_date and borrows.return_date)
group by books.id;

-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ					
select name, count(borrows.id) as muon 
from students 
join borrows on students.id = borrows.student_id
where students.id
group by students.name
order by muon desc;

-- - Lấy ra các học viên mượn sách nhiều nhất của thư viện				
select name, count(borrows.id) as muon
from students 
join borrows on students.id = borrows.student_id
group by students.name
order by muon desc limit 2;