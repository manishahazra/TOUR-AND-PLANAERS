import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Forget extends HttpServlet {
  protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

    res.setContentType("text/html");
    PrintWriter out = res.getWriter();

    String action = req.getParameter("action");
    String username = req.getParameter("username");

    String url = "jdbc:mysql://localhost:3306/tourism2";
    String dbuser = "root";
    String dbpass = "Sys@tem123#mon";

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(url, dbuser, dbpass);

      if ("search".equals(action)) {
        PreparedStatement ps = con.prepareStatement("SELECT name, security_question FROM users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
          String name = rs.getString("name");
          String question = rs.getString("security_question");

          req.setAttribute("username", username);
          req.setAttribute("name", name);
          req.setAttribute("security_question", question);
        } else {
          out.println("<script>alert('Username not found'); location='Forget.html';</script>");
          return;
        }
        RequestDispatcher rd = req.getRequestDispatcher("Forget.jsp");
        rd.forward(req, res);

      } else if ("retrieve".equals(action)) {
        String answer = req.getParameter("answer");

        PreparedStatement ps = con.prepareStatement("SELECT password FROM users WHERE username=? AND answer=?");
        ps.setString(1, username);
        ps.setString(2, answer);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
          String password = rs.getString("password");
          out.println("<script>alert('Your Password is: " + password + "'); location='index.html';</script>");
        } else {
          out.println("<script>alert('Incorrect Answer'); location='Forget.html';</script>");
        }

      } else if ("back".equals(action)) {
        res.sendRedirect("index.html");
      }

      con.close();

    } catch (Exception e) {
      e.printStackTrace();
      out.println("<script>alert('Error occurred');</script>");
    }
  }
}
