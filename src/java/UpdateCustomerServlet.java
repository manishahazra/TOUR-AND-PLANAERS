
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    try {
      int customerid = Integer.parseInt(request.getParameter("customerid"));
      String customername = request.getParameter("customername");
      int customerage = Integer.parseInt(request.getParameter("customerage"));
      String iddocument = request.getParameter("iddocument");
      String customeraddress = request.getParameter("customeraddress");
      String customerphoneno = request.getParameter("customerphoneno");
      String packagename = request.getParameter("packagename");
      String customergender = request.getParameter("customergender");
      String customerreligion = request.getParameter("customerreligion");
      String customercaste = request.getParameter("customercaste");
      String country = request.getParameter("country");
      String emailaddress = request.getParameter("emailaddress");
      String customerqualification = request.getParameter("customerqualification");

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

      String sql = "UPDATE customer2 SET customername=?, customerage=?, iddocument=?, customeraddress=?, customerphoneno=?, packagename=?, customergender=?, customerreligion=?, customercaste=?, country=?, emailaddress=?, customerqualification=? WHERE customerid=?";
      PreparedStatement ps = con.prepareStatement(sql);

      ps.setString(1, customername);
      ps.setInt(   2, customerage);
      ps.setString(3, iddocument);
      ps.setString(4, customeraddress);
      ps.setString(5, customerphoneno);
      ps.setString(6, packagename);
      ps.setString(7, customergender);
      ps.setString(8, customerreligion);
      ps.setString(9, customercaste);
      ps.setString(10, country);
      ps.setString(11, emailaddress);
      ps.setString(12, customerqualification);
      ps.setInt(   13, customerid);

      int result = ps.executeUpdate();
      con.close();

      if (result > 0) {
        out.println("<script>alert('Customer updated successfully!');location='Dashboard.html';</script>");
      } else {
        out.println("<script>alert('Update failed. Customer ID not found.');location='edit_customer.jsp';</script>");
      }

    } catch (Exception e) {
      e.printStackTrace(); // Log to server
      out.println("<script>alert('Error: " + e.getMessage() + "');location='edit_customer.jsp';</script>");
    }
  }
}
