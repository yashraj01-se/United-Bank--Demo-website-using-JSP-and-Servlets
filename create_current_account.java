import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class create_current_account extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // Retrieve the session
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob"); // Expected format: "yyyy-MM-dd"
        String accountType = request.getParameter("accountType");
        String nationalId = request.getParameter("nationalId");
        String accountNumber = request.getParameter("accountNumber"); // Get account number from form
        String customerId = request.getParameter("customerId"); // Assuming customerId is stored in session
        String balanceStr = request.getParameter("balance"); // New field for balance
        double balance = (balanceStr != null && !balanceStr.isEmpty()) ? Double.parseDouble(balanceStr) : 0.00; // Default to 0.00 if empty

        try {
            // Input validation
            if (email == null || email.isEmpty() || phone == null || phone.isEmpty() 
                || address == null || address.isEmpty() || accountNumber == null || accountNumber.isEmpty()) {
                response.sendRedirect("create_current_account.jsp?error=missing_fields");
                return;
            }

            // Check if customerId is null
            if (customerId == null) {
                response.sendRedirect("create_current_account.jsp?error=customer_id_missing");
                return;
            }

            // Establish the database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false); // Enable transaction management

            // Validate user information against bank_account table
            String validateUserQuery = 
                "SELECT * FROM bank_account WHERE email = ? AND phone = ? AND address = ?";
            pstmt = conn.prepareStatement(validateUserQuery);
           
            pstmt.setString(1, email);
            pstmt.setString(2, phone);
            pstmt.setString(3, address);
            rs = pstmt.executeQuery();

            if (!rs.next()) { // If no matching record found
                response.sendRedirect("create_current_account.jsp?error=information_mismatched");
                return;
            }

            // Insert into current_account table
            String insertCurrentAccountQuery = 
                "INSERT INTO current_account (name, email, phone, address, dob, accounttype, nationalid, account_number) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertCurrentAccountQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setDate(5, Date.valueOf(dob)); // Convert String to SQL Date
            pstmt.setString(6, accountType);
            pstmt.setString(7, nationalId);
            pstmt.setLong(8, Long.parseLong(accountNumber)); // Save the account number
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                // Insert into accounts table including the balance
                String insertAccountsQuery = 
                    "INSERT INTO accounts (username, accountnumber,customerid, balance) " +
                    "VALUES ( ?, ?, ?, ?)";
                try (PreparedStatement accountsPstmt = conn.prepareStatement(insertAccountsQuery)) {
                    accountsPstmt.setString(1, (String) session.getAttribute("username"));
                    accountsPstmt.setLong(2, Long.parseLong(accountNumber));
                    accountsPstmt.setString(3, customerId); // Use the customer ID from the session
                    accountsPstmt.setDouble(4, balance); // Store the balance
                    accountsPstmt.executeUpdate();
                }

                // Commit transaction
                conn.commit();
                response.sendRedirect("create_current_account.jsp?success=account_created");
            } else {
                conn.rollback();
                response.sendRedirect("create_current_account.jsp?error=account_creation_failed");
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // Rollback transaction on error
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            response.sendRedirect("create_current_account.jsp?error=account_creation_failed&message=" + sqle.getMessage());
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.sendRedirect("create_current_account.jsp?error=driver_not_found");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("create_current_account.jsp?error=exception_occurred");
        } finally {
            // Clean up database resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
