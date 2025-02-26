import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/create_emergency_loan")
public class create_Emergency extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve the session
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=login");
            return;
        }

        // Get logged-in username from the session
        String loggedInUsername = (String) session.getAttribute("username");

        // Get form data from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String loanAmountStr = request.getParameter("loanAmount");
        String loanPurpose = request.getParameter("loanPurpose");
        String incomeStr = request.getParameter("income");
        String creditstr = request.getParameter("creditScore");
        String status = request.getParameter("employmentStatus");
        String loanTermStr = request.getParameter("loanDuration");

        // Parse the numeric values
        double income = Double.parseDouble(incomeStr);
        double loanAmount = Double.parseDouble(loanAmountStr);
        double credit = Double.parseDouble(creditstr);
        int loanTerm = Integer.parseInt(loanTermStr);

        // Database connection parameters
        String jdbcUrl = "jdbc:derby://localhost:1527/userlogin"; // Update with your DB name
        String dbUser = "username"; // Update with your DB username
        String dbPassword = "password"; // Update with your DB password

        Connection connection = null;
        PreparedStatement psCheckUser = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Step 1: Verify the logged-in user details against the bank_account table
            String checkUserQuery = "SELECT * FROM bank_account WHERE username = ? AND email = ? ";
            psCheckUser = connection.prepareStatement(checkUserQuery);
            psCheckUser.setString(1, loggedInUsername); // Use username from the session
            psCheckUser.setString(2, email);
            rs = psCheckUser.executeQuery();

            // Step 2: Check if the user exists and also fetch their credit score
            if (rs.next()) {
                
                if (credit < 600) {
                    // Redirect with an error message if credit score is less than 600
                    response.sendRedirect("create_Emergency_loan.jsp?error=credit_score_low");
                    return;
                }

                // Step 3: Insert loan application into Emergency_loan_application table if credit score is sufficient
                String insertQuery = "INSERT INTO Emergency_loan_application (name, email, loanamount, loanpurpose, income, credit, status, loan_term) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                psInsert = connection.prepareStatement(insertQuery);
                psInsert.setString(1, name);
                psInsert.setString(2, email);
                psInsert.setDouble(3, loanAmount);
                psInsert.setString(4, loanPurpose);
                psInsert.setDouble(5, income);
                psInsert.setDouble(6, credit);
                psInsert.setString(7, status);
                psInsert.setInt(8, loanTerm);
                psInsert.executeUpdate();

                // Redirect to success page or send success message
                response.sendRedirect("create_Emergency_loan.jsp?success=loan_application_success");
            } else {
                // If user does not exist, redirect with an error message
                response.sendRedirect("create_Emergency_loan.jsp?error=user_verification_failed");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the error to the console
            // Include the error message in the redirect URL for debugging
            String errorMessage = e.getMessage();
            errorMessage = errorMessage.replaceAll(" ", "%20"); // Encode spaces for the URL
            response.sendRedirect("create_Emergency_loan.jsp?error=loan_application_failed&message=" + errorMessage);
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
