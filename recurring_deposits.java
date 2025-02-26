import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class recurring_deposits extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    // JDBC variables for opening, closing, and managing connection
    private Connection conn;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from the form
        String name = request.getParameter("rdName");
        String amountStr = request.getParameter("amount");
        String durationStr = request.getParameter("duration");
        String accountNumber = request.getParameter("accountNumber"); // Get account number from form
        String errorMessage = null;

        try {
            // Validate input data
            if (name == null || name.isEmpty() || amountStr == null || amountStr.isEmpty() || durationStr == null || durationStr.isEmpty() || accountNumber == null || accountNumber.isEmpty()) {
                errorMessage = "All fields are required.";
                forwardToFormWithMessage(request, response, errorMessage);
                return;
            }

            // Establish the database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connection successful!");

            // Retrieve the session
            HttpSession session = request.getSession(false);

            // Check if user is logged in
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp?error=login");
                return;
            }

            // Get the logged-in user
            String loggedInUser = (String) session.getAttribute("username");

            // Check if the account number exists in the database
            String checkExistingQuery = "SELECT * FROM savings_account WHERE account_number = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(checkExistingQuery)) {
                pstmt.setString(1, accountNumber);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (!rs.next()) {
                        // Account number does not exist
                        errorMessage = "Invalid account number.";
                        response.sendRedirect("recurring_deposits.jsp?error=rd_creation_failed");
                        return;
                    }
                }
            }

            // Parse amount and duration
            double amount = Double.parseDouble(amountStr);
            int duration = Integer.parseInt(durationStr);

            // Validate amount and duration
            if (amount <= 0) {
                errorMessage = "Amount should be greater than 0.";
                forwardToFormWithMessage(request, response, errorMessage);
                return;
            }

            if (duration <= 0) {
                errorMessage = "Please select a valid duration.";
                forwardToFormWithMessage(request, response, errorMessage);
                return;
            }

            // Create SQL query to insert fixed deposit into the database
            String sql = "INSERT INTO recurring_deposits (account_number, name, deposit_amount, deposit_duration) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, accountNumber);
                stmt.setString(2, name);
                stmt.setDouble(3, amount);
                stmt.setInt(4, duration);

                // Execute update
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Redirect to success page
                    response.sendRedirect("recurring_deposits.jsp?success=rd_created");
                } else {
                    response.sendRedirect("recurring_deposits.jsp?error=rd_creation_failed");
                }
            }
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
            forwardToFormWithMessage(request, response, errorMessage);
        } catch (NumberFormatException e) {
            errorMessage = "Invalid number format. Please check the fields.";
            forwardToFormWithMessage(request, response, errorMessage);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(recurring_deposits.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the database connection if it was established
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Method to forward the error message to the recurring_deposits.jsp page
    private void forwardToFormWithMessage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("error", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("recurring_deposits.jsp");
        dispatcher.forward(request, response);
    }

    // Method to generate the deposit receipt for the user
    private void generateReceipt(HttpServletResponse response, String username, String name, double amount, int duration) throws IOException {
        // Set response content type to force download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=deposit_receipt.txt");

        // Write receipt content
        try (PrintWriter out = response.getWriter()) {
            out.println("Recurring Deposit Receipt");
            out.println("---------------------");
            out.println("Username: " + username);
            out.println("Name: " + name);
            out.println("Account Number: "); // Ensure this variable is available in context
            out.println("Amount: " + amount);
            out.println("Duration (months): " + duration);
            out.println("Thank you for your deposit!");
        }
    }

    // Method to close the database connection when the servlet is destroyed
    @Override
    public void destroy() {
        // Connection cleanup is now handled in the doPost method
    }
}
