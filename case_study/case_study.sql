drop database if exists case_study;
create database if not exists case_study;
use case_study;
create table vi_tri(
id int primary key auto_increment,
`name` varchar (45)
);

create table trinh_do(
id int primary key auto_increment,
`name` varchar(45)
);

create table bo_phan(
id int primary key auto_increment,
`name` varchar(45)
);

create table nhan_vien(
id int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(id),
foreign key (ma_trinh_do) references trinh_do(id),
foreign key (ma_bo_phan) references bo_phan(id)
);

create table dich_vu_di_kem(
id int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(45) not null,
trang_thai varchar(45)
);

create table loai_khach(
id int  primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang(
id int primary key auto_increment,
ma_loai_khach_hang int,
foreign key (ma_loai_khach_hang) references loai_khach(id),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table loai_dich_vu(
id int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table kieu_thue(
id int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table dich_vu(
id int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int not null,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue(id),
foreign key (ma_loai_dich_vu) references loai_dich_vu(id),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);

create table hop_dong(
id int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(id), 
foreign key (ma_khach_hang) references khach_hang(id), 
foreign key (ma_dich_vu) references dich_vu(id)
);

create table hop_dong_chi_tiet(
id int primary key auto_increment,
ma_hop_dong int,
ma_dich_vu_di_kem int,
foreign key (ma_hop_dong) references hop_dong(id),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(id),
so_luong int not null
);

 
