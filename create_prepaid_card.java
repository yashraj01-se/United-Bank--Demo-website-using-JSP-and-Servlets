import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class create_prepaid_card extends HttpServlet {

    // Database connection details (adjust to your own setup)
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    // Minimum income and credit score thresholds for Prepaid card
    private static final double MIN_INCOME = 30000.0; // Minimum income (in INR)
    private static final int MIN_CREDIT_SCORE = 650;  // Minimum credit score

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String cardType = request.getParameter("cardType");
        String incomeStr = request.getParameter("income");
        String creditScoreStr = request.getParameter("creditScore");

        // Retrieve the session
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }

        // Validate the income and credit score
        boolean isValid = validateIncomeAndCreditScore(incomeStr, creditScoreStr);

        if (!isValid) {
            response.sendRedirect("create_prepaid_card.jsp?error=not");
            return;
        }

        // Verify the user details from the bank account table
        boolean isVerified = verifyUserDetails(email, phone, address);

        if (isVerified) {
            // If details are verified, proceed with saving the prepaid card application data
            boolean isSuccess = savePrepaidCardApplication(fullName, email, phone, address, cardType, incomeStr, creditScoreStr);

            if (isSuccess) {
                response.sendRedirect("create_prepaid_card.jsp?success=ok"); // Redirect to success page
            } else {
                response.sendRedirect("create_prepaid_card.jsp?error=not_inserted"); // Redirect to error page
            }
        } else {
            // If verification fails, redirect to error page
            response.sendRedirect("create_prepaid_card.jsp?error=invalid"); // Redirect to a page showing mismatch error
        }
    }

    // Method to validate income and credit score
    private boolean validateIncomeAndCreditScore(String incomeStr, String creditScoreStr) {
        try {
            // Parse the income and credit score values
            double income = Double.parseDouble(incomeStr);
            int creditScore = Integer.parseInt(creditScoreStr);

            // Check if income and credit score meet the minimum requirements
            if (income >= MIN_INCOME && creditScore >= MIN_CREDIT_SCORE) {
                return true;
            } else {
                return false;
            }
        } catch (NumberFormatException e) {
            return false; // Return false if there was an error parsing the values
        }
    }

    // Method to verify the user details (email, phone, address)
    private boolean verifyUserDetails(String email, String phone, String address) {
        boolean isVerified = false;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to verify if the email, phone, and address exist in the bank account table
            String sql = "SELECT * FROM bank_account WHERE email = ? AND phone = ? AND address = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            stmt.setString(3, address);

            rs = stmt.executeQuery();

            if (rs.next()) {
                // If a matching record is found, verification is successful
                isVerified = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
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

    // Method to save the prepaid card application into the database
    private boolean savePrepaidCardApplication(String fullName, String email, String phone, String address, String cardType, String income, String creditScore) {
        boolean isSaved = false;
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the application data into the prepaid_card_application table
            String sql = "INSERT INTO prepaid_card(full_name, email, phone, address, card_type, income, credit_score) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, cardType);
            stmt.setString(6, income);
            stmt.setString(7, creditScore);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true; // Successfully saved the application data
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
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
