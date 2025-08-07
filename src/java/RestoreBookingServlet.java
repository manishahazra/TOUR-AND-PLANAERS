import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RestoreBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String booking_id = request.getParameter("booking_id");  // Correct variable name
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (booking_id == null || booking_id.trim().isEmpty()) {
            out.println("<script>alert('Customer Booking Package ID is required!'); window.location='view-delete-customer-package.jsp';</script>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // First, check if booking_id exists in backup table
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM booking_backup WHERE booking_id = ?");
            checkStmt.setString(1, booking_id);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Get all fields manually from ResultSet
                String customer_id = rs.getString("customer_id");
                String customer_name = rs.getString("customer_name");
                String phone = rs.getString("phone");
                int total_persons = rs.getInt("total_persons");
                String booking_date = rs.getString("booking_date");
                String package_name = rs.getString("package_name");
                double price = rs.getDouble("price");
                String offer = rs.getString("offer");
                double total_price = rs.getDouble("total_price");

                // Insert into bookings table
                PreparedStatement insertStmt = con.prepareStatement(
                    "INSERT INTO bookings (booking_id, customer_id, customer_name, phone, total_persons, booking_date, package_name, price, offer, total_price) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                );
                insertStmt.setString(1, booking_id);
                insertStmt.setString(2, customer_id);
                insertStmt.setString(3, customer_name);
                insertStmt.setString(4, phone);
                insertStmt.setInt(5, total_persons);
                insertStmt.setString(6, booking_date);
                insertStmt.setString(7, package_name);
                insertStmt.setDouble(8, price);
                insertStmt.setString(9, offer);
                insertStmt.setDouble(10, total_price);

                int rowsInserted = insertStmt.executeUpdate();

                if (rowsInserted > 0) {
                    // Delete from backup table
                    PreparedStatement deleteStmt = con.prepareStatement("DELETE FROM booking_backup WHERE booking_id = ?");
                    deleteStmt.setString(1, booking_id);
                    deleteStmt.executeUpdate();

                    out.println("<script>alert('Customer Package restored successfully!'); window.location='view-delete-customer-package.jsp';</script>");
                } else {
                    out.println("<script>alert('Error while restoring data!'); window.location='view-delete-customer-package.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Booking ID not found in backup!'); window.location='view-delete-customer-package.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
