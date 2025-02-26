import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/transfer_funds")
public class FundTransferServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/userlogin";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }

        // Get the logged-in username from the session
        String loggedInUsername = (String) session.getAttribute("username");

        // Proceed with the transaction if the usernames match
        String enteredUsername = request.getParameter("Username");  // Corrected the variable name for consistency
        String senderAccountNumber = request.getParameter("senderAccount");
        String transactionType = request.getParameter("transactionType");
        String receiverAccount = request.getParameter("receiverAccount");
        String amountStr = request.getParameter("amount");
        
        // Ensure the entered username matches the logged-in username
        if (enteredUsername == null || !enteredUsername.equals(loggedInUsername)) {
            response.sendRedirect("money_transfer.jsp?error=unauthorized");
            return;
        }

        if (senderAccountNumber == null || senderAccountNumber.trim().isEmpty() ||
            amountStr == null || amountStr.trim().isEmpty()) {
          response.sendRedirect("money_transfer.jsp?error=error");
            return;
        }

        double amount;
        try {
            amount = Double.parseDouble(amountStr.trim());
            if (amount <= 0) {
                response.sendRedirect("money_transfer.jsp?error=error");
                return;
            }
        } catch (NumberFormatException e) {
          response.sendRedirect("money_transfer.jsp?error=error");
            return;
        }

        Connection conn = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false);

            boolean transactionProcessed = false;

            if ("Transfer".equalsIgnoreCase(transactionType)) {
                if (!isValidAccount(conn, receiverAccount)) {
                   response.sendRedirect("money_transfer.jsp?error=error");
                    return;
                }

                transactionProcessed = handleTransfer(conn, senderAccountNumber, receiverAccount, amount);

            } else if ("Deposit".equalsIgnoreCase(transactionType)) {
                transactionProcessed = handleDeposit(conn, senderAccountNumber, amount);

            } else {
                respondWithError(response, "Unsupported transaction type.");
                return;
            }

            if (transactionProcessed) {
                conn.commit();
                response.sendRedirect("money_transfer.jsp?success=success");
            } else {
                conn.rollback();
                response.sendRedirect("money_transfer.jsp?error=error");
            }

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            respondWithError(response, "Unexpected error: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
    }

    private boolean isValidAccount(Connection conn, String accountNumber) throws Exception {
        String query = "SELECT 1 FROM accounts WHERE accountnumber = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, accountNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    private boolean handleTransfer(Connection conn, String senderAccount, String receiverAccount, double amount) throws Exception {
        String deductQuery = "UPDATE accounts SET balance = balance - ? WHERE accountnumber = ? AND balance >= ?";
        String creditQuery = "UPDATE accounts SET balance = balance + ? WHERE accountnumber = ?";

        try (PreparedStatement deductStmt = conn.prepareStatement(deductQuery);
             PreparedStatement creditStmt = conn.prepareStatement(creditQuery)) {

            deductStmt.setDouble(1, amount);
            deductStmt.setString(2, senderAccount);
            deductStmt.setDouble(3, amount);

            if (deductStmt.executeUpdate() == 0) {
                return false; // Insufficient funds or invalid sender account
            }

            creditStmt.setDouble(1, amount);
            creditStmt.setString(2, receiverAccount);

            if (creditStmt.executeUpdate() == 0) {
                rollbackTransfer(conn, senderAccount, amount);
                return false;
            }

            // Log the transaction
            logTransaction(conn, senderAccount, "Transfer", senderAccount, receiverAccount, amount, "Transfer successful");

            return true;
        }
    }

    private boolean handleDeposit(Connection conn, String accountNumber, double amount) throws Exception {
        String depositQuery = "UPDATE accounts SET balance = balance + ? WHERE accountnumber = ?";
        try (PreparedStatement depositStmt = conn.prepareStatement(depositQuery)) {
            depositStmt.setDouble(1, amount);
            depositStmt.setString(2, accountNumber);

            if (depositStmt.executeUpdate() > 0) {
                // Log the transaction
                logTransaction(conn, accountNumber, "Deposit", accountNumber, null, amount, "Deposit successful");
                return true;
            }
            return false;
        }
    }

    private void rollbackTransfer(Connection conn, String senderAccount, double amount) throws Exception {
        String rollbackQuery = "UPDATE accounts SET balance = balance + ? WHERE accountnumber = ?";
        try (PreparedStatement rollbackStmt = conn.prepareStatement(rollbackQuery)) {
            rollbackStmt.setDouble(1, amount);
            rollbackStmt.setString(2, senderAccount);
            rollbackStmt.executeUpdate();

            // Log the rollback
            logTransaction(conn, senderAccount, "Rollback", senderAccount, null, amount, "Rollback due to credit failure");
        }
    }

    private void logTransaction(Connection conn, String username, String transactionType, String senderAccount, String receiverAccount, double amount, String remarks) throws Exception {
        String logQuery = "INSERT INTO TRANSACTIONS (username, TRANSACTION_TYPE, SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, REMARKS, TRANSACTION_TIME) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        try (PreparedStatement logStmt = conn.prepareStatement(logQuery)) {
            logStmt.setString(1, username);  // Corrected the parameter to use 'username'
            logStmt.setString(2, transactionType);
            logStmt.setString(3, senderAccount);
            logStmt.setString(4, receiverAccount);
            logStmt.setDouble(5, amount);
            logStmt.setString(6, remarks);
            logStmt.executeUpdate();
        }
    }

    private void respondWithError(HttpServletResponse response, String errorMessage) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("Error: " + errorMessage);
    }
}
