import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Forget_password extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String URL = "jdbc:derby://localhost:1527/userlogin"; 
        String dbUser = "username"; 
        String dbPassword = "password"; 

        String email = request.getParameter("email");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, dbUser, dbPassword);

            // Check if the email exists
            String checkEmailQuery = "SELECT * FROM bank_account WHERE email = ?";
            pstmt = conn.prepareStatement(checkEmailQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Email exists, redirect to reset password page with email parameter
                response.sendRedirect("resetPassword.jsp?email=" + email);
            } else {
                // Email does not exist
                response.sendRedirect("Forget_password.jsp?error=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgotPassword.jsp?error=An error occurred: " + e.getMessage());
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
