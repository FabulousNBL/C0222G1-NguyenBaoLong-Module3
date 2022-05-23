use case_study;

-- 2. hiển thị tất cả nhân viên có tên bắt đầu bằng "t", "h" hoặc "k" và có tối đa 15 kí tự
SELECT *
FROM nhan_vien
WHERE ((select substring_index(ho_ten, ' ', -1) LIKE 't%') or 
 (select substring_index(ho_ten, ' ', -1) LIKE 'h%') OR
 (select substring_index(ho_ten, ' ', -1) LIKE 'k%')) AND 
 (char_length(ho_ten) <= 15);
 
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where ((year(curdate())- year(ngay_sinh)) between 18 and 50) and 
(dia_chi = "Da Nang" or dia_chi = "Quang Tri"); 

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần 
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 

select c.ma_khach_hang, c.ho_ten, count(hd.ma_hop_dong) as so_lan_dat from hop_dong hd 
inner join khach_hang c on c.ma_khach_hang=hd.ma_khach_hang 
inner join loai_khach lk on lk.ma_loai_khach = c.ma_loai_khach_hang 
where lk.ten_loai_khach= 'Diamond'
group by c.ma_khach_hang order by so_lan_dat;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue+ (hdct.so_luong*dvdk.gia)) as 'Tổng chi phí'
from khach_hang kh
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong

left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
left join loai_khach lk on kh.ma_loai_khach_hang = lk.ma_loai_khach
group by kh.ho_ten;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng 
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from hop_dong hd
inner join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where quarter(hd.ngay_lam_hop_dong) =1)
;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2021 nhưng chưa từng được khách hàng đặt phòng trong năm 2022.

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv 
inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where (dv.ma_dich_vu in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong) = 2021))
and (dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong) = 2022));

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select distinct ho_ten from khach_hang;

select ho_ten from khach_hang group by ho_ten;

-- Mệnh đề/Toán tử UNION trong SQL được sử dụng để kết hợp kết quả của hai hoặc nhiều lệnh SELECT 
-- mà không trả về bất cứ bản sao nào của bản ghi.
select ho_ten from khach_hang 
union 
select ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2022 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select *, count(ma_khach_hang) as 'Số lượng khách' 
from hop_dong
where year(ngay_lam_hop_dong) = 2022 
group by month(ngay_lam_hop_dong);

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as 'Số lần sử dụng'
from hop_dong_chi_tiet hdct 
inner join hop_dong hd on hdct.ma_hop_dong= hd.ma_hop_dong
group by hd.ma_hop_dong;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và 
-- có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, lk.ten_loai_khach, kh.ho_ten
from hop_dong_chi_tiet hdct 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach_hang= lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi= "Da Nang" or kh.dia_chi= "Hue")
;

-- 12.	Hiển thị thông tin 
-- ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt 
-- vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as 'Số lượng dịch vụ đi kèm', hd.tien_dat_coc,hd.ngay_lam_hop_dong
from hop_dong_chi_tiet hdct 
right join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where (dv.ma_dich_vu in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)=2020 and quarter(ngay_lam_hop_dong)=4))
and (dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong) =2021 and quarter(hd.ngay_lam_hop_dong)<=2))
group by hd.ma_hop_dong
;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_lan_dat from hop_dong_chi_tiet hdct
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_lan_dat = (select sum(so_luong) from hop_dong_chi_tiet group by ma_dich_vu_di_kem order by sum(so_luong) desc limit 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet hdct 
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvdk.ten_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as 'so_lan_lap_hd'
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
where (year(hd.ngay_lam_hop_dong) between 2020 and 2021)
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select ma_nhan_vien from nhan_vien;
delete from nhan_vien nv where nv.ma_nhan_vien not in (select hd.ma_nhan_vien from hop_dong hd where year(ngay_lam_hop_dong) between 2019 and 2021);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view select_customer as
select kh.ma_khach_hang , kh.ho_ten, kh.dia_chi,lk.ten_loai_khach, sum(dv.chi_phi_thue+ hdct.so_luong*dvdk.gia) as tong_chi_phi 
from hop_dong_chi_tiet hdct 
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach_hang = lk.ma_loai_khach
where year(hd.ngay_lam_hop_dong) =2021
group by kh.ma_khach_hang
having tong_chi_phi > 10000000 and lk.ten_loai_khach ='Platinium';

select * from select_customer;
update khach_hang kh set ma_loai_khach_hang = 1 
where kh.ma_khach_hang in (select ma_khach_hang from select_customer
);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

delete from khach_hang where ma_khach_hang in (select ma_khach_hang from hop_dong where year(ngay_lam_hop_dong) <2021 );

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem dvdk set gia = gia*2 
where gia in (select gia from 
(select dvdk.* from hop_dong_chi_tiet hdct 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where hdct.so_luong >10 and year(hd.ngay_lam_hop_dong)=2020
) as temp) ;



-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien, nv.       ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
union all
select kh.ma_khach_hang, kh.ho_ten, kh.email,kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Đà Nẵng” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view view_nhan_vien as
select nv.* from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi  like "%Đà Nẵng" and
hd.ngay_lam_hop_dong like '2021-04-25%';

select * from nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy 
-- bởi khung nhìn này.

update view_nhan_vien set dia_chi = replace(dia_chi, "Yên Bái", "Hải Châu");

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào 
-- như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(ma_khach_hang int)
begin
delete from khach_hang kh where kh.ma_khach_hang = ma_khach_hang;
end //
delimiter ;

call sp_xoa_khach_hang(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và 
-- đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

