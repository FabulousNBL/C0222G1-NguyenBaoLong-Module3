<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02/06/2022
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/dbc3483aca.js" crossorigin="anonymous"></script>
</head>
<body>
<center>
    <h1>Service Management</h1>
    <h2>
        <a href="/service?action=create">Add New Service</a>
    </h2>

    <form action="/service?action=search" method="get">
        <input  hidden type="text" name="action" value="search">
        <input type="text" name="services" placeholder="nhập tên">
        <select name="types">
            <option value="">Chọn loại dịch vụ</option>
            <c:forEach items="${types}" var="type">
                <option value="${type.id}">${type.name}</option>
            </c:forEach>
        </select>
        <select name="rentTypes">
            <option value="">Chọn kiểu thuê</option>
            <c:forEach items="${rentTypes}" var="rentType">
                <option value="${rentType.id}">${rentType.name}</option>
            </c:forEach>
        </select>
        <button type="submit">Search</button>
    </form>
</center>
<div align="center">
    <table border="1" cellpadding="5" id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
        <thead>

        <c:if test="${mess!=null}">
            ${mess}
        </c:if>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Area</th>
            <th>Price</th>
            <th>Customer 's amount</th>
            <th>Rent Type</th>
            <th>Service Type</th>
            <th>Room Type</th>
            <th>Other Service</th>
            <th>Pool's Area</th>
            <th>Floor</th>
            <th colspan="2">Role</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="service" items="${serviceList}">
            <c:if test="${service.status==0}">
                <tr>
                    <td>${service.serviceId}</td>
                    <td>${service.serviceName}</td>
                    <td>${service.serviceArea}</td>
                    <td>${service.serviceCost}</td>
                    <td>${service.maxCustomer}</td>
                   <c:if test="${service.rentTypeId==1}"><td>Năm</td></c:if>
                   <c:if test="${service.rentTypeId==2}"><td>Tháng</td></c:if>
                   <c:if test="${service.rentTypeId==3}"><td>Ngày</td></c:if>
                   <c:if test="${service.rentTypeId==4}"><td>Giờ</td></c:if>
                   <c:if test="${service.serviceTypeId==1}"><td>Villa</td></c:if>
                   <c:if test="${service.serviceTypeId==2}"><td>House</td></c:if>
                   <c:if test="${service.serviceTypeId==3}"><td>Room</td></c:if>
                    <td>${service.standardRoom}</td>
                    <td>${service.otherService}</td>
                    <td>${service.poolArea}</td>
                    <td>${service.floorNumber}</td>
                    <td>${service.status}</td>

<%--                    <td>--%>
<%--                        <a href="/service?action=edit&id=${customer.id}&typeId=${customer.typeId}&name=${customer.name}--%>
<%--                        &birthday=${customer.birthday}&gender=${customer.gender}&idCard=${customer.idCard}--%>
<%--                        &phone=${customer.phone}&email=${customer.email}&address=${customer.address}--%>
<%--                        &status=${customer.status}"><button type="button" class="btn btn-primary">Edit</button></a>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#h${customer.id}" style="width: auto">--%>
<%--                            Delete--%>
<%--                        </button>--%>

<%--                        <!-- Modal -->--%>
<%--                        <div class="modal fade" id="h${customer.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--                            <div class="modal-dialog" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        <p>Bạn có muốn xóa?</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                                        <a href="/customers?action=delete&id=${customer.id}">--%>
<%--                                            <button type="button" class="btn btn-primary">Delete</button>--%>
<%--                                        </a>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </td>--%>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%--<script src="datatables/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $('#tableStudent').dataTable({--%>
<%--            "dom":'lrtip',--%>
<%--            "lengthChange": false,--%>
<%--            "pageLength":5--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</html>
