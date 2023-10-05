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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container w-50 mt-5">
        <h2 class="text-center text-warning">Remove Car</h2>
        <form id="removeCarForm" class="border border-warning p-5" action="./remove" method="post">
            <div class="mb-3">
                <label for="carID" class="form-label text-warning">Car ID:</label>
                <input type="text" class="form-control" id="carID" name="id" placeholder="Enter Car ID" required>
            </div>

            <div class="d-flex justify-content-center align-items-center">
                <input type="submit" class="btn btn-danger" value="Remove">
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
    
   <script>
    document.getElementById('removeCarForm').addEventListener('submit', function(event) {
        event.preventDefault();

        if (confirm("Are you sure you want to remove this car?")) {
            // The user confirmed, you can proceed with the form submission
            this.submit(); // Submit the form
        } else {
            // User canceled the removal
        }
    });
</script>
    
    

   
   

   
</body>
</html>
    