import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class newsignup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users1(username, name, password, question, answer) VALUES(?, ?, ?, ?, ?)");

            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, password);
            ps.setString(4, question);
            ps.setString(5, answer);

            int i = ps.executeUpdate();
            PrintWriter out = response.getWriter();
            if(i > 0){
                out.println("<b><h1>Account Created Successfully</b></h1>");
                out.println("<b><h2>Now you can back (arrow) left Top Corner. </b></h2>");
                out.println("<b><h2>Start Your Journey. Have a good Day. </b></h2>");
                 out.println("<b><h2>THANK YOU </b></h2>");
            } else {
                out.println("<h1>Error occurred</h1>");
            }

            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}




    
       
