
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RestoreBookingHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");  // Get booking ID
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (id == null || id.trim().isEmpty()) {
            out.println("<script>alert('Hotel Booking ID is required!'); window.location='view-delete-hotel-booking.jsp';</script>");
            return;
        }

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // 1. Check if booking ID exists in backup table
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM hotel_booking_backup WHERE id = ?");
            checkStmt.setString(1, id);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Retrieve all booking details
                String username = rs.getString("username");
                String hotel = rs.getString("hotel");
                int persons = rs.getInt("persons");
                int days = rs.getInt("days");
                String ac = rs.getString("ac");
                String food = rs.getString("food");
                String id_type = rs.getString("id_type");
                String room = rs.getString("room");
                String phone = rs.getString("phone");
                String total = rs.getString("total");
                java.sql.Date booking_date = rs.getDate("booking_date");

                // 2. Insert into main booking table
                PreparedStatement insertStmt = con.prepareStatement(
                    "INSERT INTO hotel_booking (id, username, hotel, persons, days, ac, food, id_type, room, phone, total, booking_date) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                );
                insertStmt.setString(1, id);
                insertStmt.setString(2, username);
                insertStmt.setString(3, hotel);
                insertStmt.setInt(4, persons);
                insertStmt.setInt(5, days);
                insertStmt.setString(6, ac);
                insertStmt.setString(7, food);
                insertStmt.setString(8, id_type);
                insertStmt.setString(9, room);
                insertStmt.setString(10, phone);
                insertStmt.setString(11, total);
                insertStmt.setDate(12, booking_date);

                int rowsInserted = insertStmt.executeUpdate();

                if (rowsInserted > 0) {
                    // 3. Delete from backup after restoring
                    PreparedStatement deleteStmt = con.prepareStatement("DELETE FROM hotel_booking_backup WHERE id = ?");
                    deleteStmt.setString(1, id);
                    deleteStmt.executeUpdate();

                    out.println("<script>alert('Hotel Booking restored successfully!'); window.location='view-delete-hotel-booking.jsp';</script>");
                } else {
                    out.println("<script>alert('Error: Could not restore booking.'); window.location='view-delete-hotel-booking.jsp';</script>");
                }

                insertStmt.close();
            } else {
                out.println("<script>alert('Booking ID not found in backup!'); window.location='view-delete-hotel-booking.jsp';</script>");
            }

            rs.close();
            checkStmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Error occurred: " + e.getMessage() + "</h3>");
        }
    }
}
