<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Customers</title>
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
    <h2>Deleted Customers (from Backup)</h2>
    <table>
        <tr>
            <th> ID </tH>
            <th> NAME </tH>
            <th> AGE </th>
            <th> ID DOCUMENT </th>
            <th> ADDRESS </th>
            <th> PHONE/MOBILE NO </th>
            <th> PACKAGE NAME </th>
            <th> GENDER </th>
            <th> RELIGION</th>
            <th> CASTE </th>
            <th> COUNTRY </th>
            <th> EMAIL ADDRESS</th>
            <th> QUALIFICATION </th>
            <th> RESTORE </th>

        </tr>


<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM customer2_backup");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("customerid") %></td>
            <td><%= rs.getString("customername") %></td>
            <td><%= rs.getString("customerage") %></td>
            <td><%= rs.getString("iddocument") %></td>
            <td><%= rs.getString("customeraddress") %></td>
            <td><%= rs.getString("customerphoneno") %></td>
            <td><%= rs.getString("packagename") %></td>
            <td><%= rs.getString("customergender") %></td>
            <td><%= rs.getString("customerreligion") %></td>
            <td><%= rs.getString("customercaste") %></td>
            <td><%= rs.getString("country") %></td>
            <td><%= rs.getString("emailaddress") %></td>
            <td><%= rs.getString("customerqualification") %></td>
            
            
            <td>
                <form action="RestoreCustomerServlet" method="post">
                    <input type="hidden" name="customerid" value="<%= rs.getString("customerid") %>">
                    <input type="submit" value="Restore">
                </form>
            </td>
        </tr>
<%
        }
        con.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='6' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
    </table>
</body>
</html>
