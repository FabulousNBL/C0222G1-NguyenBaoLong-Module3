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
            <form action="/discount" method="post" style="display: flex;flex-wrap: wrap">
                <div class="col-md-6">
                    <label for="product1">Product description</label><br>
                    <label for="price1">Price</label><br>
                    <label for="discount1">Discount percent</label>
                </div>
                <div class="col-md-6">
                    <input type="text" id="product1" name="product1" placeholder="Description">
                    <input type="text" id="price1" name="price1" placeholder="Price">
                    <input type="text" id="discount1" name="discount1" placeholder="Discount">
                </div>
                <button type="submit" class="btn btn-primary">Discount</button>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/discount" method="post" style="display: flex;flex-wrap: wrap">
                <div class="col-md-6">
                    <label for="product2">Product description</label><br>
                    <label for="price2">Price</label><br>
                    <label for="discount2">Discount percent</label>
                </div>
                <div class="col-md-6">
                    <input type="text" id="product2" name="product2" placeholder="Description">
                    <input type="text" id="price2" name="price2" placeholder="Price">
                    <input type="text" id="discount2" name="discount2" placeholder="Discount">
                </div>
                <button type="submit" class="btn btn-primary">Discount</button>
            </form>
        </div>

        <div class="col-md-4" style="display: flex;flex-wrap: wrap">
            <form action="/discount" method="post" style="display: flex;flex-wrap: wrap">
                <div class="col-md-6">
                    <label for="product3">Product description</label><br>
                    <label for="price3">Price</label><br>
                    <label for="discount3">Discount percent</label>
                </div>
                <div class="col-md-6">
                    <input type="text" id="product3" name="product3" placeholder="Description">
                    <input type="text" id="price3" name="price3" placeholder="Price">
                    <input type="text" id="discount3" name="discount3" placeholder="Discount">
                </div>
                <button type="submit" class="btn btn-primary">Discount</button>
            </form>
        </div>
        </form>
    </div>
</div>
<form action="">

</form>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
