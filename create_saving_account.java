import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class create_saving_account extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username"; // Update with your database username
    private static final String DB_PASSWORD = "password"; // Update with your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // Retrieve the session
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login_required");
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
        String accountNumber = request.getParameter("accountNumber");
        String balanceStr = request.getParameter("balance");
        String customerId = request.getParameter("customerId"); // Assuming customerId is stored in session

        double balance = 0.0;
        if (balanceStr != null && !balanceStr.isEmpty()) {
            try {
                balance = Double.parseDouble(balanceStr);
                if (balance < 0) {
                    response.sendRedirect("create_savings_account.jsp?error=invalid_balance");
                    return;
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("create_savings_account.jsp?error=invalid_balance_format");
                return;
            }
        }

        try {
            // Input validation
            if (name == null || email == null || phone == null || address == null || dob == null 
                || accountType == null || nationalId == null || accountNumber == null 
                || name.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty()
                || dob.isEmpty() || accountType.isEmpty() || nationalId.isEmpty() || accountNumber.isEmpty()) {
                response.sendRedirect("create_savings_account.jsp?error=missing_fields");
                return;
            }

            // Establish the database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false); // Enable transaction management

            // Validate user in bank_account table
            String checkUserQuery = "SELECT * FROM bank_account WHERE email = ? AND phone = ? AND address = ?";
            pstmt = conn.prepareStatement(checkUserQuery);
            pstmt.setString(1, email);
            pstmt.setString(2, phone);
            pstmt.setString(3, address);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                response.sendRedirect("create_saving_account.jsp?error=information_mismatched");
                return;
            }
         

            // Check if the account number already exists
            String checkAccountQuery = "SELECT account_number FROM savings_account WHERE account_number = ?";
            pstmt = conn.prepareStatement(checkAccountQuery);
            pstmt.setString(1, accountNumber);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("create_saving_account.jsp?error=account_number_exists");
                return;
            }

            // Insert into savings_account
            String insertSavingsQuery = 
                "INSERT INTO savings_account (full_name, email, phone, address, dob, account_type, national_id, account_number) " +
                "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertSavingsQuery);
            
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setDate(5, Date.valueOf(dob)); // Convert String to SQL Date
            pstmt.setString(6, accountType);
            pstmt.setString(7, nationalId);
            pstmt.setString(8, accountNumber);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted <= 0) {
                conn.rollback();
                response.sendRedirect("create_saving_account.jsp?error=savings_account_creation_failed");
                return;
            }

            // Insert into accounts table
            String insertAccountQuery = 
                "INSERT INTO accounts (username, accountnumber, customerid, balance) " +
                "VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertAccountQuery);
            pstmt.setString(1, (String) session.getAttribute("username"));
            pstmt.setString(2, accountNumber);
            pstmt.setString(3, customerId);
            pstmt.setDouble(4, balance);

            rowsInserted = pstmt.executeUpdate();
            if (rowsInserted <= 0) {
                conn.rollback();
                response.sendRedirect("create_saving_account.jsp?error=account_creation_failed");
                return;
            }

            // Commit the transaction
            conn.commit();
            response.sendRedirect("create_saving_account.jsp?success=account_created");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            response.sendRedirect("create_saving_account.jsp?error=exception_occurred");
        } finally {
            // Clean up resources
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
