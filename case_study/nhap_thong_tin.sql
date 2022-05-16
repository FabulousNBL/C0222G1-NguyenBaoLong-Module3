use case_study;

 insert into loai_dich_vu (ten_loai_dich_vu) values ("Giuong Don, TV, Dieu Hoa"),("TV, Tu Lanh, Dieu Hoa, Giuong Doi"),("2 Giuong Don, Giat La, TV");
 
 insert into kieu_thue ( ten_kieu_thue) values ("Single"),("Double"),("Twin");

 insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu,
 tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang) values 
 ("Massage", 50, 30000.0, 2, 1, 2, 2 , 2 , 20, 3),
 ("Don Phong", 50, 20000.0, 1, 2, 1, 1, 1, 20, 2);
 
 insert into bo_phan (`name`) values ("Hanh Chinh"),("Phuc Vu"),("Quan Ly"),("Sale");
 
 insert into vi_tri (`name`) values ("Le Tan"),("Phuc Vu"),("Chuyen Vien"),("Giam Doc"),("Giam Sat"),("Quan Ly");
 
 insert into trinh_do (`name`) values ("Dai Hoc"),("Cao Dang"), ("Trung Cap"),("Sau Dai Hoc");
 
 insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) values
 ("Bao Long", "1997-12-24", "201782581", 8000, "0373959515", "nguyenblong2412@gmail.com", "Da Nang", 1,3,1),
 ("Xuan Huong", "1996-04-28", "201792592",8500, "0932565342", "xuanhuongabc@gmail.com", "Vinh Phuc", 2,2,2),
 ("Thu Trang", "2000-07-05", "2220165325", 7000, "0465987321", "thutrang@gmail.com", "Hue", 3,1,3),
 ("Kien Tran", "2000-07-05", "2221658745", 7000, "0545787989", "kientrang@gmail.com", "Hue", 1,1,4);
 
 insert into loai_khach (ten_loai_khach) values ("Diamond"),("platinium"), ("Gold"),("Silver"),("Member");
 
 insert into khach_hang (ma_loai_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) values
 (1, "Chien Tran", "1995-05-12", 1, "2222345621", "0656212323", "chien.tran@gmail.com", "Quang Binh"),
 (2, "Tien Vu", "1991-08-22", 1, "2015258852", "0154985569", "tien.vu@gmail.com", "Da Nang"),
 (3, "Hien Ho", "1998-11-05",0,"2145879632", "0132654987", "hien.codegym@gmail.com", "Hue");
 
 insert into dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai) values 
 ("Karaoke", 1500.0, "VND", "Co"),
 ("Thuc an", 2000.0, "VND", "Co"),
 ("Nuoc uong", 1500.0, "VND","Co"),
 ("Massage", 1500.0, "VND","Co"),
 ("Thue xe di chuyen", 1500.0, "VND","Co");
 
 insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,ma_nhan_vien, ma_khach_hang, ma_dich_vu) values 
  (current_time(), "2022-05-19 15:00:00", 50000, 4, 1,1),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,2,2),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,1,2),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,3,2),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,3,2),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,2,2),
 ("2022-05-10 10:15:56", "2022-05-15 16:00:00", 40000,1,2,2);
  
 insert into hop_dong_chi_tiet ( ma_hop_dong, ma_dich_vu_di_kem, so_luong) values 
  (1,1,2),(2,2,1);
 
 