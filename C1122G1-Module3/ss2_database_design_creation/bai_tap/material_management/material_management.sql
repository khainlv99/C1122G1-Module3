create database quan_ly_vat_tu;
use quan_ly_vat_tu;
create table phieu_xuat
(
	so_phieu_xuat int not null auto_increment primary key,
	ngay_xuat datetime not null
);
create table vat_tu
(
	ma_vat_tu int not null auto_increment primary key,
	ten_vat_tu varchar(50) not null
);

create table chi_tiet_phieu_xuat
(
	so_phieu_xuat int not null auto_increment primary key,
	don_gia_xuat varchar(100) not null,
	so_luong_xuat int not null,
	ma_vat_tu int not null,
	foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
	foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_nhap
(
	so_phieu_nhap int not null auto_increment primary key,
	ngay_nhap datetime not null
);
create table chi_tiet_phieu_nhap
(
	ma_vat_tu int not null auto_increment primary key,
	so_phieu_nhap int not null,
	don_gia_nhap varchar(100) not null,
	so_luong_nhap int not null,
	foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
	foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table don_dat_hang
(
	so_don_hang int not null auto_increment primary key,
	ngay_dat_hang datetime not null
);

create table chi_tiet_dat_hang
(
	ma_vat_tu int not null auto_increment primary key,
	so_don_hang int not null,
	foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
	foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);

create table nha_cung_cap
(
	ma_nha_cung_cap int not null auto_increment primary key,
	ten_nha_cung_cap varchar(100) not null,
	dia_chi varchar(255) not null
);

create table sdt_nha_cung_cap
(
	ma_nha_cung_cap int not null auto_increment primary key,
	SDT varchar(20) not null,
	foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table cung_cap
(
	so_don_hang int not null auto_increment primary key,
	ma_nha_cung_cap int not null,
	foreign key(so_don_hang) references don_dat_hang(so_don_hang),
	foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);