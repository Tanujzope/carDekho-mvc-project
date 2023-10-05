<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Dekho</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        .hovlight:hover{
        
            color:#ffc107 !important ;
            background-color: #f8f9fa;
            transition: 0.6s;
        }
        #hovred:hover{
            color: #ffc107 !important;
            background-color: #dc3545;
            transition: 0.6s;
        }
    </style>
</head>
<body>

    
    
     <nav class="nav justify-content-around border-secondary bg-warning">    
    <span class="container d-flex" style="width: 500px">  
      <a class="nav-link text-center hovlight text-light m-2 p-3 border border-light rounded-4  " href="./home" aria-current="page">Home</a>
      <a class="nav-link text-center hovlight text-light m-2 p-3 border border-light rounded-4  " href="./add">Add Car</a>
      <a class="nav-link text-center hovlight text-light m-2 p-3 border border-light rounded-4  " href="./update">Update Car</a>
      <a class="nav-link text-center hovlight text-light m-2 p-3 border border-light rounded-4  " href="./remove">Remove Car</a>
      </span>
      <form class="d-flex align-items-center m-3" role="search" action="./search" method="get">
        <input class="form-control me-2" type="search" placeholder="Enter Car ID" aria-label="Search" name="id">
        <button class="btn btn-outline-light" type="submit">SEARCH</button>
      </form>
      <a class="nav-link text-danger m-2 p-3 border border-danger rounded-4 " id="hovred" href="./logout">Logout</a>    
    </nav>
    
     
    
    
    
</body>
</html>
