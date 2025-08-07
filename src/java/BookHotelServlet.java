import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BookHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Receive form data
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String hotel = request.getParameter("hotel");
        int persons = Integer.parseInt(request.getParameter("persons"));
        int days = Integer.parseInt(request.getParameter("days"));
        String ac = request.getParameter("ac");
        String food = request.getParameter("food");
        String id_type = request.getParameter("id_type");
        String room = request.getParameter("room");
        String phone = request.getParameter("phone");
        String booking_date = request.getParameter("booking_date");  // ← taken from form

        // Calculate total cost
        int base = 2000;
        int acCost = ac.equalsIgnoreCase("YES") ? 1000 : 500;
        int foodCost = food.equalsIgnoreCase("YES") ? 500 : 0;
        int total = (base + acCost + foodCost) * persons * days;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            String query = "INSERT INTO hotel_booking (id, username, hotel, persons, days, ac, food, id_type, room, phone, total, booking_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, hotel);
            ps.setInt(4, persons);
            ps.setInt(5, days);
            ps.setString(6, ac);
            ps.setString(7, food);
            ps.setString(8, id_type);
            ps.setString(9, room);
            ps.setString(10, phone);
            ps.setInt(11, total);
            ps.setString(12, booking_date);  // ← date stored

            int rows = ps.executeUpdate();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (rows > 0) {
                // Receipt
                out.println("<html><head><title>Receipt</title><style>");
                out.println("body { font-family: Arial; padding: 40px; background-color: #f9f9f9; }");
                out.println(".receipt { background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 0 15px rgba(0,0,0,0.1); max-width: 600px; margin: auto; }");
                out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; } td { padding: 8px; }");
                out.println(".buttons { margin-top: 20px; } button, a { padding: 8px 16px; background: red; color: white; border-radius: 5px; text-decoration: none; }");
                out.println("</style></head><body>");

                out.println("<div class='receipt'>");
                out.println("<h2>Hotel Booked Successfully!</h2>");
                out.println("<p><strong>Booking Date:</strong> " + booking_date + "</p>");
                out.println("<table>");
                out.println("<tr><td><strong>Username:</strong></td><td>" + username + "</td></tr>");
                out.println("<tr><td><strong>Hotel:</strong></td><td>" + hotel + "</td></tr>");
                out.println("<tr><td><strong>Persons:</strong></td><td>" + persons + "</td></tr>");
                out.println("<tr><td><strong>Days:</strong></td><td>" + days + "</td></tr>");
                out.println("<tr><td><strong>AC:</strong></td><td>" + ac + "</td></tr>");
                out.println("<tr><td><strong>Food:</strong></td><td>" + food + "</td></tr>");
                out.println("<tr><td><strong>ID Type:</strong></td><td>" + id_type + "</td></tr>");
                out.println("<tr><td><strong>Room Number:</strong></td><td>" + room + "</td></tr>");
                out.println("<tr><td><strong>Phone:</strong></td><td>" + phone + "</td></tr>");
                out.println("<tr><td><strong>Total Cost:</strong></td><td>Rs. " + total + "</td></tr>");
                out.println("</table>");

                out.println("<div class='buttons'>");
                out.println("<button onclick='window.print()'>️ Print Receipt</button>");
                
                out.println("<a href='HotelReceiptPDFServlet?username=" + username + "' target='_blank'> Download PDF</a>");
                
                out.println("<a href='Dashboard.html'> Back to Dashboard</a>");
                
                out.println("</div>");
                out.println("</div></body></html>");
            } else {
                out.println("<h2 style='color:red;'>Failed to book hotel. Try again.</h2>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
