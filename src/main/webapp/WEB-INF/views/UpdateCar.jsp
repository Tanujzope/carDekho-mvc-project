<%@page import="com.jspiders.carmvc.pojo.CarPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="NavBar.jsp"/>
<% 
    String warMsg = (String)request.getAttribute("warMsg");
    String succMsg = (String)request.getAttribute("succMsg");
    String failMsg = (String) request.getAttribute("failMsg");
    List<CarPojo> cars = (List<CarPojo>)request.getAttribute("cars");
    CarPojo car = (CarPojo) request.getAttribute("car");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Car</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<div class="container w-50">
    <h2 class="text-center text-warning">Get Car</h2>
    <form id="removeCarForm" class="border border-warning p-5" action="./getCar" method="post">
        <div class="mb-3">
            <label for="carID" class="form-label text-warning">Car ID:</label>
            <input type="text" class="form-control" id="carID" name="id" placeholder="Enter Car ID" required>
        </div>
        <div class="d-flex justify-content-center align-items-center">
            <input type="submit" class="btn btn-warning" value="Get">
        </div>
    </form>
    <% if(warMsg != null) { %>
        <h3 class="text-warning text-center"><%= warMsg %></h3>
    <% } else if(succMsg != null) { %>
        <h3 class="text-success text-center"><%= succMsg %></h3>
    <% } else if(failMsg != null) { %>
        <h3 class="text-danger text-center"><%= failMsg %></h3>
    <% } %>
    <% if(car != null) { %>
        <div class="container mt-5">
            <h2 class="text-center text-warning">Update Car Details</h2>
            <form id="updateCarForm" class="border border-warning p-5" action="./update" method="post">
                <div class="mb-3">
                    <label for="carId" class="form-label text-warning">Car Id:</label>
                    <input type="text" class="form-control" id="carId" name="id" value="<%= car.getId() %>" readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="carName" class="form-label text-warning">Car Name:</label>
                    <input type="text" class="form-control" id="carName" name="name" value="<%= car.getName() %>">
                </div>
                <div class="mb-3">
                    <label for="carBrand" class="form-label text-warning">Car Brand:</label>
                    <input type="text" class="form-control" id="carBrand" name="brand" value="<%= car.getBrandName() %>">
                </div>
                <div class="mb-3">
                    <label for="fuelType" class="form-label text-warning">Fuel Type:</label>
                    <select class="form-select" id="fuelType" name="fuelType">
                        <option value="Petrol" <%= car.getFuelType().equals("Petrol") ? "selected" : "" %>>Petrol</option>
                        <option value="Diesel" <%= car.getFuelType().equals("Diesel") ? "selected" : "" %>>Diesel</option>
                        <option value="Electric" <%= car.getFuelType().equals("Electric") ? "selected" : "" %>>Electric</option>
                        <option value="CNG" <%= car.getFuelType().equals("CNG") ? "selected" : "" %>>CNG</option>
                        <option value="LPG" <%= car.getFuelType().equals("LPG") ? "selected" : "" %>>LPG</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="carPrice" class="form-label text-warning">Car Price:</label>
                    <input type="text" class="form-control" id="carPrice" name="price" value="<%= car.getPrice() %>">
                </div>
                <div class="d-flex justify-content-center align-items-center">
                    <input type="submit" class="btn btn-primary" value="Update">
                </div>
            </form>
        </div>
    <% } %>
    <% if(cars != null) { %>
        <h2 class="text-warning mt-5 text-center">Car's Details</h2>
        <table class="table border border-warning table-warning">
            <tr>
                <th>Id</th>
                <th>Car Name</th>
                <th>Car Brand</th>
                <th>Fuel Type</th>
                <th>Car Price</th>
            </tr>
            <% for(CarPojo carP: cars) { %>
                <tr>
                    <td><%= carP.getId() %></td>
                    <td><%= carP.getName() %></td>
                    <td><%= carP.getBrandName() %></td>
                    <td><%= carP.getFuelType() %></td>
                    <td><%= carP.getPrice() + "$" %></td>
                </tr>
            <% } %>
        </table>
    <% } %>
</div>
</body>
</html>
