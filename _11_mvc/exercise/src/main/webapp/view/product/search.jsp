<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 30/05/2022
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Search product by name</h1>
<p>
    <a href="/product">Back to product's list</a>
</p>

<table>
<%--    <tr>--%>
<%--        <td>Name:</td>--%>
<%--        <td><input type="text" value="Product's name"></td>--%>
<%--    </tr>--%>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
        </tr>
    </c:forEach>



</table>
</body>
</html>
