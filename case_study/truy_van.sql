use case_study;

-- 2. hiển thị tất cả nhân viên có tên bắt đầu bằng "t", "h" hoặc "k" và có tối đa 15 kí tự
SELECT *
FROM nhan_vien
WHERE ((select substring_index(ho_ten, ' ', -1) LIKE 't%') or 
 (select substring_index(ho_ten, ' ', -1) LIKE 'h%') OR
 (select substring_index(ho_ten, ' ', -1) LIKE 'k%')) AND 
 (length(ho_ten) <= 30);
 
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where ((year(curdate())- year(ngay_sinh)) between 18 and 50) and 
(dia_chi = "Da Nang" or dia_chi = "Quang Tri"); 

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần 
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 

select c.id, c.ho_ten, count(hd.id) as so_lan_dat from hop_dong hd 
inner join khach_hang c on c.id=hd.ma_khach_hang 
inner join loai_khach lk on lk.id = c.ma_loai_khach_hang 
where lk.ten_loai_khach= 'Diamond'
group by c.id order by so_lan_dat;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.id, kh.ho_ten, lk.ten_loai_khach, hd.id, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue+ hdct.so_luong*dvdk.gia) as 'Tổng chi phí'
from hop_dong_chi_tiet hdct
inner join dich_vu_di_kem dvdk on dvdk.id= hdct.ma_dich_vu_di_kem
inner join hop_dong hd on hd.id=hdct.ma_hop_dong
inner join dich_vu dv on dv.id = hd.ma_dich_vu
right join khach_hang kh on hd.ma_khach_hang= kh.id
inner join loai_khach lk on lk.id = kh.ma_loai_khach_hang
group by kh.ho_ten;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng 
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.id, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from hop_dong hd
inner join dich_vu dv on dv.id = hd.ma_dich_vu
inner join loai_dich_vu ldv on ldv.id = dv.ma_loai_dich_vu
where dv.id not in (select hd.ma_dich_vu from hop_dong hd where quarter(hd.ngay_lam_hop_dong) =1)
;
