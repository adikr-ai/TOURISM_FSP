<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour Delete</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-danger text-white text-center py-3">
            <h2 class="mb-0 fw-bold">Delete Tour</h2>
        </div>
        <div class="card-body">

            
            <%
                String message = request.getParameter("message");
                String type = request.getParameter("type"); // e.g. success, danger
                if (message != null && type != null) {
            %>
                <div class="alert alert-<%= type %> alert-dismissible fade show" role="alert">
                    <%= message %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <%
                }
            %>

            <form action="${pageContext.request.contextPath}/TourDeleteServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">TOURID:</label>
                    <input type="text" name="tourId" class="form-control" placeholder="Enter Tour ID" required>
                </div>

                <div class="text-center">
                    <input type="submit" value="DELETE" class="btn btn-danger px-4">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
