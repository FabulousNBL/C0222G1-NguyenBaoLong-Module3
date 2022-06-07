<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02/06/2022
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2><a href="/customers">Back to users 's list</a></h2>
    <c:if test="${mess != null}">
        ${mess}
    </c:if>
    <form action="/customers?action=create" method="post">
        <table>
            <tr>
                <td>Mã khách hàng:</td>
                <td><input type="text" name="id"  placeholder="Nhập mã khách hàng" required></td>
                <c:if test="${validate.get('id') != null}">
      ${validate.get('id')}
                </c:if>
            </tr>
            <tr>
                <td>Loại khách hàng:</td>
                <td><select name="typeId" >
                    <option value="1">Diamond</option>
                    <option value="2">Platinum</option>
                    <option value="3">Gold</option>
                    <option value="4">Silver</option>
                    <option value="5">Member</option>
                </select></td>
                <c:if test="${validate.get('typeId')}">${validate.get('typeId')}</c:if>
            </tr>
            <tr>
                <td>Tên:</td>
                <td><input type="text" name="name" placeholder="Nhập tên khách hàng" required></td>
                <c:if test="${validate.get('name')}">${validate.get('name')}</c:if>
            </tr>
            <tr>
                <td>Năm sinh:</td>
                <td><input type="date" name="birthday" placeholder="Nhập năm sinh" required></td>
                <c:if test="${validate.get('birthday')}">
                    ${validate.get('birthday')}
                </c:if>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td><select name="gender" >
                    <option value="0">Nam</option>
                    <option value="1">Nữ</option>
                </select></td>
                <c:if test="${validate.get('gender')}">
                    ${validate.get('gender')}
                </c:if>
            </tr>

            <tr>
                <td>CMND/CCCD:</td>
                <td><input type="text" name="idCard" pattern="[0-9]{9}|[0-9]{12}" title="Định dạng đúng là các dãy số từ 0-9 bao gôm 9 hoặc 12 số" placeholder="Nhập CMND hoặc CCCD" required></td>
                <c:if test="${validate.get('idCard')}">
                    ${validate.get('idCard')}
                </c:if>
            </tr>
            <tr>
                <td>Số điện thoại:</td>
                <td><input type="text" name="phone" pattern="(090[0-9]{7})|(091[0-9]{7})|(\(84\)\+90[0-9]{7})|(\(84\)\
                +91[0-9]{7})" title="Bao gồm các số bắt đầu bằng 090, 091, (84)+ 90 hoặc (84)+ 91" placeholder="Nhập số điện thoại khách hàng" required></td>
                <c:if test="${validate.get('phone')}">
                    ${validate.get('phone')}
                </c:if>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" pattern="(([^<>()\[\]\\.,;:\s@']+(\.[^<>()\[\]\\.,;:\s@']+)*)|
                ('.+'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))"
                 title="inputsomething@gmail.com"   placeholder="Nhập email khách hàng" required></td>
                <c:if test="${validate.get('email')}">
                    ${validate.get('email')}
                </c:if>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input type="text" name="address" placeholder="Nhập địa chỉ khách hàng" required></td>
                <c:if test="${validate.get('address')}">
                    ${validate.get('address')}
                </c:if>
            </tr>
            <tr>
                <td>Status:</td>
                <td><select name="status" >
                    <option value="0">Còn</option>
                    <option value="1">Hết</option>
                </select></td>
                <c:if test="${validate.get('status')}">
                    ${validate.get('status')}
                </c:if>
            </tr>
            <tr>
                <button type="submit">Thêm mới</button>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
