<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="alert alert-danger text-center">
        <h3>❌ Failed to Add Tour!</h3>
        <p><%= request.getParameter("msg") != null ? request.getParameter("msg") : "Something went wrong." %></p>
        <a href="Tour.jsp" class="btn btn-warning mt-3">Try Again</a>
    </div>
</div>
</body>
</html>
