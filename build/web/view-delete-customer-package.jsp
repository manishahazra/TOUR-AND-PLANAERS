<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Customer Packages</title>
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
        }
    </style>
</head>
<body>
    <h2>Delete Customer Packages (from Package Booking Backup Table)</h2>
    <table>
        <tr>
            <th>BOOKING ID</th>
            <th>CUSTOMER ID</th>
            <th>CUSTOMER NAME</th>
            <th>PHONE</th>
            <th>TOTAL PERSONS</th>
            <th>BOOKING DATE</th>
            <th>PACKAGE NAME</th>
            <th>PRICE</th>
            <th>OFFER</th>
            <th>TOTAL PRICE</th>
            <th>RESTORE</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM booking_backup");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("booking_id") %></td>
            <td><%= rs.getString("customer_id") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("total_persons") %></td>
            <td><%= rs.getString("booking_date") %></td>
            <td><%= rs.getString("package_name") %></td>
            <td><%= rs.getString("price") %></td>
            <td><%= rs.getString("offer") %></td>
            <td><%= rs.getString("total_price") %></td>
            <td>
                <form action="RestoreBookingServlet" method="post">
                    <input type="hidden" name="booking_id" value="<%= rs.getString("booking_id") %>">
                    <input type="submit" value="Restore">
                </form>
            </td>
        </tr>
<%
        }
        con.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='11' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
    </table>
</body>
</html>
