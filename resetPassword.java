import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class resetPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String URL = "jdbc:derby://localhost:1527/userlogin"; 
        String dbUser = "username"; 
        String dbPassword = "password"; 

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, dbUser, dbPassword);

            // Update the password in the database
            String updatePasswordQuery = "UPDATE bank_account SET password = ? WHERE email = ?";
            pstmt = conn.prepareStatement(updatePasswordQuery);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
               
                response.sendRedirect("login.jsp?success=updated_password");
            } else {
                
                response.sendRedirect("Forget_password.jsp?error=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("resetPassword.jsp?error=An error occurred: " + e.getMessage());
        } finally {
            // Clean up resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
