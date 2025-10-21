<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Travel Agency</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* Beautiful travel destination background with multiple layers */
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

        /* Animated travel elements */
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

        /* Animated background shapes */
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
            max-width: 450px;
            backdrop-filter: blur(20px);
            border: 2px solid rgba(255, 255, 255, 0.3);
            z-index: 2;
            position: relative;
        }

        .header {
            background: 
                linear-gradient(135deg, rgba(255, 107, 107, 0.9), rgba(254, 202, 87, 0.9)),
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

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
            width: 100%;
            padding: 18px 50px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(248, 249, 250, 0.8);
        }

        input[type="text"]:focus, input[type="email"]:focus, 
        input[type="password"]:focus, input[type="tel"]:focus {
            outline: none;
            border-color: #20c997;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 0 0 4px rgba(32, 201, 151, 0.15);
        }

        input[type="text"]:focus + i, input[type="email"]:focus + i, 
        input[type="password"]:focus + i, input[type="tel"]:focus + i {
            color: #0d6efd;
            transform: translateY(-50%) scale(1.1);
        }

        /* Enhanced Professional Create Account Button */
        .register-btn {
            width: 100%;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #6c5ce7 100%);
            color: white;
            border: none;
            border-radius: 16px;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s ease;
            margin-top: 20px;
            position: relative;
            overflow: hidden;
            box-shadow: 
                0 8px 25px rgba(102, 126, 234, 0.4),
                0 4px 12px rgba(118, 75, 162, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        /* Animated gradient background */
        .register-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg, 
                transparent, 
                rgba(255, 255, 255, 0.3), 
                transparent
            );
            transition: left 0.8s ease;
        }

        .register-btn:hover::before {
            left: 100%;
        }

        /* Hover effects */
        .register-btn:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 
                0 15px 35px rgba(102, 126, 234, 0.5),
                0 8px 20px rgba(118, 75, 162, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
            background: linear-gradient(135deg, #7c3aed 0%, #8b5cf6 50%, #a855f7 100%);
        }

        /* Active state */
        .register-btn:active {
            transform: translateY(-2px) scale(1.01);
            box-shadow: 
                0 10px 25px rgba(102, 126, 234, 0.4),
                0 5px 15px rgba(118, 75, 162, 0.3);
        }

        /* Pulsing animation effect */
        .register-btn::after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(135deg, #667eea, #764ba2, #6c5ce7);
            border-radius: 18px;
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .register-btn:hover::after {
            opacity: 0.7;
            animation: pulse-border 2s infinite;
        }

        @keyframes pulse-border {
            0% {
                transform: scale(1);
                opacity: 0.7;
            }
            50% {
                transform: scale(1.05);
                opacity: 0.3;
            }
            100% {
                transform: scale(1);
                opacity: 0.7;
            }
        }

        /* Loading state enhancement */
        .register-btn.loading {
            background: linear-gradient(135deg, #94a3b8, #64748b);
            cursor: not-allowed;
            transform: none;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .register-btn.loading::before,
        .register-btn.loading::after {
            display: none;
        }

        /* Focus state for accessibility */
        .register-btn:focus {
            outline: none;
            box-shadow: 
                0 8px 25px rgba(102, 126, 234, 0.4),
                0 0 0 4px rgba(102, 126, 234, 0.3);
        }

        /* Success state animation */
        .register-btn.success {
            background: linear-gradient(135deg, #10b981, #059669);
            animation: success-bounce 0.6s ease;
        }

        @keyframes success-bounce {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Icon styling within button */
        .register-btn i {
            margin-right: 12px;
            font-size: 1.1em;
            transition: transform 0.3s ease;
        }

        .register-btn:hover i {
            transform: translateX(2px);
        }

        /* Ripple effect */
        .register-btn .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            transform: scale(0);
            animation: ripple-animation 0.6s linear;
            pointer-events: none;
        }

        @keyframes ripple-animation {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
        }

        .login-link a {
            color: #0d6efd;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #20c997;
            text-decoration: underline;
        }

        .error-message {
            color: #ff4757;
            font-size: 0.9rem;
            margin-top: 5px;
            display: none;
            background: rgba(255, 71, 87, 0.1);
            padding: 8px;
            border-radius: 5px;
        }

        /* Mobile responsive adjustments */
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
            
            .register-btn {
                padding: 18px;
                font-size: 1.1rem;
                letter-spacing: 0.5px;
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
            <p>Start Your Adventure Journey</p>
        </div>
        
        <div class="form-container">
            <!-- Updated form action with context path -->
            <form action="${pageContext.request.contextPath}/registerProcess.jsp" method="post" id="registerForm">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text" id="name" name="name" required placeholder="Enter your full name">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <div class="input-wrapper">
                        <i class="fas fa-phone"></i>
                        <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" required placeholder="Create a password">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
                    </div>
                    <div class="error-message" id="passwordError">Passwords do not match!</div>
                </div>
                
                <button type="submit" class="register-btn" id="registerButton">
                    <i class="fas fa-rocket"></i> Create My Account
                </button>
            </form>
            
            <div class="login-link">
                <p>Already have an account? <a href="Login.jsp">Sign in here</a></p>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type="text/javascript">
        // Enhanced status checking with debug logging
        var status = document.getElementById("status").value;
        console.log("Status received: '" + status + "'"); // Debug line - check browser console
        
        // Check if status exists and is not null
        if (status && status !== "null" && status.trim() !== "") {
            status = status.trim();
            
            if (status === "success") {
                swal("Congrats", "Account Created Successfully", "success");
            } else if (status === "exists") {
                swal("Email Already Registered!", "An account with this email already exists. Please use a different email.", "warning");
            } else if (status === "failed") {
                swal("Registration Failed", "Please try again.", "error");
            } else if (status === "error") {
                swal("Error", "Something went wrong. Please try again.", "error");
            } else {
                console.log("Unknown status: " + status);
            }
        } else {
            console.log("No status or null status received");
        }

        // Enhanced register button effects
        document.addEventListener('DOMContentLoaded', function() {
            const registerBtn = document.getElementById('registerButton');
            
            // Add ripple effect on click
            registerBtn.addEventListener('click', function(e) {
                if (!this.classList.contains('loading')) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.width = ripple.style.height = size + 'px';
                    ripple.style.left = x + 'px';
                    ripple.style.top = y + 'px';
                    ripple.classList.add('ripple');
                    
                    this.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                }
            });
        });

        // Enhanced Form validation with button effects
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMessage = document.getElementById('passwordError');
            
            if (password !== confirmPassword) {
                e.preventDefault();
                errorMessage.style.display = 'block';
                document.getElementById('confirmPassword').style.borderColor = '#ff4757';
                return;
            } else {
                errorMessage.style.display = 'none';
                document.getElementById('confirmPassword').style.borderColor = '#e9ecef';
            }
        });

        // Real-time password confirmation check
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            const errorMessage = document.getElementById('passwordError');
            
            if (confirmPassword && password !== confirmPassword) {
                errorMessage.style.display = 'block';
                this.style.borderColor = '#ff4757';
            } else {
                errorMessage.style.display = 'none';
                this.style.borderColor = '#e9ecef';
            }
        });

        // Input focus effects
        const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"], input[type="tel"]');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentNode.querySelector('i').style.color = '#0d6efd';
            });
            
            input.addEventListener('blur', function() {
                this.parentNode.querySelector('i').style.color = '#20c997';
            }); 
        });
    </script>
    
</body>
</html>
