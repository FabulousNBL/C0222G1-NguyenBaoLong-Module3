<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 30/05/2022
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/view/product/create.jsp">Thêm mới</a></p>

<form action="/product" method="get">
    <input type="text" placeholder="Product's name" name="name">
    <input type="hidden" value="search" name="action">
    <input type="submit" value="Search">
</form>
<%--<form action="/product?action=search" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td>Name</td>--%>
<%--            <td><input type="text" name="name" id="name"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <td><input type="submit" value="Search"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<table border="1" style="border-collapse: collapse">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
    </tr>
    <c:forEach items="${products}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.price}</td>
            <td><a href="/product?action=delete&id=${product.getId()}"> delete</a></td>
            <td><a href="/product?action=update&id=${product.getId()}"> update</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
