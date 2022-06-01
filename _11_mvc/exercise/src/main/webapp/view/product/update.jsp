<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 31/05/2022
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> </title>
</head>
<body>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>

<a href="/product">Back to product's list</a>

<form action="/product?action=update" method="post">
    <table>
        <tr>
            <td>Id Product</td>
            <td><input type="text" name="id" value="${requestScope["product"].getId()}"></td>
        </tr>
        <tr>
            <td>Product's name</td>
            <td><input type="text" name="name" value="${requestScope["product"].getName()}"></td>
        </tr>
        <tr>
            <td>Product's Price</td>
            <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
        </tr>
        <tr>
            <td><button type="submit">Edit</button></td>

        </tr>
    </table>
</form>
</body>
</html>
