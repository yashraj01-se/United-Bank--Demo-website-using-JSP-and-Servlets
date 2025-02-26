import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class create_Business_loan extends HttpServlet {

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
        String Fullname = request.getParameter("name");
        String BusinessName = request.getParameter("businessName");
        String BusinessAddress = request.getParameter("address");
        String email = request.getParameter("email");
        String LoanAmountstr = request.getParameter("loanAmount");
        String BusinessType = request.getParameter("businessType");  // Fixed the extra space
        String businessVintagestr = request.getParameter("businessVintage");
        String revenuestr = request.getParameter("annualRevenue");
        String Purpose = request.getParameter("loanPurpose");

        // Initialize response message variables
        String message = "";

        // Parse loan amount, business vintage, and revenue with validation
        int loanAmount = 0;
        if (LoanAmountstr != null && !LoanAmountstr.trim().isEmpty()) {
            try {
                loanAmount = Integer.parseInt(LoanAmountstr.trim());
            } catch (NumberFormatException e) {
                response.sendRedirect("create_Business_loan.jsp?error=invalid_loan_amount");
                return;
            }
        } else {
            response.sendRedirect("create_Business_loan.jsp?error=loan_amount_required");
            return;
        }

        int businessVintage = 0;
        if (businessVintagestr != null && !businessVintagestr.trim().isEmpty()) {
            try {
                businessVintage = Integer.parseInt(businessVintagestr.trim());
            } catch (NumberFormatException e) {
                response.sendRedirect("create_Business_loan.jsp?error=invalid_business_vintage");
                return;
            }
        } else {
            response.sendRedirect("create_Business_loan.jsp?error=business_vintage_required");
            return;
        }

        int revenue = 0;
        if (revenuestr != null && !revenuestr.trim().isEmpty()) {
            try {
                revenue = Integer.parseInt(revenuestr.trim());
            } catch (NumberFormatException e) {
                response.sendRedirect("create_Business_loan.jsp?error=invalid_revenue");
                return;
            }
        } else {
            response.sendRedirect("create_Business_loan.jsp?error=revenue_required");
            return;
        }

        // JDBC configuration
        String DB_URL = "jdbc:derby://localhost:1527/userlogin";
        String DB_USERNAME = "username"; // Your DB username
        String DB_PASSWORD = "password"; // Your DB password

        Connection connection = null;
        PreparedStatement psCheckUser = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            // Establish database connection          
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Step 1: Verify the logged-in user details against the bank_account table
            String checkUserQuery = "SELECT * FROM bank_account WHERE username = ? AND email = ?";
            psCheckUser = connection.prepareStatement(checkUserQuery);
            psCheckUser.setString(1, loggedInUsername); // Use username from the session
            psCheckUser.setString(2, email);
            rs = psCheckUser.executeQuery();

            // If user exists, proceed with loan application insertion
            if (rs.next()) {
                // Step 2: Insert loan application into Business_loan_Application table
                String insertQuery = "INSERT INTO Business_loan_Application (fullname, businessname, businessaddress, email, loanamount, businesstype, businessvintage, revenue, purpose) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                psInsert = connection.prepareStatement(insertQuery);
                psInsert.setString(1, Fullname);
                psInsert.setString(2, BusinessName);
                psInsert.setString(3, BusinessAddress);
                psInsert.setString(4, email);
                psInsert.setDouble(5, loanAmount);
                psInsert.setString(6, BusinessType);
                psInsert.setInt(7, businessVintage);
                psInsert.setInt(8, revenue);
                psInsert.setString(9, Purpose);
                psInsert.executeUpdate();

                // Redirect to success page
                response.sendRedirect("create_Business_loan.jsp?success=loan_application_success");
            } else {
                // If user does not exist, redirect with an error message
                response.sendRedirect("create_Business_loan.jsp?error=user_verification_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = e.getMessage().replaceAll(" ", "%20");
            response.sendRedirect("create_Business_loan.jsp?error=loan_application_failed&message=" + errorMessage);
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
