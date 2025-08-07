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

@WebServlet("/ViewCustomerPackageList")
public class ViewCustomerPackageList extends HttpServlet {
    
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
            
            sql = "select * from bookings";
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            out.println("<table cellspacing='3' width='1800px' border='3'table align='center'>");
            out.println("<tr>");
            out.println("<td> BOOKING ID</td>");
             out.println("<td> CUSTOMER ID</td>");
            out.println("<td> CUSTOMER_NAME </td>");
            out.println("<td> PHONE </td>");
            out.println("<td> TOTAL_PERSONS </td>");
            out.println("<td> BOOKING_DATE</td>");
            out.println("<td> PACKAGE_NAME </td>");
            out.println("<td> PRICE </td>");
            out.println("<td> OFFERS </td>");
            out.println("<td> TOTAL_PRICE</td>");
           
            out.println("</tr>");
            while(rs.next())
            {
             out.println("<tr>");
              out.println("<td>"+rs.getString("booking_id")+"</td>"); 
             out.println("<td>"+rs.getString("customer_id")+"</td>");  
             out.println("<td>"+rs.getString("customer_name")+"</td>");  
             out.println("<td>"+rs.getString("phone")+ "</td>");
             out.println("<td>"+rs.getString("total_persons")+"</td>");  
             out.println("<td>"+rs.getString("booking_date")+"</td>");  
             out.println("<td>"+rs.getString("package_name")+"</td>");
             out.println("<td>"+rs.getString("price")+"</td>");  
             out.println("<td>"+rs.getString("offer")+"</td>");  
             out.println("<td>"+rs.getString("total_price")+"</td>");  
            
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
