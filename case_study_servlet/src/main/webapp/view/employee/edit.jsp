<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 05/06/2022
  Time: 11:13 AM
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
    <c:if test="${mess!=null}">
    <p>${mess}</p>
    </c:if>
    <a href="/employee">Back to customer's list</a>
<form action="/employee?action=edit" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="hidden" name="id" value="${id}" required></td>
        </tr>
        <tr>
            <td>Employee 's name</td>
            <td><input type="text" name="name" value="${name}" required></td>
        </tr>
        <tr>
            <td>Employee 's birthday</td>
            <td><input type="date" name="birthday" value="${birthday}" required></td>
        </tr>
        <tr>
            <td>Employee 's card id</td>
            <td><input type="text" name="cardId" value="${cardId}" required></td>
        </tr>
        <tr>
            <td>Employee's salary</td>
            <td><input type="text" name="salary" value="${salary}" required></td>
        </tr>
        <tr>
            <td>Employee's phone</td>
            <td><input type="text" name="phone" value="${phone}" required></td>
        </tr>


        <tr>
            <td>Employee 's email</td>
            <td><input type="text" name="email" value="${email}" required></td>
        </tr>
        <tr>
            <td>Employee 's address</td>
            <td><input type="text" name="address" value="${address}" required></td>
        </tr>
        <tr>
            <td>Employee 's position</td>
            <td><select name="positionId" >
                <option value="1">Quản lý</option>
                <option value="2">Nhân viên</option>
            </select></td>
        </tr>
        <tr>
            <td>Employee 's education degree</td>
            <td><select name="degreeId" >
                <option value="1">Trung cấp</option>
                <option value="2">Cao đẳng</option>
                <option value="3">Đại học</option>
                <option value="4">Sau đại học</option>
            </select></td>
        </tr>
        <tr>
            <td>Employee 's division</td>
            <td><select name="divisionId" >
                <option value="1">Sale-Marketing</option>
                <option value="2">Hành chính</option>
                <option value="3">Phục vụ</option>
                <option value="4">Quản lý</option>
            </select></td>
        </tr>
        <tr>
            <td>Employee 's user name</td>
            <td><input type="text" name="userName" value="${userName}" required></td>
        </tr>
        <tr>
            <td>Customer 's status</td>
            <td><select name="status" >
                <option value="0">Còn</option>
                <option value="1">Hết</option>
            </select></td>
        </tr>

        <tr>
            <td><button type="submit">Edit</button></td>

        </tr>
    </table>
</form>
</center>
</body>
</html>
