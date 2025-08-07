<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Customer Details</title>
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
  <h2>Search Customer by ID</h2>
  <form method="get">
    <input type="text" name="customerid" placeholder="Enter Customer ID" required>
    <input type="submit" value="Search">
  </form>
</div>

<%
String idParam = request.getParameter("customerid");
if (idParam != null && !idParam.isEmpty()) {
    String customername = "", customerage = "", iddocument = "", customeraddress = "", customerphoneno = "", packagename = "", customergender = "", customerreligion = "", customercaste = "", country= "", emailaddress = "", customerqualification = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

        String query = "SELECT * FROM customer2 WHERE customerid = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, idParam);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String customerid = rs.getString("customerid");
            customername = rs.getString("customername");
            customerage = rs.getString("customerage");
            iddocument = rs.getString("iddocument");
            customeraddress = rs.getString("customeraddress");
            customerphoneno = rs.getString("customerphoneno");
            packagename = rs.getString("packagename");
            customergender = rs.getString("customergender");
            customerreligion = rs.getString("customerreligion");
            customercaste = rs.getString("customercaste");
            country = rs.getString("country");
            emailaddress = rs.getString("emailaddress");
            customerqualification = rs.getString("customerqualification");
%>

<div class="form-box" style="margin-top: 20px;">
  <h2>Update Customer</h2>
  <form action="UpdateCustomerServlet" method="post">
    <input type="hidden" name="customerid" value="<%= customerid %>">
    <input type="text" name="customername" value="<%= customername %>" required>
    <input type="text" name="customerage" value="<%= customerage %>" required>
    <input type="text" name="iddocument" value="<%= iddocument %>" required>
    <input type="text" name="customeraddress" value="<%= customeraddress %>" required>
    <input type="text" name="customerphoneno" value="<%= customerphoneno %>" required>
    <input type="text" name="packagename" value="<%= packagename %>" required>
    <input type="text" name="customergender" value="<%= customergender %>" required>
    <input type="text" name="customerreligion" value="<%= customerreligion %>" required>
    <input type="text" name="customercaste" value="<%= customercaste %>" required>
    <input type="text" name="country" value="<%= country %>" required>
    <input type="text" name="emailaddress" value="<%= emailaddress %>" required>
    <input type="text" name="customerqualification" value="<%= customerqualification %>" required>
    <input type="submit" value="Update">
  </form>
</div>

<%
        } else {
            out.println("<p style='color:red; text-align:center;'>Customer ID not found.</p>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
