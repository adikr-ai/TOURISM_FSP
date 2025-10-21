<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Your Tour</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow mx-auto" style="max-width: 500px;">
        <div class="card-header text-white text-center" style="background-color: #0d6efd;">
            <h4 class="mb-0">BOOK YOUR TOUR</h4>
        </div>
        <div class="card-body">
            <form action="BookServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Tour ID:</label>
                    <input type="text" class="form-control" name="tid" placeholder="Enter the tour ID">
                </div>

                <div class="mb-3">
                    <label class="form-label">Hotel ID:</label>
                    <input type="text" class="form-control" name="hid" placeholder="Enter your hotel ID">
                </div>

                <div class="mb-3">
                    <label class="form-label">Room Type:</label>
                    <select name="rtype" class="form-select">
                        
                        <option value="AC">AC Room</option>
                        <option value="NAc">Non AC Room</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Booking Date:</label>
                    <input type="date" class="form-control" name="bkdt">
                </div>

                <div class="mb-3">
                    <label class="form-label">Username:</label>
                    <input type="text" class="form-control" name="uname" placeholder="Enter username">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">BOOK</button>
                </div>
                
              
    
	

        </div>
    </div>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    

</div>
 
    
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if (status == "success") {
		swal("Congrats" ," Booking Done" , "success")
	}
	
</script>
  
</body>
</html>