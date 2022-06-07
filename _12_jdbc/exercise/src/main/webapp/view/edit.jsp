<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 01/06/2022
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<a href="/users">Back to product's list</a>
<form action="/users?action=edit" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="hidden" name="id" value="${id}"></td>
        </tr>
        <tr>
            <td>User's name</td>
            <td><input type="text" name="name" value="${name}"></td>
        </tr>
        <tr>
            <td>User 's email</td>
            <td><input type="text" name="email" value="${email}"></td>
        </tr>
        <tr>
            <td>User 's country</td>
            <td><input type="text" name="country" value="${country}"></td>
        </tr>
        <tr>
            <td>User 's status</td>
            <td><input type="text" name="status" value="${status}"></td>
        </tr>

        <tr>
            <td><button type="submit">Edit</button></td>

        </tr>
    </table>
</form>

</body>
</html>
