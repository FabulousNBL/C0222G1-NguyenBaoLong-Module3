use case_study;
-- 2. hiển thị tất cả nhân viên có tên bắt đầu bằng "t", "h" hoặc "k" và có tối đa 15 kí tự
SELECT *
FROM nhan_vien
WHERE (substring_index(ho_ten, ' ', -1) LIKE 't%' or substring_index(ho_ten, ' ', -1) LIKE 'h%' OR
 substring_index(ho_ten, ' ', -1) LIKE 'k%') AND length(ho_ten) <= 15;

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




