<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 30/05/2022
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
    <c:if test="${mess != null}">
        <span>${mess}</span>
    </c:if>
</p>

<p>
    <a href="/product">Back to product's list</a>
</p>

<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>
            Product Information
        </legend>

        <table>
            <tr>
                <td>Name:</td>
                <td>${product.getName()}</td>
            </tr>

            <tr>
                <td>Price:</td>
                <td>${product.getPrice()}</td>
            </tr>

            <tr>
                <td><input type="submit" value="Delete anyway"></td>
                <td><a href="/product">Back to product's list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
