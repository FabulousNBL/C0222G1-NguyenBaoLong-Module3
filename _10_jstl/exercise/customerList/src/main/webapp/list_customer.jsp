<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 27/05/2022
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <style>

    </style>
</head>
<body>
<table style="border: 1px">
    <h2>Danh sách khách hàng</h2>
    <tr>
        <th>Tên</th>

        <th>Ngày sinh</th>

        <th>Địa chỉ</th>

        <th>Ảnh</th>

    </tr>
    <c:forEach items="${listCustomer}" var="customer" >
    <tr>
        <td>${customer.name}</td>

        <td>${customer.dob}</td>

        <td>${customer.address}</td>

        <td><img src="${customer.pic}" alt="" style="width: 200px;height: 100px"></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
