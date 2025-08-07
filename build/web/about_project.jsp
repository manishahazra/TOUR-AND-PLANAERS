<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Project - TTMS</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            border: 5px solid #ccc;
            border-radius: 12px;
            background-color: white;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            color: violet;
            font-size: 28px;
        }

        .header img {
            height: 100px;
            width: auto;
        }

        .content {
            margin-top: 20px;
            line-height: 1.8;
            font-size: 16px;
            color: #333;
        }

        .back-button {
            margin-top: 30px;
            text-align: center;
        }

        .back-button a {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
        }

        .back-button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Travel and Tourism  Management System - `TTMS`</h1>
            <img src="travel logo.jpg" alt="TTMS" />
        </div>
        <div class="content">
            <h2>- About Project -</h2>
            <p>
                The objective of the Travel and Tourism Management System project is to develop a system that automates the processes
                and activities of a travel agency. The purpose is to design a system using which one can perform all operations
                related to traveling.
            </p>
            <p>
                This application will help in accessing the information related to the travel to a particular destination with great ease.
                Users can track the information related to their tours with great ease through this application.
                Travel agency information can also be obtained through this platform.
            </p>
            <h3>Advantages of Project:</h3>
            <ul>
                <li>Gives accurate information</li>
                <li>Simplifies the manual work</li>
                <li>Minimizes documentation-related work</li>
                <li>Provides up-to-date information</li>
                <li>Friendly environment with warning messages</li>
                <li>Traveler details can be accessed</li>
                <li>Booking confirmation notification</li>
            </ul>
        </div>
        <div class="back-button">
            <a href="Dashboard.html">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

