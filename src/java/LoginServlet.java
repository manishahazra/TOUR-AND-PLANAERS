import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourism", "root", "Sys@tem123#mon");

            // Prepare SQL statement
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?");

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If login successful, redirect to splash.html
                response.sendRedirect("splash.html");
            } else {
                // If login fails, alert and redirect to login page
                out.println("<script>");
                out.println("alert('Invalid username or password');");
                out.println("window.location='index.html';");
                out.println("</script>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}
