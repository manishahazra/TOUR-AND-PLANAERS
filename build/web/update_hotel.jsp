<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Hotel Booking</title>
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

    input[type="text"], input[type="date"] {
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
  <h2>Search Hotel Booking by ID</h2>
  <form method="get">
    <input type="text" name="id" placeholder="Enter Booking ID" required>
    <input type="submit" value="Search">
  </form>
</div>

<%
String idParam = request.getParameter("id");
if (idParam != null && !idParam.trim().isEmpty()) {
    String id = "", username = "", hotel = "", persons = "", days = "", ac = "", food = "", id_type = "", room = "", phone = "", total = "", booking_date = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

        String query = "SELECT * FROM hotel_booking WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, idParam);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            id = rs.getString("id");
            username = rs.getString("username");
            hotel = rs.getString("hotel");
            persons = rs.getString("persons");
            days = rs.getString("days");
            ac = rs.getString("ac");
            food = rs.getString("food");
            id_type = rs.getString("id_type");
            room = rs.getString("room");
            phone = rs.getString("phone");
            total = rs.getString("total");
            booking_date = rs.getString("booking_date");
%>

<div class="form-box" style="margin-top: 20px;">
  <h2>Update Hotel Booking</h2>
  <form action="UpdateHotelServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="text" name="username" value="<%= username %>" required>
    <input type="text" name="hotel" value="<%= hotel %>" required>
    <input type="text" name="persons" value="<%= persons %>" required>
    <input type="text" name="days" value="<%= days %>" required>
    <input type="text" name="ac" value="<%= ac %>" required>
    <input type="text" name="food" value="<%= food %>" required>
    <input type="text" name="id_type" value="<%= id_type %>" required>
    <input type="text" name="room" value="<%= room %>" required>
    <input type="text" name="phone" value="<%= phone %>" required>
    <input type="text" name="total" value="<%= total %>" required>
    <input type="date" name="booking_date" value="<%= booking_date %>" required>
    <input type="submit" value="Update">
  </form>
</div>

<%
        } else {
            out.println("<p style='color:red; text-align:center;'>Hotel Booking ID not found.</p>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
