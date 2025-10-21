<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH TOURS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow mx-auto" style="max-width: 900px;">
        
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">SEARCH TOURS AVAILABLE</h4>
        </div>
        
        <div class="card-body">
            <form action="" method="post">
                <div class="mb-3">
                    <label class="form-label">Tour Name:</label>
                    <input type="text" class="form-control" name="tname" placeholder="Enter the tour name">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">SEARCH</button>
                </div>
            </form>
        </div>
        
        <%
            String tname = request.getParameter("tname");
            if (tname != null && !tname.trim().equals("")) {
                Connection cn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourdb", "root", "aditya09");
                    
                    String sql = "SELECT * FROM tour WHERE tourName LIKE ?";
                    ps = cn.prepareStatement(sql);
                    ps.setString(1, "%" + tname + "%");
                    rs = ps.executeQuery();
        %>
        
        <div class="table-responsive p-3">
            <table class="table table-hover table-striped table-bordered mb-0">
                <thead class="table-dark text-center">
                    <tr>
                        <th>Tour ID</th>
                        <th>Tour Name</th>
                        <th>State</th>
                        <th>Cities</th>
                        <th>Travel Mode</th>
                        <th>Accommodation</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Price (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                    %>
                        <tr class="text-center">
                            <td><%= rs.getString("tourId") %></td>
                            <td><%= rs.getString("tourName") %></td>
                            <td><%= rs.getString("state") %></td>
                            <td><%= rs.getString("cities") %></td>
                            <td><%= rs.getString("travelMode") %></td>
                            <td><%= rs.getString("accommodation") %></td>
                            <td><%= rs.getDate("startDate") %></td>
                            <td><%= rs.getDate("endDate") %></td>
                            <td><%= rs.getBigDecimal("price") %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <%
                } catch (Exception e) {
                    out.println("<p class='text-danger text-center'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (cn != null) cn.close();
                }
            }
        %>
    </div>
</div>

</body>
</html>
