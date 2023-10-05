<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String warMsg = (String)request.getAttribute("warMsg");
    String succMsg = (String)request.getAttribute("succMsg");
    String failMsg = (String)request.getAttribute("failMsg");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <title>Car Dekho-Create Account</title>


</head>

<body>
    <div class="container w-50 border text-center">
        <h1 class="text-warning">Car Dekho Application</h1>
        <img src="data:image/jpeg;base64,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"
            alt="">
            <%if(warMsg != null){ %>
            <h4 class="text-warning text-center"><%=warMsg %></h4>
            <%} else if(succMsg != null){%>
            <h4 class="text-success text-center"><%=succMsg %></h4>
            <%}else if(failMsg!= null){ %>
            <h4 class="text-danger text-center"><%=failMsg %></h4>
            <%} %>
        <h1 class="text-warning">Create Account</h1>
        <form action="./createAccount" method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Username</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username"
                    placeholder="Enter Username" required="required">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" name="password" required="required" min="6">
            </div>
            
            
            <div class="form-group">
                <p>Already Have An Account? <a class="text-decoration-none" href="http://localhost:8080/carmvc/createAccount">Login</a></p>
            </div>
            <input type="submit" class="btn btn-warning" value="Create Account"/>
        </form>
        
    </div>
   

</body>

</html>