<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        .box {
            display: inline-block;
            padding: 30px;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .bkid {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Booking Successful!</h2>
        <p>Your Booking ID is:</p>
        <p class="bkid"><%= request.getAttribute("bookingId") %></p>
    </div>
</body>
</html>