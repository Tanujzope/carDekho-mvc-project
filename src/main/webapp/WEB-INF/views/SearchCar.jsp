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
    <title>Search Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container w-50 mt-5">
    	<% if(warMsg != null) { %>
        	<h3 class="text-warning text-center"><%= warMsg %></h3>
    	<% } else if(succMsg != null) { %>
        	<h3 class="text-success text-center"><%= succMsg %></h3>
   		 <% } else if(failMsg != null) { %>
        	<h3 class="text-danger text-center"><%= failMsg %></h3>
    	<% } %>
    	<% if(car != null) { %>
        <h2 class="text-warning mt-5 text-center">Car's Details</h2>
        <table class="table border border-warning table-warning">
            <tr>
                <th>Id</th>
                <th>Car Name</th>
                <th>Car Brand</th>
                <th>Fuel Type</th>
                <th>Car Price</th>
            </tr>
                <tr>
                    <td><%= car.getId() %></td>
                    <td><%= car.getName() %></td>
                    <td><%= car.getBrandName() %></td>
                    <td><%= car.getFuelType() %></td>
                    <td><%= car.getPrice() + "$" %></td>
                </tr>
        </table>
    <% } %>
    </div>
</body>
</html>
