import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteCustomerServlet1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerid = request.getParameter("customerid");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (customerid == null || customerid.trim().isEmpty()) {
            out.println("<script>alert('Customer ID is required!'); window.location='view-delete-customer.jsp';</script>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // 1. Copy record to backup table
            PreparedStatement backup = con.prepareStatement(
                "INSERT INTO customer2_backup SELECT * FROM customer2 WHERE customerid = ?");
            backup.setString(1, customerid);
            backup.executeUpdate(); // No check needed; insert 0 if not found

            // 2. Delete from original table
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM customer2 WHERE customerid = ?");
            ps.setString(1, customerid);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<script>alert('Customer deleted and backup saved successfully!'); window.location='Dashboard.html';</script>");
            } else {
                out.println("<script>alert('Customer not found!'); window.location='view-delete-customer.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
