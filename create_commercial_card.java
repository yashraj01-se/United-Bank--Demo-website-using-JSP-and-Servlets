import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class create_commercial_card extends HttpServlet {

    // Database connection details (adjust to your own setup)
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    // Minimum income and credit score thresholds for commercial card eligibility
    private static final double MIN_INCOME = 50000.0; // Minimum income (in INR)
    private static final int MIN_CREDIT_SCORE = 650;  // Minimum credit score

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters from the request
        String businessName = request.getParameter("businessName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String registrationNo = request.getParameter("registrationNo");
        String cardType = request.getParameter("cardType");
        String incomeStr = request.getParameter("income");
        String creditScoreStr = request.getParameter("creditScore");

        // Retrieve the session and ensure user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }

        // Validate income and credit score
        boolean isValid = validateIncomeAndCreditScore(incomeStr, creditScoreStr);
        if (!isValid) {
            response.sendRedirect("create_commercial_card.jsp?error=not");
            return;
        }

        // Verify user's details using the phone number
        boolean isVerified = verifyUserDetails(phone,email);
        if (isVerified) {
            // Save the commercial card application to the database
            boolean isSuccess = saveCommercialCardApplication(businessName, email, phone, address, registrationNo, cardType, incomeStr, creditScoreStr);
            if (isSuccess) {
                response.sendRedirect("create_commercial_card.jsp?success=ok"); // Redirect to success page
            } else {
                response.sendRedirect("create_commercial_card.jsp?error=not_inserted"); // Redirect to error page
            }
        } else {
            // If user verification fails, redirect to error page
            response.sendRedirect("create_commercial_card.jsp?error=invalid");
        }
    }

    // Method to validate income and credit score
    private boolean validateIncomeAndCreditScore(String incomeStr, String creditScoreStr) {
        try {
            // Parse the income and credit score values
            double income = Double.parseDouble(incomeStr);
            int creditScore = Integer.parseInt(creditScoreStr);

            // Check if income and credit score meet the required minimums
            return income >= MIN_INCOME && creditScore >= MIN_CREDIT_SCORE;
        } catch (NumberFormatException e) {
            return false; // Return false if input cannot be parsed
        }
    }

    // Method to verify user's phone number in the bank_account table
    private boolean verifyUserDetails(String phone,String email) {
        boolean isVerified = false;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to verify if the phone number exists in the bank_account table
            String sql = "SELECT * FROM bank_account WHERE phone = ? AND email=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, phone);
            stmt.setString(2,email);

            rs = stmt.executeQuery();

            // If a matching record is found, user details are verified
            if (rs.next()) {
                isVerified = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isVerified;
    }

    // Method to save the commercial transit card application into the database
    private boolean saveCommercialCardApplication(String businessName, String email, String phone, String address, String registrationNo, String cardType, String income, String creditScore) {
        boolean isSaved = false;
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the application data into the commercial_transit_card_applications table
            String sql = "INSERT INTO commercial_transit_card(business_name, email, phone, address, registration_no, card_type, income, credit_score) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, businessName);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, registrationNo);
            stmt.setString(6, cardType);
            stmt.setString(7, income);
            stmt.setString(8, creditScore);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true; // Successfully saved the application data
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSaved;
    }
}
