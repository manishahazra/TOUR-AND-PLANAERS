<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful</title>
    <style>
        body {
            background: #f5f5f5;
            font-family: Arial;
            text-align: center;
            padding-top: 50px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            margin: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h1>Booking Confirmed!</h1>
    <p>Your hotel booking has been successfully saved.</p>

    <button class="btn" onclick="window.print()"> Print Receipt</button>
    <a href="Dashboard.html" class="btn">Back to Dashboard</a>
    <a href="HotelReceiptPDFServlet?username=<%= session.getAttribute("username") %>" class="btn"> Download PDF</a>

</body>
</html>
