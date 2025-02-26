import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class create_home_loan extends HttpServlet {

   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
 // Retrieve the session
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }
        
        
        // Get logged-in username from the session
        String loggedInUsername = (String) session.getAttribute("username");

// Retrieve form data
        String loanAmountStr = request.getParameter("loanAmount");
        String loanTermStr = request.getParameter("loanTerm");
        String propertyValueStr = request.getParameter("propertyValue");
        String propertyAddress = request.getParameter("propertyAddress");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");

        // Initialize response message variables
        String message = "";
        
        
            // Parse the loan amount and property value
            double loanAmount = Double.parseDouble(loanAmountStr);
            int loanTerm = Integer.parseInt(loanTermStr);
            double propertyValue = Double.parseDouble(propertyValueStr);

            // JDBC configuration (replace with your actual database credentials)
     String DB_URL = "jdbc:derby://localhost:1527/userlogin"; // Your DB URL
    String DB_USERNAME = "username"; // Your DB username
    String DB_PASSWORD = "password"; // Your DB password
    
Connection connection = null;
        PreparedStatement psCheckUser = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            // Establish database connection          
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD );

            // Step 1: Verify the logged-in user details against the bank_account table
            String checkUserQuery = "SELECT * FROM bank_account WHERE username = ? AND email = ? AND phone = ?";
            psCheckUser = connection.prepareStatement(checkUserQuery);
            psCheckUser.setString(1, loggedInUsername); // Use username from the session
            psCheckUser.setString(2, email);
            psCheckUser.setString(3, contact);
           
            rs = psCheckUser.executeQuery();

            // If user exists, proceed with loan application insertion
            if (rs.next()) {
                // Step 2: Insert loan application into loan_application table
                String insertQuery = "INSERT INTO home_loan_application (loan_amount,loan_term,property_value, property_address,email,contact) VALUES (?, ?, ?, ?, ?, ?)";
                psInsert = connection.prepareStatement(insertQuery);
                psInsert.setDouble(1,loanAmount);
                psInsert.setInt(2, loanTerm );
                psInsert.setDouble(3, propertyValue);
                psInsert.setString(4, propertyAddress );
                psInsert.setString(5, email);
                psInsert.setString(6, contact);
               
                psInsert.executeUpdate();

                // Redirect to success page or send success message
                response.sendRedirect("create_home_loan.jsp?success=loan_application_success");
            } else {
                // If user does not exist, redirect with an error message
                response.sendRedirect("create_home_loan.jsp?error=user_verification_failed");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the error to the console
            // Include the error message in the redirect URL for debugging
            String errorMessage = e.getMessage();
            errorMessage = errorMessage.replaceAll(" ", "%20"); // Encode spaces for the URL
            response.sendRedirect("create_home_loan.jsp?error=loan_application_failed&message=" + errorMessage);
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (psCheckUser != null) psCheckUser.close();
                if (psInsert != null) psInsert.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
