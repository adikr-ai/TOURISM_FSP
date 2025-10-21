<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Allotment</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url("https://imgs.search.brave.com/hezLgnxTe68nBjANo4LGJ0gH0eRMyqPWTH2-3gQJ9Ic/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9ob3Rl/bC1yb29tLWJlYXV0/aWZ1bC1vcmFuZ2Ut/c29mYS1pbmNsdWRl/ZC00MzY0MjMzMC5q/cGc") 
                        no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .btn, .input-field {
            margin: 10px;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
        }
        .btn {
            background-color: #2d89ef;
            color: white;
            cursor: pointer;
            width: 200px;
        }
        .btn:hover {
            background-color: #1a5bb8;
        }
        form {
            background: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
<div class="container">
    <form action="AllotmentServlet" method="post">
        <input class="input-field" type="text" name="tourId" placeholder="Enter Tour ID" required><br>
        <input class="input-field" type="text" name="hotelId" placeholder="Enter Hotel ID" required><br>
        <button type="submit" class="btn">Allotment</button>
    </form>
</div>
</body>
</html>
