<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 26/05/2022
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="productCss.css">
</head>
<body>
<h1>Product Description</h1>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-4">
        </div>

        <div class="col-md-4">
            <form action="/discount" method="post" style="display: flex;flex-wrap: wrap">

                <div class="col-md-6">
                    <label for="product">Product description</label><br>
                    <label for="price">Price</label><br>
                    <label for="discount">Discount percent</label>
                </div>


                <div class="col-md-6">
                    <input type="text" id="product" name="product" placeholder="Description"
                           value="${Product}">
                    <input type="text" id="price" name="price" placeholder="Price" value="${Price}">
                    <input type="text" id="discount" name="discount" placeholder="Discount" value="${Discount}">
                </div>

                <button type="submit" class="btn btn-primary">Discount</button>
            </form>
        </div>

        <div class="col-md-4">
            Discount Amount: ${DiscountAmount}
        </div>

    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
