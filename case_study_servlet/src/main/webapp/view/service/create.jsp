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
    <h1>Service Management</h1>
    <h2><a href="/service">Back to service 's list</a></h2>
    <c:if test="${mess != null}">
        ${mess}
    </c:if>
    <form action="/service?action=create" method="post">
        <table>
            <tr>
                <td>Mã dịch vụ:</td>
                <td><input type="text" name="id" placeholder="Nhập mã dịch vụ" required></td>
            </tr>
            <tr>
                <td>Tên dịch vụ:</td>
                <td><input type="text" name="name" placeholder="Nhập tên dịch vụ" required></td>
            </tr>
            <tr>
                <td>Diện tích:</td>
                <td><input type="text" name="area" placeholder="Nhập diện tích" required></td>
            </tr>
            <tr>
                <td>Chi phí thuê:</td>
                <td><input type="text" name="rentCost" placeholder="Nhập chi phí thuê" required></td>
            </tr>
            <tr>
                <td>Số lượng khách tối đa:</td>
                <td><input type="text" name="maxCustomer" placeholder="Nhập số lượng khách tối đa" required></td>
            </tr>

            <tr>
                <td>Mã kiểu thuê:</td>
                <td><input type="text" name="rentTypeId" placeholder="Nhập mã kiểu thuê" required></td>
            </tr>
            <tr>
                <td>Mã loại dịch vụ:</td>
                <td><input type="text" name="typeId" placeholder="Nhập mã loại dịch vụ" required></td>
            </tr>
            <tr>
                <td>Loại phòng:</td>
                <td><input type="text" name="standardRoom" placeholder="Nhập loại phòng" required></td>
            </tr>
            <tr>
                <td>Dịch vụ khác:</td>
                <td><input type="text" name="otherService" placeholder="Nhập dịch vụ khác" required></td>
            </tr>
            <tr>
                <td>Diện tích hồ bơi:</td>
                <td><input type="text" name="poolArea" placeholder="Nhập diện tích hồ bơi" required></td>
            </tr>
            <tr>
                <td>Số tầng:</td>
                <td><input type="text" name="floorNumber" placeholder="Nhập số tầng" required></td>
            </tr>
            <tr>
                <td>Tình trạng:</td>
                <td><input type="hidden" name="status" placeholder="Nhập tình trạng" required></td>
            </tr>
            <tr>
                <button type="submit">Thêm mới</button>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
