<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logged Out</title>
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
        }

        .logout-box {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            text-align: center;
        }

        .logout-box h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .logout-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background-color: #0984e3;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .logout-box a:hover {
            background-color: #74b9ff;
        }
    </style>
</head>
<body>

    <div class="logout-box">
        <h1>✅ You have been logged out successfully!</h1>
        <a href="login.jsp">🔐 Return to Login</a>
    </div>

</body>
</html>
