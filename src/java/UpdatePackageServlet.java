import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdatePackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String booking_id = request.getParameter("booking_id");
        String customer_id = request.getParameter("customer_id");
        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String total_persons = request.getParameter("total_persons");
        String booking_date = request.getParameter("booking_date");
        String package_name = request.getParameter("package_name");
        String price = request.getParameter("price");
        String offer = request.getParameter("offer");
        String total_price = request.getParameter("total_price");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            String query = "UPDATE bookings SET customer_id=?, customer_name=?, phone=?, total_persons=?, booking_date=?, package_name=?, price=?, offer=?, total_price=? WHERE booking_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, customer_id);
            ps.setString(2, customer_name);
            ps.setString(3, phone);
            ps.setString(4, total_persons);
            ps.setString(5, booking_date);
            ps.setString(6, package_name);
            ps.setString(7, price);
            ps.setString(8, offer);
            ps.setString(9, total_price);
            ps.setString(10, booking_id);

            int rows = ps.executeUpdate();
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            if (rows > 0) {
                out.println("<h3 style='color:green;'>Booking updated successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Booking update failed!</h3>");
            }

            con.close();
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
