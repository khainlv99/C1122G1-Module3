use quan_ly_ban_hang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id,
       oder_date,
       order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT customer.customer_id, customer.customer_name, `order`.oder_date, product.product_name, order_detail.od_QTY
FROM customer
JOIN `order` ON customer.customer_id = `order`.customer_id
JOIN order_detail ON `order`.order_id = order_detail.order_id
JOIN product ON order_detail.product_id = product.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT customer_id, customer_name FROM customer
WHERE customer_id not in (SELECT customer_id FROM `order`); 

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn
SELECT `order`.order_id,
       `order`.oder_date,
       sum(order_detail.od_qty*product.product_price)
FROM `order`
JOIN order_detail ON `order`.order_id = order_detail.order_id
JOIN product ON order_detail.product_id = product.product_id
group by `order`.order_id;