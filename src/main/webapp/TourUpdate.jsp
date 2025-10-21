<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour Update</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-warning text-dark text-center py-3">
            <h2 class="mb-0 fw-bold">Update Tour</h2>
        </div>
        <div class="card-body">

            <!-- ✅ Show success/error messages -->
            <%
                String message = request.getParameter("message");
                String type = request.getParameter("type"); // success or danger
                if (message != null && type != null) {
            %>
                <div class="alert alert-<%= type %> alert-dismissible fade show" role="alert">
                    <%= message %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <%
                }
            %>

            <form action="${pageContext.request.contextPath}/TourUpdateServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">TOUR ID:</label>
                    <input type="text" name="tourId" class="form-control" required>
                </div>

                <div class="mb-3 row">
                    <div class="col-md-6">
                        <label class="form-label">START DATE:</label>
                        <input type="date" name="startDate" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">END DATE:</label>
                        <input type="date" name="endDate" class="form-control" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">PRICE:</label>
                    <input type="number" name="price" class="form-control" required>
                </div>

                <div class="text-center">
                    <input type="submit" value="UPDATE" class="btn btn-primary px-4">
                </div>

            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
