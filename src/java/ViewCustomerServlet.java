import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customername = request.getParameter("customerid");
        Customer customer = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE customerid=?");
            String customerid = null;
            ps.setString(1, customerid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = customer(
                    rs.getString("customerid"),
                    rs.getString("customername"), 
                    rs.getString("customerage"),    
                    rs.getString("iddocument"),
                    rs.getString("customeraddress"),
                    rs.getString("customermobileno"),
                    rs.getString("packagename"),
                    rs.getString("customergender"),
                    rs.getString("customerreligion"),
                    rs.getString("customercaste"),
                    rs.getString("country"),
                    rs.getString("emailaddress"),
                    rs.getString("customerqualification")
                    );
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("view-customer.jsp").forward(request, response);
    }

    private Customer customer(String string, String string0, String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private Customer customer(String string, String string0, String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private static class Customer {

        public Customer() {
        }

        private Customer(String string, String string0, String string1, String string2, String string3, String string4, String string5, String string6, String string7) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }
}
