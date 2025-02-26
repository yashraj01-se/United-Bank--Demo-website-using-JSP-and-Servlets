import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Database configuration
        String URL = "jdbc:derby://localhost:1527/userlogin"; 
        String dbUser = "username"; 
        String dbPassword = "password"; 

        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, dbUser, dbPassword);
            System.out.println("Database connection successful!");

            // Check if the user exists with the provided username and password
            String sql = "SELECT id,email FROM bank_account WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login
                String firstName = rs.getString("id");
                String email = rs.getString("email");

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("firstName", firstName);
                session.setAttribute("email", email);

                // Redirect to home page
                response.sendRedirect("home_page.jsp?success=logged_in");
            } else {
                // Login failed
                response.sendRedirect("login.jsp?error=invalid_credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
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
