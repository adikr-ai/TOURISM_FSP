<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOKING DETAILS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow mx-auto" style="max-width: 900px;">
        
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">BOOKING DETAILS</h4>
        </div>
        
        <div class="card-body">
            <form action="" method="post">
                <div class="mb-3">
                    <label class="form-label">Tour ID:</label>
                    <input type="text" class="form-control" name="tid" placeholder="Enter the tour id" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">SEARCH</button>
                </div>
            </form>
        </div>
        
        <%
            String tid = request.getParameter("tid");
            if (tid != null && !tid.trim().equals("")) {
                Connection cn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                boolean hasResults = false;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourdb", "root", "aditya09");
                    
                    String sql = "SELECT * FROM booking WHERE tid LIKE ?";
                    ps = cn.prepareStatement(sql);
                    ps.setString(1, "%" + tid + "%");
                    rs = ps.executeQuery();
        %>
        
        <div class="alert alert-info text-center">
            <strong>Search Results for Tour ID:</strong> <%= tid %>
        </div>
        
        <div class="table-responsive p-3">
            <table class="table table-hover table-striped table-bordered mb-0">
                <thead class="table-dark text-center">
                    <tr>
                        <th>Tour ID</th>
                        <th>Hotel ID</th>
                        <th>Room Type</th>
                        <th>Booking Date</th>
                        <th>User Name</th>
                        <th>Booking ID</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                            hasResults = true;
                    %>
                        <tr class="text-center">
                            <td><%= rs.getString("tid") %></td>
                            <td><%= rs.getString("hid") %></td>
                            <td><%= rs.getString("rtype") %></td>
                            <td><%= rs.getString("bkdt") %></td>
                            <td><%= rs.getString("uname") %></td>
                            <td><%= rs.getString("bkid") %></td>
                        </tr>
                    <%
                        }
                        
                        // If no results found
                        if (!hasResults) {
                    %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">
                                No booking records found for Tour ID: <%= tid %>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <%
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger text-center'>Database driver not found: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger text-center'>Database error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (cn != null) cn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
        
        

</body>
</html>
