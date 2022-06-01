<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 01/06/2022
  Time: 9:18 AM
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
    <h1>User Management</h1>
    <h2><a href="/users">Back to users 's list</a></h2>
    <c:if test="${mess != null}">
        ${mess}
    </c:if>
    <form action="/users?action=create" method="post">
        <table>
            <tr>
                <td>Tên:</td>
                <td><input type="text" name="name" placeholder="Nhập tên người dùng"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" placeholder="Nhập email người dùng"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" placeholder="Nhập quốc tịch"></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><input type="text" name="status" placeholder="Nhập tình trạng"></td>
            </tr>
            <tr>
                <button type="submit">Thêm mới</button>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
