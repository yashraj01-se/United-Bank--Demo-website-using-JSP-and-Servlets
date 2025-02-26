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

@WebServlet("/create_personal_loan")
public class create_personal_loan extends HttpServlet {
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

        // Get form data
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        double loanAmount;
        try {
            loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
        } catch (NumberFormatException e) {
            response.sendRedirect("create_personal_loan.jsp?error=loan_application_failed");
            return;
        }
        String loanPurpose = request.getParameter("loanPurpose");
        String employmentStatus = request.getParameter("employmentStatus");
        String nationalId = request.getParameter("nationalId");

        // Check loan amount restriction for unemployed users
        if ("unemployed".equalsIgnoreCase(employmentStatus) && loanAmount > 50000) {
            response.sendRedirect("create_personal_loan.jsp?error=loan_amount_exceeds_limit");
            return;
        }

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
            String checkUserQuery = "SELECT * FROM bank_account WHERE username = ? AND email = ? AND phone = ? AND address = ?";
            psCheckUser = connection.prepareStatement(checkUserQuery);
            psCheckUser.setString(1, loggedInUsername); // Use username from the session
            psCheckUser.setString(2, email);
            psCheckUser.setString(3, phone);
            psCheckUser.setString(4, address);
            rs = psCheckUser.executeQuery();

            // If user exists, proceed with loan application insertion
            if (rs.next()) {
                // Step 2: Insert loan application into loan_application table
                String insertQuery = "INSERT INTO personal_loan_application (full_name, email, phone, address, loan_amount, loan_purpose, employment_status, national_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                psInsert = connection.prepareStatement(insertQuery);
                psInsert.setString(1, fullName);
                psInsert.setString(2, email);
                psInsert.setString(3, phone);
                psInsert.setString(4, address);
                psInsert.setDouble(5, loanAmount);
                psInsert.setString(6, loanPurpose);
                psInsert.setString(7, employmentStatus);
                psInsert.setString(8, nationalId);
                psInsert.executeUpdate();

                // Redirect to success page or send success message
                response.sendRedirect("create_personal_loan.jsp?success=loan_application_success");
            } else {
                // If user does not exist, redirect with an error message
                response.sendRedirect("create_personal_loan.jsp?error=user_verification_failed");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the error to the console
            // Include the error message in the redirect URL for debugging
            String errorMessage = e.getMessage();
            errorMessage = errorMessage.replaceAll(" ", "%20"); // Encode spaces for the URL
            response.sendRedirect("create_personal_loan.jsp?error=loan_application_failed&message=" + errorMessage);
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
