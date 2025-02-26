import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Database configuration
        String URL = "jdbc:derby://localhost:1527/userlogin"; 
        String dbUser = "username"; 
        String dbPassword = "password"; 

        // Retrieve form data
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipCode = request.getParameter("zipCode");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, dbUser, dbPassword);
            System.out.println("Database connection successful!");

            // Check if account with the same username already exists
            String checkQuery = "SELECT * FROM bank_account WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(checkQuery);
            pstmt.setString(1, username);
            pstmt.setString(2, password);  // Using both username and password for checking account existence
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Account with the same username and password already exists
                System.out.println("Account with the same username already exists.");
                response.sendRedirect("account.jsp?error=account_exists");
                return;
            }

            // If account does not exist, insert the new account
            String sql = "INSERT INTO bank_account (id, username, password, email, phone, address, city, state, zipCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);
            pstmt.setString(7, city);
            pstmt.setString(8, state);
            pstmt.setString(9, zipCode);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Account created successfully!");
                response.sendRedirect("account.jsp?success=account_created");
            } else {
                response.sendRedirect("account.jsp?error=account_exists");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("account.jsp?error=account_exists");
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
