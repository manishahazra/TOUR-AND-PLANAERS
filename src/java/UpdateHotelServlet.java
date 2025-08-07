import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form parameters
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String hotel = request.getParameter("hotel");
        String persons = request.getParameter("persons");
        String days = request.getParameter("days");
        String ac = request.getParameter("ac");
        String food = request.getParameter("food");
        String id_type = request.getParameter("id_type");
        String room = request.getParameter("room");
        String phone = request.getParameter("phone");
        String total = request.getParameter("total");
        String booking_date = request.getParameter("booking_date");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC driver and connect to DB
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // Update SQL statement
            String query = "UPDATE hotel_booking SET username=?, hotel=?, persons=?, days=?, ac=?, food=?, id_type=?, room=?, phone=?, total=?, booking_date=? WHERE id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, hotel);
            ps.setString(3, persons);
            ps.setString(4, days);
            ps.setString(5, ac);
            ps.setString(6, food);
            ps.setString(7, id_type);
            ps.setString(8, room);
            ps.setString(9, phone);
            ps.setString(10, total);
            ps.setString(11, booking_date);
            ps.setString(12, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<script>alert('Hotel Booking updated successfully!'); window.location='edit_hotel.jsp';</script>");
            } else {
                out.println("<script>alert('Hotel Booking ID not found or update failed!'); window.location='edit_hotel.jsp';</script>");
            }

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException se) {
                out.println("<h4>Error closing connection: " + se.getMessage() + "</h4>");
            }
        }
    }
}
