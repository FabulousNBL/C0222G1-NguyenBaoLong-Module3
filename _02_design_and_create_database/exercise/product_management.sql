create database if not exists product_management;
use product_management;
create table phieu_xuat(
so_px int primary key not null auto_increment,
ngay_xuat date
);

create table vat_tu(
id int auto_increment primary key not null,
ten_vattu varchar (50)
);

create table phieuxuat_vattu(
so_px int,
ma_vt int,
primary key (so_px,ma_vt),
foreign key (ma_vt) references vat_tu(id),
foreign key (so_px) references phieu_xuat(so_px),
don_gia_xuat int,
so_luong_xuat int
);
create table phieu_nhap(
so_pn int auto_increment primary key not null,
ngay_nhap date
);

create table nhap_vat_tu(
id_vat_tu int (30),
so_pn int,
primary key ( id_vat_tu,so_pn),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (id_vat_tu) references vat_tu(id),
don_gia_nhap double ,
so_luong_nhap int 
);


create table nha_cc(
id int auto_increment primary key not null,
ten_ncc varchar (50),
dia_chi varchar (100)
);

create table nhacc_sdt(
id_ncc int ,
foreign key (id_ncc) references nha_cc(id),
so_dt varchar (11)
);

create table don_dat_hang(
so_dh int auto_increment primary key not null,
ngay_dh date,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(id)
);

create table don_hang_vat_tu(
id_don_hang int,
id_vat_tu int,
foreign key (id_don_hang) references don_dat_hang(so_dh),
foreign key (id_vat_tu) references vat_tu(id)

);

-- drop database product_management; 