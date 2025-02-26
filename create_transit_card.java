import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class create_transit_card extends HttpServlet {

    // Database connection details (adjust to your own setup)
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    // Minimum income and credit score thresholds for transit card eligibility
    private static final double MIN_INCOME = 30000.0; // Minimum income (in INR)
    private static final int MIN_CREDIT_SCORE = 700;  // Minimum credit score

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters from the request
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
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
            response.sendRedirect("create_transit_card.jsp?error=not");
            return;
        }

        // Verify user's details in the bank_account table
        boolean isVerified = verifyUserDetails(email, phone, address);
        if (isVerified) {
            // Save the transit card application to the database
            boolean isSuccess = saveTransitCardApplication(fullName, email, phone, address, cardType, incomeStr, creditScoreStr);
            if (isSuccess) {
                response.sendRedirect("create_transit_card.jsp?success=ok"); // Redirect to success page
            } else {
                response.sendRedirect("create_transit_card.jsp?error=not_inserted"); // Redirect to error page
            }
        } else {
            // If user verification fails, redirect to error page
            response.sendRedirect("create_transit_card.jsp?error=invalid");
        }
    }

    // Method to validate income and credit score
    private boolean validateIncomeAndCreditScore(String incomeStr, String creditScoreStr) {
        try {
            // Parse the income and credit score values
            double income = Double.parseDouble(incomeStr);
            int creditScore = Integer.parseInt(creditScoreStr);

            // Check if income and credit score meet the required minimums
            if (income >= MIN_INCOME && creditScore >= MIN_CREDIT_SCORE) {
                return true;
            } else {
                return false;
            }
        } catch (NumberFormatException e) {
            return false; // Return false if input cannot be parsed
        }
    }

    // Method to verify user's details (email, phone, and address)
    private boolean verifyUserDetails(String email, String phone, String address) {
        boolean isVerified = false;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to verify if the email, phone, and address match in the bank_account table
            String sql = "SELECT * FROM bank_account WHERE email = ? AND phone = ? AND address = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            stmt.setString(3, address);

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

    // Method to save the transit card application into the database
    private boolean saveTransitCardApplication(String fullName, String email, String phone, String address, String cardType, String income, String creditScore) {
        boolean isSaved = false;
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the application data into the transit_card_applications table
            String sql = "INSERT INTO transit_card(fullname, email, phone, address, cardtype, income, creditscore) VALUES (?, ?, ?, ?, ?, ?, ?)";
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
