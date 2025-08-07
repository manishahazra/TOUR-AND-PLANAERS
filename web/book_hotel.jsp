<%@ page import="java.sql.*" %>
<%
    String customerId = request.getParameter("customerid");
    String username = "", idType = "", idNumber = "", phone = "", persons = "1";

    // Fetch customer details
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM view_customer WHERE customerid = ?");
        ps.setString(1, customerId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            username = rs.getString("username");
            idType = rs.getString("id_type");
            idNumber = rs.getString("id_number");
            phone = rs.getString("phone");
            persons = rs.getString("total_persons");
        }
        rs.close();
        ps.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Hotel</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .form-section {
            flex: 1;
            padding: 40px;
        }
        .form-section h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-section label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        .form-section input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: none;
        }
        .form-section .buttons {
            margin-top: 30px;
        }
        .form-section .buttons button {
            padding: 10px 20px;
            margin-right: 10px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-section .check { background-color: #007BFF; color: white; }
        .form-section .book { background-color: red; color: white; }
        .form-section .back { background-color: blue; color: white; }
        .image-section {
            flex: 1;
            background: url("hotel_image.jpg") no-repeat center;
            background-size: cover;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h1>BOOK HOTEL</h1>
        <form action="BookHotelServlet" method="post" onsubmit="return validateForm();">
            <input type="hidden" name="customerid" value="<%= customerId %>">
            <label>Username</label>
            <input type="text" name="username" value="<%= username %>" readonly>

            <label>Select Hotel</label>
            <select name="hotelname">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism", "root", "Sys@tem123#mon");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT hotelname FROM view_hotel");
                        while(rs.next()) {
                %>
                            <option><%= rs.getString("hotelname") %></option>
                <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch(Exception e) { e.printStackTrace(); }
                %>
            </select>

            <label>Total Persons</label>
            <input type="number" id="persons" name="totalpersons" value="<%= persons %>" min="1" onchange="calculatePrice()">

            <label>Number of Days</label>
            <input type="number" id="days" name="days" value="1" min="1" onchange="calculatePrice()">

            <label>AC / Non-AC</label>
            <select id="ac" name="ac" onchange="calculatePrice()">
                <option value="YES">YES</option>
                <option value="NO">NO</option>
            </select>

            <label>Food Included</label>
            <select id="food" name="food" onchange="calculatePrice()">
                <option value="YES">YES</option>
                <option value="NO">NO</option>
            </select>

            <label>Customer ID</label>
            <input type="text" name="idtype" value="<%= idType %>" readonly>

            <label>Hotel Room Number</label>
            <input type="text" name="idnumber" value="<%= idNumber %>" readonly>

            <label>Phone/Mobile No</label>
            <input type="text" name="phone" value="<%= phone %>" readonly>

            <label>Total Price</label>
            <h3 id="price" style="color:red">0</h3>
            <input type="hidden" id="totalPrice" name="totalprice">

            <div class="buttons">
                <button type="button" class="check" onclick="calculatePrice()">Check Price</button>
                <button type="submit" class="book">Book</button>
                <button type="button" class="back" onclick="window.history.back()">Back</button>
            </div>
        </form>
    </div>
    <div class="image-section"></div>
</div>

<script>
    function calculatePrice() {
        var persons = parseInt(document.getElementById('persons').value);
        var days = parseInt(document.getElementById('days').value);
        var ac = document.getElementById('ac').value;
        var food = document.getElementById('food').value;

        var price = 1000 * persons * days;
        if(ac === 'YES') price += 500 * persons * days;
        if(food === 'YES') price += 300 * persons * days;

        document.getElementById('price').innerText = price;
        document.getElementById('totalPrice').value = price;
    }

    function validateForm() {
        calculatePrice();
        return true;
    }

    window.onload = calculatePrice;
</script>
</body>
</html>
