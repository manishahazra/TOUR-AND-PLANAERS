<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Travel and Tourism System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        #splash {
            position: fixed;
            width: 100%;
            height: 100%;
            background: #000;
            color: #fff;
            font-size: 2em;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10;
        }
        .login-container {
            display: none;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }
        .login-box {
            background: rgba(255,255,255,0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-bottom: 2px solid #49a09d;
            outline: none;
        }
        .robot-check {
            margin: 10px 0;
        }
        .robot-check input {
            margin-right: 8px;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #49a09d;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background: #357e7d;
        }
        .error {
            color: red;
            font-size: 14px;
            display: none;
            text-align: center;
        }
    </style>
    <script>
        // Splash screen timeout
        window.onload = function () {
            setTimeout(function () {
                document.getElementById('splash').style.display = 'none';
                document.querySelector('.login-container').style.display = 'flex';
            }, 2000); // Splash lasts 2 seconds
        };

        function validateForm() {
            var robot = document.getElementById("robotCheck");
            var error = document.getElementById("robotError");
            if (!robot.checked) {
                error.style.display = "block";
                return false;
            }
            error.style.display = "none";
            return true;
        }
    </script>
</head>
<body>
    <!-- Splash Screen -->
    <div id="splash">
        <div>Loading Travel Dashboard...</div>
    </div>

    <!-- Login Form -->
    <div class="login-container">
        <form class="login-box" action="LoginServlet" method="post" onsubmit="return validateForm();">
            <h2>Login</h2>
            <input type="text" name="username" placeholder="Enter Username" required />
            <input type="password" name="password" placeholder="Enter Password" required />
            
            <div class="robot-check">
                <input type="checkbox" id="robotCheck" />
                <label for="robotCheck">I'm not a robot</label>
            </div>
            <p class="error" id="robotError">Please verify that you're not a robot!</p>
            
            <button type="submit" class="btn">Login</button>
        </form>
    </div>
</body>
</html>
