<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Hotel Booking</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      padding: 40px;
    }
    .form-box {
      background: white;
      padding: 25px;
      width: 500px;
      margin: auto;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 10px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
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
    .error {
      color: red;
      text-align: center;
      margin-top: 20px;
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
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "admin");

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

<div class="form-box" style="margin-top: 30px;">
  <h2>Update Hotel Booking</h2>
  <form action="UpdateHotelServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="text" name="username" value="<%= username %>" placeholder="Username" required>
    <input type="text" name="hotel" value="<%= hotel %>" placeholder="Hotel Name" required>
    <input type="text" name="persons" value="<%= persons %>" placeholder="Total Persons" required>
    <input type="text" name="days" value="<%= days %>" placeholder="Number of Days" required>
    <input type="text" name="ac" value="<%= ac %>" placeholder="AC or Non-AC" required>
    <input type="text" name="food" value="<%= food %>" placeholder="With Food or Not" required>
    <input type="text" name="id_type" value="<%= id_type %>" placeholder="ID Type" required>
    <input type="text" name="room" value="<%= room %>" placeholder="Room Number" required>
    <input type="text" name="phone" value="<%= phone %>" placeholder="Phone Number" required>
    <input type="text" name="total" value="<%= total %>" placeholder="Total Price" required>
    <input type="text" name="booking_date" value="<%= booking_date %>" placeholder="Booking Date" required>
    <input type="submit" value="Update">
  </form>
</div>

<%
        } else {
%>
  <p class="error">Hotel Booking ID not found.</p>
<%
        }
        con.close();
    } catch (Exception e) {
%>
  <p class="error">Error: <%= e.getMessage() %></p>
<%
    }
}
%>

</body>
</html>
