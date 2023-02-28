-- task 2:  Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
use furama;
select 
  * 
from 
  nhan_vien 
where 
  (
    ho_ten like 'H%' 
    or ho_ten like 'T%' 
    or ho_ten like 'K%'
  ) 
  and char_length(ho_ten)<= 15;
-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang 
where 
  (
    round(
      datediff(
        curdate(), 
        khach_hang.ngay_sinh
      )/ 365, 
      0
    )>= 18 
    and round(
      datediff(
        curdate(), 
        khach_hang.ngay_sinh
      )/ 365, 
      0
    )<= 50
  ) 
  and (
    (
      khach_hang.dia_chi like '%Đà Nẵng%'
    ) 
    or (
      khach_hang.dia_chi like '%Quảng Trị%'
    )
  );
-- task 4:Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  count(hd.ma_khach_hang) 'total' 
from 
  khach_hang kh 
  join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach 
  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
where 
  lk.ma_loai_khach = 1 
group by 
  kh.ma_khach_hang 
order by 
  count(hd.ma_khach_hang);
-- task 5:Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  loai_khach.ten_loai_khach, 
  hop_dong.ma_hop_dong, 
  dich_vu.ten_dich_vu, 
  hop_dong.ngay_lam_hop_dong, 
  hop_dong.ngay_ket_thuc, 
  sum(
    ifnull(dich_vu.chi_phi_thue, 0)+ ifnull(hop_dong_chi_tiet.so_luong, 0)* ifnull(dich_vu_di_kem.gia, 0)
  ) as total 
from 
  khach_hang 
  left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
  left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
  left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu 
  left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
  left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
group by 
  ma_hop_dong 
order by 
  ma_khach_hang asc, 
  ma_hop_dong desc;
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;

