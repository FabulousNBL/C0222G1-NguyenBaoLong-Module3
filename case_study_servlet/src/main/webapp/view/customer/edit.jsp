<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02/06/2022
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<a href="/customers">Back to customer's list</a>
<form action="/customers?action=edit" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="hidden" name="id" value="${id}"></td>
        </tr>
        <tr>
            <td>Customer's type id</td>
            <td><select name="typeId" >
                <option value="1">Diamond</option>
                <option value="2">Platinum</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select></td>
        </tr>
        <tr>
            <td>Customer's name</td>
            <td><input type="text" name="name" value="${name}"></td>
        </tr>
        <tr>
            <td>Customer's birthday</td>
            <td><input type="date" name="birthday" value="${birthday}"></td>
        </tr>
        <tr>
            <td>Customer's gender</td>
            <td><select name="gender" >
                <option value="0">Nam</option>
                <option value="1">Nữ</option>
            </select></td>
        </tr>
        <tr>
            <td>Customer's card id</td>
            <td><input type="text" name="idCard" value="${idCard}"></td>
        </tr>

        <tr>
            <td>Customer's phone</td>
            <td><input type="text" name="phone" value="${phone}"></td>
        </tr>
        <tr>
            <td>Customer 's email</td>
            <td><input type="text" name="email" value="${email}"></td>
        </tr>
        <tr>
            <td>Customer 's address</td>
            <td><input type="text" name="address" value="${address}"></td>
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
