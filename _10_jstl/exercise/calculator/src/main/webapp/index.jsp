<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 27/05/2022
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  </head>
  <body>
  <div class="container-fluid">
    <div class="row">

      <div class="col-md-4">
      </div>

      <div class="col-md-4">
        <form action="/calculator" method="post" style="display: flex;flex-wrap: wrap">

          <div class="col-md-6">
            <label for="firstNum">First Number</label><br>
            <label for="operator">Operator</label><br>
            <label for="secondNum">Second Number</label>
          </div>
          <div class="col-md-6">
            <input type="text" id="firstNum" name="firstNum" placeholder="FirstNumber">
            <select  id="operator" name="operator" >
              <option value="+">Additional</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
            <input type="text" id="secondNum" name="secondNum" placeholder="SecondNumber">
          </div>

          <button type="submit" class="btn btn-primary">Calculate</button>
        </form>
      </div>

      <div class="col-md-4">
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
