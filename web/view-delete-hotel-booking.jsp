<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deleted Booking Hotel</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background: #444;
            color: white;
        }
        input[type="submit"] {
            background: green;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background: darkgreen;
        }
    </style>
</head>
<body>
    <h2>Deleted Booking Hotel (from Backup Table)</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Hotel</th>
            <th>Persons</th>
            <th>Days</th>
            <th>AC</th>
            <th>Food</th>
            <th>ID Type</th>
            <th>Room No</th>
            <th>Phone/Mobile</th>
            <th>Total</th>
            <th>Booking Date</th>
            <th>Restore</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM hotel_booking_backup ORDER BY booking_date DESC")) {

            while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("hotel") %></td>
            <td><%= rs.getString("persons") %></td>
            <td><%= rs.getString("days") %></td>
            <td><%= rs.getString("ac") %></td>
            <td><%= rs.getString("food") %></td>
            <td><%= rs.getString("id_type") %></td>
            <td><%= rs.getString("room") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("total") %></td>
            <td><%= rs.getString("booking_date") %></td>
            <td>
                <form action="RestoreBookingHotelServlet" method="post" onsubmit="return confirm('Are you sure you want to restore this booking?');">
                    <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                    <input type="submit" value="Restore">
                </form>
            </td>
        </tr>
<%
            }
        }
    } catch (Exception e) {
%>
        <tr><td colspan="13" style="color:red;"><%= e.getMessage() %></td></tr>
<%
    }
%>
    </table>
</body>
</html>
