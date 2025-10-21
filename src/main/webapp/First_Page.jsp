<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tourism View Page</title>
    <style>
        /* Background Styling */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            text-align: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(120deg, rgba(79,172,254,0.85), rgba(0,242,254,0.85)),
                        url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80') no-repeat center center / cover;
            background-blend-mode: overlay;
            animation: gradientShift 15s ease infinite;
        }

        /* Animated Gradient Effect */
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        header {
            padding: 20px;
            font-size: 2em;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.3);
            box-shadow: 0px 4px 8px rgba(0,0,0,0.4);
        }
        .container {
            margin: 30px auto;
            max-width: 1000px;
            background-color: rgba(255, 255, 255, 0.12);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.3);
        }
        .room-image img {
            width: 100%;
            max-height: 350px;
            border-radius: 10px;
            object-fit: cover;
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }
        .room-image img:hover {
            transform: scale(1.05);
            box-shadow: 0px 8px 25px rgba(0,0,0,0.5);
        }
        .places-booked {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .place {
            background-color: rgba(255, 255, 255, 0.15);
            padding: 10px;
            border-radius: 8px;
            width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .place:hover {
            transform: translateY(-8px);
            box-shadow: 0px 8px 25px rgba(0,0,0,0.5);
        }
        .place img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }
        .place img:hover {
            transform: scale(1.08);
        }
        .buttons {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            font-size: 16px;
            color: white;
            background: linear-gradient(45deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.3);
        }
        .btn:hover {
            transform: scale(1.08);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.5);
        }
    </style>
</head>
<body>

<header>
    Welcome to Our Tourism Portal
</header>

<div class="container">





    <!-- Room Image -->
    <div class="room-image">
        <img src="https://images.unsplash.com/photo-1600585152220-90363fe7e115" alt="Hotel Room">
    </div>

    <!-- Booked Places -->
    <h2 style="margin-top: 30px;">Places Booked</h2>
    <div class="places-booked">
        <div class="place">
            <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e" alt="Beach">
            <p>Sunny Beach Resort</p>
        </div>
        <div class="place">
            <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb" alt="Mountain">
            <p>Mountain Adventure</p>
        </div>
        <div class="place">
            <img src="https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1" alt="City">
            <p>City Tour Package</p>
        </div>
    </div>

    <!-- Buttons -->
    <div class="buttons">
     <!-- Buttons -->
<div class="buttons">
    <a href="Login.jsp" class="btn">Login</a>
    <a href="Register.jsp" class="btn">Register</a>
    <a href="Booking.jsp" class="btn">Booking</a>
</div>
    </div>
</div>

</body>
</html>