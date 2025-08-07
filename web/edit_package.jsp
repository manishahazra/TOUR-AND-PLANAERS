<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Customer Booking</title>
  <style>
    body {
      font-family: Arial;
      background: #f0f0f0;
      padding: 30px;
    }
    .form-box {
      background: #fff;
      padding: 25px;
      width: 500px;
      margin: auto;
      box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
      border-radius: 10px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 12px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    input[type="submit"] {
      background-color: #3498db;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<div class="form-box">
  <h2>Search Booking by ID</h2>
  <form method="get">
    <input type="text" name="booking_id" placeholder="Enter Booking ID" required>
    <input type="submit" value="Search">
  </form>
</div>

<%
String idParam = request.getParameter("booking_id");
if (idParam != null && !idParam.trim().isEmpty()) {
    String booking_id = "", customer_id = "", customer_name = "", phone = "", total_persons = "", booking_date = "", package_name = "", price = "", offer = "", total_price = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "admin");

        String query = "SELECT * FROM bookings WHERE booking_id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, idParam);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            booking_id = rs.getString("booking_id");
            customer_id = rs.getString("customer_id");
            customer_name = rs.getString("customer_name");
            phone = rs.getString("phone");
            total_persons = rs.getString("total_persons");
            booking_date = rs.getString("booking_date");
            package_name = rs.getString("package_name");
            price = rs.getString("price");
            offer = rs.getString("offer");
            total_price = rs.getString("total_price");
%>

<div class="form-box" style="margin-top: 20px;">
  <h2>Update Booking</h2>
  <form action="UpdatePackageServlet" method="post">
    <input type="hidden" name="booking_id" value="<%= booking_id %>">
    <input type="text" name="customer_id" value="<%= customer_id %>" required>
    <input type="text" name="customer_name" value="<%= customer_name %>" required>
    <input type="text" name="phone" value="<%= phone %>" required>
    <input type="text" name="total_persons" value="<%= total_persons %>" required>
    <input type="text" name="booking_date" value="<%= booking_date %>" required>
    <input type="text" name="package_name" value="<%= package_name %>" required>
    <input type="text" name="price" value="<%= price %>" required>
    <input type="text" name="offer" value="<%= offer %>" required>
    <input type="text" name="total_price" value="<%= total_price %>" required>
    <input type="submit" value="Update Booking">
  </form>
</div>

<%
        } else {
            out.println("<p style='color:red; text-align:center;'>No booking found with that ID.</p>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
