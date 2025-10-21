<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Admin Menu");
%>
<jsp:include page="Header.jsp" />
<link rel="stylesheet" href="style.css">

<div class="container-glass">
    <h2 class="fw-bold mb-4 text-center">Admin Menu</h2>
    <table class="table table-bordered table-hover text-center">
        <thead>
        <tr>
            <th>Action</th>
            <th>Link</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Add Tour</td>
            <td><a href="Tour.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Delete Tour</td>
            <td><a href="TourDel.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Update Tour</td>
            <td><a href="TourUpdate.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Add Hotel</td>
            <td><a href="AddHotel.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Update Hotel</td>
            <td><a href="UpdHotel.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Delete Hotel</td>
            <td><a href="DelHotel.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        <tr>
            <td>Link TourHotel</td>
            <td><a href="TourHotel.jsp" class="btn btn-gradient btn-sm">Go</a></td>
        </tr>
        </tbody>
    </table>
</div>

<jsp:include page="Footer.jsp" />
