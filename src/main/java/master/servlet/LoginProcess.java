package master.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== LOGIN SERVLET CALLED ===");

        try {
            // Get form parameters once
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            System.out.println("Email: " + email);
            System.out.println("Password: " + (password != null ? "provided" : "missing"));

            // Basic validation
            if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
                System.out.println("Missing credentials");
                response.sendRedirect("Login.jsp?error=missing_fields");
                return;
            }

            // Check for admin login
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                System.out.println("Admin login - redirecting to Admin.jsp");
                response.sendRedirect("Admin.jsp");
                return;
            }

            // Authenticate user (replace with DB logic later)
            boolean isValidUser = authenticateUser(email, password);

            if (isValidUser) {
                System.out.println("Client login successful - creating session");

                // Create session
                HttpSession session = request.getSession(true);
                session.setAttribute("user", email);
                session.setAttribute("loginTime", new java.util.Date().toString());

                // Redirect to Client page for non-admin users
                System.out.println("Client login - redirecting to Client.jsp");
                response.sendRedirect("Client.jsp");
                return;

            } else {
                System.out.println("Invalid credentials");
                response.sendRedirect("Login.jsp?error=invalid");
                return;
            }

        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=server_error");
            return;
        }
    }

    // Simple authentication method (replace with database logic later)
    private boolean authenticateUser(String email, String password) {
        // For testing, accept any non-empty credentials (non-admin path)
        return email != null && password != null &&
               !email.trim().isEmpty() && !password.trim().isEmpty();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp");
    }
}
