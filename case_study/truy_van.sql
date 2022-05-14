use case_study;

select * from nhan_vien where nhan_vien.ten like "t%" or "h%" or "k%" limit 0,15;

select * from khach_hang where year(khach_hang.ngay_sinh) < 2004  and year(khach_hang.ngay_sinh) >1972 and khach_hang.dia_chi = "Da Nang" or "Quang Tri"; ;