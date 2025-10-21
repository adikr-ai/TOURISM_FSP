<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Travel Agency</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            
            background: 
                linear-gradient(45deg, rgba(13, 110, 253, 0.3), rgba(25, 135, 84, 0.3)),
                linear-gradient(135deg, rgba(255, 193, 7, 0.2), rgba(220, 53, 69, 0.2)),
                url('https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
        }

        .travel-animation {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
            pointer-events: none;
        }

        .floating-travel-icons {
            position: absolute;
            font-size: 2.5rem;
            color: rgba(255, 255, 255, 0.2);
            animation: travel-float 12s ease-in-out infinite;
        }

        .floating-travel-icons:nth-child(1) {
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-travel-icons:nth-child(2) {
            top: 20%;
            right: 15%;
            animation-delay: 3s;
        }

        .floating-travel-icons:nth-child(3) {
            bottom: 20%;
            left: 20%;
            animation-delay: 6s;
        }

        .floating-travel-icons:nth-child(4) {
            bottom: 15%;
            right: 20%;
            animation-delay: 9s;
        }

        .floating-travel-icons:nth-child(5) {
            top: 50%;
            left: 5%;
            font-size: 2rem;
            animation-delay: 1.5s;
        }

        .floating-travel-icons:nth-child(6) {
            top: 60%;
            right: 8%;
            font-size: 1.8rem;
            animation-delay: 4.5s;
        }

        @keyframes travel-float {
            0%, 100% { 
                transform: translateY(0px) translateX(0px) rotate(0deg); 
                opacity: 0.2;
            }
            25% { 
                transform: translateY(-30px) translateX(20px) rotate(90deg); 
                opacity: 0.4;
            }
            50% { 
                transform: translateY(-60px) translateX(-10px) rotate(180deg); 
                opacity: 0.3;
            }
            75% { 
                transform: translateY(-20px) translateX(-30px) rotate(270deg); 
                opacity: 0.5;
            }
        }

        .bg-shapes {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: shape-drift 15s linear infinite;
        }

        .bg-shapes:nth-child(7) {
            width: 120px;
            height: 120px;
            top: 15%;
            left: -60px;
            animation-delay: 0s;
        }

        .bg-shapes:nth-child(8) {
            width: 80px;
            height: 80px;
            top: 60%;
            right: -40px;
            animation-delay: 5s;
        }

        .bg-shapes:nth-child(9) {
            width: 100px;
            height: 100px;
            bottom: 10%;
            left: -50px;
            animation-delay: 10s;
        }

        @keyframes shape-drift {
            0% { transform: translateX(0) rotate(0deg); }
            100% { transform: translateX(calc(100vw + 200px)) rotate(360deg); }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.2),
                0 0 0 1px rgba(255, 255, 255, 0.2);
            overflow: hidden;
            width: 90%;
            max-width: 420px;
            backdrop-filter: blur(20px);
            border: 2px solid rgba(255, 255, 255, 0.3);
            z-index: 2;
            position: relative;
        }

        .header {
            background: 
                linear-gradient(135deg, rgba(32, 201, 151, 0.9), rgba(13, 110, 253, 0.9)),
                url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80') center/cover;
            padding: 45px 30px;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 30%, rgba(255,255,255,0.1) 50%, transparent 70%);
            animation: header-shine 4s ease-in-out infinite;
        }

        @keyframes header-shine {
            0%, 100% { transform: translateX(-100%); }
            50% { transform: translateX(100%); }
        }

        .header h1 {
            font-size: 2.8rem;
            margin-bottom: 12px;
            font-weight: 700;
            position: relative;
            z-index: 1;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header p {
            opacity: 0.95;
            font-size: 1.2rem;
            position: relative;
            z-index: 1;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .form-container {
            padding: 45px 35px;
            background: rgba(255, 255, 255, 0.98);
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 0.95rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #20c997;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 18px 50px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(248, 249, 250, 0.8);
        }

        input[type="email"]:focus, input[type="password"]:focus {
            outline: none;
            border-color: #20c997;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 0 0 4px rgba(32, 201, 151, 0.15);
        }

        input[type="email"]:focus + i, input[type="password"]:focus + i {
            color: #0d6efd;
            transform: translateY(-50%) scale(1.1);
        }

        .login-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #20c997, #0d6efd);
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(32, 201, 151, 0.3);
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(32, 201, 151, 0.4);
        }

        .login-btn:active {
            transform: translateY(-1px);
        }

        .divider {
            text-align: center;
            margin: 30px 0;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(to right, transparent, rgba(32, 201, 151, 0.3), transparent);
        }

        .divider span {
            background: rgba(255, 255, 255, 0.98);
            padding: 0 20px;
            color: #666;
            font-size: 0.95rem;
            font-weight: 500;
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
        }

        .register-link a {
            color: #0d6efd;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: #20c997;
            text-decoration: underline;
        }

        .loading-spinner {
            width: 20px;
            height: 20px;
            border: 2px solid #f3f3f3;
            border-top: 2px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @media (max-width: 480px) {
            .container {
                width: 95%;
                margin: 15px;
            }
            
            .form-container {
                padding: 35px 25px;
            }
            
            .header {
                padding: 35px 25px;
            }
            
            .header h1 {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <div class="travel-animation">
        <i class="fas fa-plane floating-travel-icons"></i>
        <i class="fas fa-map-marked-alt floating-travel-icons"></i>
        <i class="fas fa-camera floating-travel-icons"></i>
        <i class="fas fa-compass floating-travel-icons"></i>
        <i class="fas fa-mountain floating-travel-icons"></i>
        <i class="fas fa-ship floating-travel-icons"></i>
        <div class="bg-shapes"></div>
        <div class="bg-shapes"></div>
        <div class="bg-shapes"></div>
    </div>

    <div class="container">
        <div class="header">
            <h1><i class="fas fa-globe-americas"></i> Travel Agency</h1>
            <p>Discover Your Next Adventure</p>
        </div>
        
        <div class="form-container">
            <form action="LoginProcess" method="post" id="loginForm">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" required placeholder="Enter your password">
                    </div>
                </div>
                
                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> Sign In
                </button>
            </form>
            
            <div class="divider">
                <span>or continue with</span>
            </div>
            
            <div class="register-link">
                <p>Don't have an account?
                <a href="Register.jsp">Create one now </a> </p>
                
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
    

<script type="text/javascript">
var status = document.getElementById("status").value;
if (status == "failed") {
swal("Sorry" ," Wrong Username or Password" , "error")
}
</script>
</body>
</html>
  