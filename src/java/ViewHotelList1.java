import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewHotelList1")
public class ViewHotelList1 extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // Create statement and execute query
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hotel_booking");

            // HTML output
            out.println("<html><head><title>Hotel Booking List</title></head><body>");
            out.println("<h2 align='center'>Hotel Booking Details</h2>");
            out.println("<table border='2' width='90%' align='center' cellpadding='8' style='font-family: Arial;'>");
            out.println("<tr style='background-color:#ddd;'>");
            out.println("<th>ID</th><th>Username</th><th>Hotel</th><th>Persons</th><th>Days</th><th>AC</th><th>Food</th><th>ID Type</th><th>Room No</th><th>Phone</th><th>Total</th><th>Booking Date</th>");
            out.println("</tr>");

            // Print each row
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("username") + "</td>");
                out.println("<td>" + rs.getString("hotel") + "</td>");
                out.println("<td>" + rs.getInt("persons") + "</td>");
                out.println("<td>" + rs.getInt("days") + "</td>");
                out.println("<td>" + rs.getString("ac") + "</td>");
                out.println("<td>" + rs.getString("food") + "</td>");
                out.println("<td>" + rs.getString("id_type") + "</td>");
                out.println("<td>" + rs.getString("room") + "</td>");
                out.println("<td>" + rs.getString("phone") + "</td>");
                out.println("<td>" + rs.getDouble("total") + "</td>");

                // Fix: Safely get bookingDate
                Timestamp ts = rs.getTimestamp("booking_date");
                String formattedDate = (ts != null) ? new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(ts) : "N/A";
                out.println("<td>" + formattedDate + "</td>");

                out.println("</tr>");
            }

            out.println("</table></body></html>");

            // Clean up
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace(); // Show actual error in logs
            out.println("<h3 style='color:red;'>Error retrieving hotel bookings. Please check server logs.</h3>");
        }
    }
}
