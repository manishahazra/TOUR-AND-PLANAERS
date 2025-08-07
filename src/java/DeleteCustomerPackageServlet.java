import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteCustomerPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String booking_id = request.getParameter("booking_id");  // Correct variable name
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (booking_id == null || booking_id.trim().isEmpty()) {
            out.println("<script>alert('Booking ID is required!'); window.location='view-delete-customer-booking.jsp';</script>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // 1. Copy record to backup table
            PreparedStatement backup = con.prepareStatement(
                "INSERT INTO booking_backup SELECT * FROM bookings WHERE booking_id = ?");
            backup.setString(1, booking_id);
            backup.executeUpdate();

            // 2. Delete from original table
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM bookings WHERE booking_id = ?");
            ps.setString(1, booking_id);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<script>alert('Customer Booking Package deleted and backup saved successfully!'); window.location='Dashboard.html';</script>");
            } else {
                out.println("<script>alert('Customer not found!'); window.location='view-delete-customer-package.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
