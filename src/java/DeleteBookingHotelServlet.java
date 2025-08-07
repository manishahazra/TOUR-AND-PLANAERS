import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteBookingHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (id == null || id.trim().isEmpty()) {
            out.println("<script>alert('Hotel Booking ID is required!'); window.location='view-delete-hotel-booking.jsp';</script>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon")) {

                // Optional: Backup the record before deletion
                try (PreparedStatement backupPs = con.prepareStatement(
                        "INSERT INTO hotel_booking_backup SELECT * FROM hotel_booking WHERE id = ?")) {
                    backupPs.setInt(1, Integer.parseInt(id));
                    backupPs.executeUpdate();
                }

                // Perform deletion
                try (PreparedStatement ps = con.prepareStatement(
                        "DELETE FROM hotel_booking WHERE id = ?")) {
                    ps.setInt(1, Integer.parseInt(id));
                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        out.println("<script>alert('Hotel Booking deleted successfully!'); window.location='Dashboard.html';</script>");
                    } else {
                        out.println("<script>alert('Hotel Booking ID not found!'); window.location='view-delete-hotel-booking.jsp';</script>");
                    }
                }

            }
        } catch (NumberFormatException nfe) {
            out.println("<script>alert('Invalid Booking ID!'); window.location='view-delete-hotel-booking.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Something went wrong. Please try again later.</h3>");
        }
    }
}
