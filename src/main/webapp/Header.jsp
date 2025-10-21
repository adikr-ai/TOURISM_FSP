<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getAttribute("pageTitle") != null ? request.getAttribute("pageTitle") : "Admin Panel" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }
        .overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: -1;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.7);
        }
        .container-glass {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 20px;
            max-width: 600px;
            margin: auto;
            color: #fff;
        }
        .btn-gradient {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            border: none;
            color: #fff;
        }
        .btn-gradient:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
        }
        table {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="AdminMenu.jsp">Travel Admin Panel</a>
    </div>
</nav>
<div class="container my-5">
