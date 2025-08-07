import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerid = request.getParameter("customerid");
        String customername = request.getParameter("customername");
        String customerage = request.getParameter("customerage");
        String iddocument = request.getParameter("iddocument");
        String customeraddress = request.getParameter("customeraddress");
        String customerphoneno = request.getParameter("customerphoneno");
        String packagename = request.getParameter("packagename");
        String customergender = request.getParameter("customergender");
        String customerreligion = request.getParameter("customerreligion");
        String customercaste = request.getParameter("customercaste");
        String country = request.getParameter("country");
        String emailaddress = request.getParameter("emailaddress");
        String customerqualification = request.getParameter("customerqualification");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO customer2 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            ps.setString(1, customerid);
            ps.setString(2, customername);
            ps.setString(3, customerage);
            ps.setString(4, iddocument);
            ps.setString(5, customeraddress);
            ps.setString(6, customerphoneno);
            ps.setString(7, packagename);
            ps.setString(8, customergender);
            ps.setString(9, customerreligion);
            ps.setString(10, customercaste);
            ps.setString(11, country);
            ps.setString(12, emailaddress);
            ps.setString(13, customerqualification);

            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("<h1 style='color:green;'>Customer Added Successfully</h1>");
            } else {
                out.println("<h1 style='color:red;'>Failed to Add Customer</h1>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<h1 style='color:red;'>Error: " + e.getMessage() + "</h1>");
            e.printStackTrace();
        }
    }
}
