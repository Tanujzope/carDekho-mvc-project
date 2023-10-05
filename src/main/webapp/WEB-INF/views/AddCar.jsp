<%@page import="com.mysql.cj.xdevapi.Table"%>
<%@page import="com.jspiders.carmvc.pojo.CarPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="NavBar.jsp"/>
    <%String warMsg = (String)request.getAttribute("warMsg");
    String succMsg = (String)request.getAttribute("succMsg");
    String failMsg = (String) request.getAttribute("failMsg");
    List<CarPojo> cars = (List<CarPojo>)request.getAttribute("cars");%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="ISO-8859-1">
    <title>Add Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
   
    </head>
    <body>
     
    <div class="container mt-5 w-50">
        <h2 class="text-center text-warning">Add Car</h2>
        <form class="form border border-warning p-5" action="./add" method="post">
            <div class="mb-3">
                <label for="carName" class="form-label text-warning">Car Name:</label>
                <input type="text" class="form-control" id="carName" name="carname" placeholder="Enter Car Name" required>
            </div>

            <div class="mb-3">
                <label for="carBrand" class="form-label text-warning">Car Brand:</label>
                <input type="text" class="form-control" id="carBrand" name="carbrand" placeholder="Enter Car Brand" required>
            </div>

            <div class="mb-3">
                <label for="fuelType" class="form-label text-warning">Select Fuel Type:</label>
                <select class="form-select" id="fuelType" name="fueltype" required>
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                    <option value="Electric">Electric</option>
                    <option value="CNG">CNG</option>
                    <option value="LPG">LPG</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="carPrice" class="form-label text-warning">Price ($):</label>
                <input type="number" class="form-control" id="carPrice" placeholder="Enter Price" name="carprice" required>
            </div>

            <div class="d-flex justify-content-center align-items-center">
              <input type="submit" class="btn btn-warning w-25" value="Add">
          </div>
        </form>
        
         <%if(warMsg != null){ %>
            <h3 class="text-warning text-center"><%=warMsg %></h3>
            <%} else if(succMsg != null){%>
            <h3 class="text-success text-center"><%=succMsg %></h3>
            <%}else if(failMsg!= null){ %>
            <h3 class="text-danger text-center"><%=failMsg %></h3>
            <%} %>
            <%if(cars!= null){ %>
    			<h2 class="text-warning mt-5 text-center">Car's Details</h2>
            	<table class="table border border-warning table-warning">
            		<tr>
            			<th>Id</th>
            			<th>Car Name</th>
            			<th>Car Brand</th>
            			<th>Fuel Type</th>
            			<th>Car Price</th>
            		</tr>
            		<%for(CarPojo car: cars){ %>
            		<tr>
            			<td><%=car.getId() %></td>
            			<td><%=car.getName() %></td>
            			<td><%=car.getBrandName() %></td>
            			<td><%=car.getFuelType() %></td>
            			<td><%=car.getPrice()+ "$" %></td>
            		</tr>
          			<%} %>
            	</table>
            	<%} %>    
    </div>
    


      


    </body>
    </html>
    
