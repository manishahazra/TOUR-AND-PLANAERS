import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RestoreCustomerServlet extends HttpServlet {
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

            // Copy from backup to main table
            PreparedStatement insertBack = con.prepareStatement(
                "INSERT INTO customer2 SELECT * FROM customer2_backup WHERE customerid = ?");
            insertBack.setString(1, customerid);
            int restore = insertBack.executeUpdate();

            if (restore > 0) {
                // Now delete from backup table
                PreparedStatement deleteFromBackup = con.prepareStatement(
                    "DELETE FROM customer2_backup WHERE customerid = ?");
                deleteFromBackup.setString(1, customerid);
                deleteFromBackup.executeUpdate();

                out.println("<script>alert('Customer restored successfully!'); window.location='view-delete-customer.jsp';</script>");
            } else {
                out.println("<script>alert('Customer not found in backup!'); window.location='view-delete-customer.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
