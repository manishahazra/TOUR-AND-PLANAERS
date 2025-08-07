import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewCustomerList")
public class ViewCustomerList extends HttpServlet {
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doGet(HttpServletRequest req,HttpServletResponse rsp ) throws IOException,ServletException
    {
        
        rsp.setContentType("text/html");
        PrintWriter out = rsp.getWriter();
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/tourism2","root","Sys@tem123#mon");
           
            String sql;
            
            sql = "select * from customer2";
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            out.println("<table cellspacing='3' width='1800px' border='3'table align='center'>");
            out.println("<tr>");
            out.println("<td>  ID</td>");
            out.println("<td> NAME </td>");
            out.println("<td> AGE </td>");
            out.println("<td> ID DOCUMENT </td>");
            out.println("<td> ADDRESS </td>");
            out.println("<td> PHONE/MOBILE NO </td>");
            out.println("<td> PACKAGE NAME </td>");
            out.println("<td> GENDER </td>");
            out.println("<td> RELIGION</td>");
            out.println("<td> CASTE </td>");
            out.println("<td> COUNTRY </td>");
            out.println("<td> EMAIL ADDRESS</td>");
            out.println("<td> QUALIFICATION </td>");
            out.println("</tr>");
            while(rs.next())
            {
             out.println("<tr>");
             out.println("<td>"+rs.getString("customerid")+"</td>");  
             out.println("<td>"+rs.getString("customername")+"</td>");  
             out.println("<td>"+rs.getString("customerage")+ "</td>");
             out.println("<td>"+rs.getString("iddocument")+"</td>");  
             out.println("<td>"+rs.getString("customeraddress")+"</td>");  
             out.println("<td>"+rs.getString("customerphoneno")+"</td>");
             out.println("<td>"+rs.getString("packagename")+"</td>");  
             out.println("<td>"+rs.getString("customergender")+"</td>");  
             out.println("<td>"+rs.getString("customerreligion")+"</td>");  
             out.println("<td>"+rs.getString("customercaste")+"</td>");  
             out.println("<td>"+rs.getString("country")+"</td>");  
             out.println("<td>"+rs.getString("emailaddress")+"</td>");
             out.println("<td>"+rs.getString("customerqualification")+"</td>");  
             out.println("</tr>");
            }
            out.println("</table>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewCustomerList.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
             out.println("<font color='red'>Record Failed</font>");  
        }
        
    }  
}
