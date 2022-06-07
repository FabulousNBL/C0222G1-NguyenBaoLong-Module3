<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02/06/2022
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Employee Management</h1>
    <h2><a href="/employee">Back to employee 's list</a></h2>
    <c:if test="${mess != null}">
        ${mess}
    </c:if>
    <form action="/employee?action=create" method="post">
        <table>
            <tr>
                <td>Mã nhân viên:</td>
                <td><input type="text" name="id" placeholder="Nhập mã nhân viên"
                pattern="NV-[0-9]{4}" title="Nhập sai định dạng" required></td>
            </tr>
            <tr>
                <td>Tên nhân viên:</td>
                <td><input type="text" name="name" placeholder="Nhập tên nhân viên" required></td>
            </tr>
            <tr>
                <td>Ngày sinh:</td>
                <td><input type="date" name="birthday" placeholder="Nhập ngày sinh" required></td>
            </tr>
            <tr>
                <td>Mã thẻ:</td>
                <td><input type="text" name="cardId" placeholder="Nhập mã thẻ" required></td>
            </tr>
            <tr>
                <td>Lương:</td>
                <td><input type="text" name="salary" placeholder="Nhập lương" required></td>
            </tr>

            <tr>
                <td>Số điện thoại:</td>
                <td><input type="text" name="phone" placeholder="Nhập số điện thoại"required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" placeholder="Nhập email" required></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input type="text" name="address" placeholder="Nhập địa chỉ" required></td>
            </tr>
            <tr>
                <td>Mã vị trí:</td>
                <td><select name="positionId" >
                    <option value="1">Quản lý</option>
                    <option value="2">Nhân viên</option>
                </select></td>
            </tr>
            <tr>
                <td>Mã bằng cấp:</td>
                <td><select name="degreeId" >
                    <option value="1">Trung cấp</option>
                    <option value="2">Cao đẳng</option>
                    <option value="3">Đại học</option>
                    <option value="4">Sau đại học</option>
                </select></td>
            </tr>
            <tr>
                <td>Mã cấp bậc:</td>
                <td><select name="divisionId" >
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select></td>
            </tr>
            <tr>
                <td>Tên đăng nhập:</td>
                <td><input type="text" name="userName" placeholder="Nhập tên đăng nhập" required ></td>
            </tr>
            <tr>
                <td>Mật khẩu:</td>
                <td><input type="password" name="password" placeholder="Nhập mật khẩu" required></td>
            </tr>
            <tr>
                <td>Tình trạng:</td>
                <td><select name="status" >
                    <option value="0">Còn</option>
                    <option value="1">Hết</option>
                </select></td>
            </tr>
            <tr>
                <button type="submit">Thêm mới</button>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
