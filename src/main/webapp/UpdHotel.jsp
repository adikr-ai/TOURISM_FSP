<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Update Hotel");
%>
<jsp:include page="Header.jsp" />
<link rel="stylesheet" href="style.css">

<div class="container-glass">
    <h2 class="fw-bold mb-4 text-center">Update Hotel</h2>
    <form method="post" action="UpdateHotelServlet">
        <div class="mb-3">
            <label class="form-label">Hotel ID</label>
            <input type="text" class="form-control" name="hotelId" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Hotel Name</label>
            <input type="text" class="form-control" name="hotelName">
        </div>
        <div class="mb-3">
            <label class="form-label">Tour Place</label>
            <input type="text" class="form-control" name="tplace">
        </div>
        <button type="submit" class="btn btn-gradient w-100">Update Hotel</button>
    </form>
</div>

<jsp:include page="Footer.jsp" />
