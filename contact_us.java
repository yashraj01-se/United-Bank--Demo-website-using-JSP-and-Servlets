import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class contact_us extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String URL = "jdbc:derby://localhost:1527/userlogin"; 
    String dbUser = "username"; 
    String dbPassword = "password"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Get the request parameters from the form
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("phone");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver and establish the connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, dbUser, dbPassword);
            System.out.println("Database connection successful!");

            // Prepare the SQL query to insert the user data
            String query = "INSERT INTO user_query (username, email, mobile_number, message) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, mobileNumber);
            stmt.setString(4, message);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();

            // Set the success or error attribute based on the result
            if (rowsInserted > 0) {
                request.setAttribute("success", "Your query has been successfully submitted! We will contact you shortly.");
            } else {
                request.setAttribute("error", "There was an issue with your submission. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while saving data: " + e.getMessage());
        } finally {
            // Close the resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                request.setAttribute("error", "Error closing resources: " + ex.getMessage());
            }
        }

        // Forward the request with attributes to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("contact_us.jsp");
        dispatcher.forward(request, response);
    }
}
