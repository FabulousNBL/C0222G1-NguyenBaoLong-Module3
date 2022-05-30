<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 30/05/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<fieldset>
    <legend>Product information</legend>
    <table>
        <tr>
            <td>Name:</td>
            <td>${product.getName()}</td>
        </tr>

        <tr>
            <td>Price:</td>
            <td>${product.getPrice()}</td>
        </tr>
    </table>
</fieldset>
</body>
</html>
