<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tourism Webpage</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.6);
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 40px;
            letter-spacing: 2px;
            color: #ffdd57;
            text-shadow: 2px 2px 8px black;
        }

        .btn {
            background: white;        /* Changed from yellow */
            color: black;             /* Text color black */
            border: none;
            padding: 15px 30px;
            margin: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            width: 250px;
        }

        .btn:hover {
            background: #f0f0f0;      /* Light gray hover */
            color: black;
            transform: scale(1.05);
            box-shadow: 0px 4px 10px rgba(0,0,0,0.4);
        }
    </style>
</head>
<body>
    <div class="overlay">
        <h1>Explore Your Next Adventure</h1>
        <form action="SearchTour.jsp">
            <button type="submit"  class="btn">Search Tour</button>
            
        </form>
        <form action="Booking.jsp">
            <button type="submit" class="btn">Booking</button>
        </form>
        <form action="Bookingdetails.jsp">
            <button type="submit" class="btn">Booking Details</button>
        </form>
    </div>
</body>
</html>
