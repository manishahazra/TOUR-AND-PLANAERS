import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class indexLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String robotCheck = request.getParameter("robot");

        // Step 1: Check Robot checkbox
        if (robotCheck == null) {
            out.println("<script>alert('Please confirm you are not a robot'); window.location='index.html';</script>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Step 2: Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 3: Establish DB connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            // Step 4: Prepare SQL
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            // Step 5: Execute query
            rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login
                String role = rs.getString("role");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setMaxInactiveInterval(30 * 60); // 30 minutes timeout

                response.sendRedirect("splash.html");
            } else {
                // Invalid login
                out.println("<script>alert('Invalid username or password'); window.location='index.html';</script>");
            }

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Step 6: Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }
    }

    // Optional: Redirect GET to index
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}
