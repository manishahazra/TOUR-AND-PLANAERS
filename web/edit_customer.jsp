<%@ page import="java.sql.*" %>
<%
    String customerid = request.getParameter("customerid");
    String customername = "", customerage = "", iddocument = "", customeraddress = "", customerphoneno = "", packagename = "", customergender = "", customerreligion = "", customercaste = "", country= "", emailaddress = "", customerqualification = "";
    int age = 0;

    if (customerid != null && !customerid.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "admin");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer2 WHERE customerid=?");
            ps.setInt(1, Integer.parseInt(customerid));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customername = rs.getString("customername");
                customerage = rs.getString("customerage");
                iddocument= rs.getString("iddocument");
                customeraddress = rs.getString("customeraddress");
                customerphoneno = rs.getString("customerphoneno");
                packagename = rs.getString("packagename");
                customergender = rs.getString("customergender");
                customerreligion = rs.getString("customerreligion");
                customercaste = rs.getString("customercaste");
                country = rs.getString("country");
                emailaddress = rs.getString("emailaddress");
                customerqualification = rs.getString("customerqualification");
            } else {
                out.println("<script>alert('Customer not found!');</script>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Customer</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #00c6ff, #0072ff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 130vh;
    }
    .card {
      background: #fff;
      padding: 30px;
      border-radius: 20px;
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
      width: 600px;
    }
    h2 {
      text-align: center;
      color: #0072ff;
      margin-bottom: 20px;
    }
    label {
      display: block;
      margin-top: 10px;
      font-weight: 600;
      color: #444;
    }
    input, select {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 14px;
    }
    .btn-group {
      display: flex;
      justify-content: space-between;
      margin-top: 25px;
    }
    button {
      padding: 10px 20px;
      border: none;
      border-radius: 10px;
      background-color: #0072ff;
      color: #fff;
      font-size: 15px;
      cursor: pointer;
    }
    button:hover {
      background-color: #005fcc;
    }
    .reset-btn {
      background-color: #555;
    }
    .reset-btn:hover {
      background-color: #333;
    }
  </style>
</head>
<body>
  <div class="card">
    <h2>Edit Customer Details</h2>

    <form method="get" action="edit_customer.jsp">
      <label>Enter Customer ID</label>
      <input type="number" name="customerid" value="<%= customerid != null ? customerid : "" %>" required>
      <button type="submit" style="margin-top:10px;">Search</button>
    </form>

    <form method="post" action="UpdateCustomerServlet">
      <input type="hidden" name="customerid" value="<%= customerid != null ? customerid: "" %>" />

      <label>Name</label>
      <input type="text" name="customername" value="<%= customername %>" required>

      <label>Age</label>
      <input type="number" name="customerage" value="<%= customerage %>" required>

      <label>ID Document</label>
      <input type="text" name="iddocument" value="<%= iddocument %>" required>

      <label>Address</label>
      <input type="text" name="customeraddress" value="<%= customeraddress %>" required>

      <label>Phone</label>
      <input type="number" name="customerphoneno" value="<%= customerphoneno %>" required>

      <label>Package</label>
      <input type="text" name="packagename" value="<%= packagename %>" required>

      <label>Gender</label>
      <select name="customergender">
        <option value="">Select</option>
        <option <%= "Male".equals(customergender) ? "selected" : "" %>>Male</option>
        <option <%= "Female".equals(customergender) ? "selected" : "" %>>Female</option>
      </select>

      <label>Religion</label>
      <input type="text" name="customerreligion" value="<%= customerreligion %>" required>

      <label>Caste</label>
      <input type="text" name="customercaste" value="<%= customercaste %>" required>

      <label>Country</label>
      <input type="text" name="country" value="<%= country %>" required>

      <label>Email</label>
      <input type="text" name="emailaddress" value="<%= emailaddress %>" required>

      <label>Qualification</label>
      <input type="text" name="customerqualification" value="<%= customerqualification %>" required>

      <div class="btn-group">
        <button type="submit">Update</button>
        <button type="reset" class="reset-btn">Clear</button>
      </div>
    </form>
  </div>
</body>
</html>
