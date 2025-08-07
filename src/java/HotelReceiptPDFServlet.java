import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

public class HotelReceiptPDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username"); // pass via URL
        if (username == null || username.trim().equals("")) {
            response.getWriter().println("Username required.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism2", "root", "Sys@tem123#mon");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM hotel_booking WHERE username=? ORDER BY id DESC LIMIT 1");
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=Hotel_Receipt.pdf");

                Document document = new Document();
                PdfWriter.getInstance(document, response.getOutputStream());
                document.open();

                document.addTitle("Hotel Booking Receipt Copy");
                document.add(new Paragraph("Hotel Booking Receipt", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20)));
                document.add(new Paragraph(" "));

                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(100);
                
                table.addCell("Booking Date");
                table.addCell(rs.getString("booking_date"));

                table.addCell("Username");
                table.addCell(rs.getString("username"));

                table.addCell("Hotel");
                table.addCell(rs.getString("hotel"));

                table.addCell("Persons");
                table.addCell(String.valueOf(rs.getInt("persons")));

                table.addCell("Days");
                table.addCell(String.valueOf(rs.getInt("days")));

                table.addCell("AC");
                table.addCell(rs.getString("ac"));

                table.addCell("Food");
                table.addCell(rs.getString("food"));

                table.addCell("ID");
                table.addCell(rs.getString("id_type"));

                table.addCell("Room Number");
                table.addCell(rs.getString("room"));

                table.addCell("Phone");
                table.addCell(rs.getString("phone"));

                table.addCell("Total Price");
                table.addCell("Rs. " + rs.getInt("total"));

                document.add(table);
                document.add(new Paragraph(" "));
                document.add(new Paragraph("Thank you for booking with us!", FontFactory.getFont(FontFactory.HELVETICA, 14)));
                document.add(new Paragraph("Authorized Signature", FontFactory.getFont(FontFactory.HELVETICA, 14)));

                document.close();
            } else {
                response.getWriter().println("No booking found for user: " + username);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
