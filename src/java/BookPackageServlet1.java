import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/BookPackageServlet1")
public class BookPackageServlet1 extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    // Get values from form
    String booking_Id = request.getParameter("booking_id");
    String customerId = request.getParameter("customer_id");
    String customerName = request.getParameter("customer_name");
    String phone = request.getParameter("phone");
    int totalPersons = Integer.parseInt(request.getParameter("total_persons"));
    String bookingDate = request.getParameter("booking_date");
    String packageName = request.getParameter("package_name");
    int price = Integer.parseInt(request.getParameter("price"));
    String offer = request.getParameter("offer");
    int totalPrice = Integer.parseInt(request.getParameter("total_price"));

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

      PreparedStatement ps = con.prepareStatement(
        "INSERT INTO booking1 (booking_id,customer_id, customer_name, phone, total_persons, booking_date, package_name, price, offer, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
      );
      ps.setString(1, booking_Id);
      ps.setString(2, customerId);
      ps.setString(3, customerName);
      ps.setString(4, phone);
      ps.setInt(5, totalPersons);
      ps.setString(6, bookingDate);
      ps.setString(7, packageName);
      ps.setInt(8, price);
      ps.setString(9, offer);
      ps.setInt(10, totalPrice);

      int i = ps.executeUpdate();

      if (i > 0) {
        out.println("<h2 style='text-align:center;color:green'>Package Booked Successfully!</h2>");
      } else {
        out.println("<h3 style='color:red'>Booking failed. Try again.</h3>");
      }

      out.println("<div style='text-align:center;'><a href='view_packages.html'>Back to Packages</a></div>");
    } catch (Exception e) {
      out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
    }
  }
}
