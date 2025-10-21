package master.servlet;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.UserDAO;
import master.dao.UserDAOImpl; // Import the implementation
import master.dto.UserDTO;

@WebServlet("/registerProcess.jsp")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database configuration
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/tourdb?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "aditya09";
    
    private UserDAOImpl userDAO; // Interface reference

    @Override
    public void init() throws ServletException {
        try {
            // Initialize with implementation class
            this.userDAO = new UserDAOImpl(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserDAO: " + e.getMessage(), e);
        }
    }

    // Rest of your servlet code remains the same...
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException, ServletException {
        resp.sendRedirect("Register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserDTO user = new UserDTO();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setPassword(request.getParameter("password"));
        
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
        
        try {
            if (userDAO.emailExists(user.getEmail())) {
                request.setAttribute("status", "email_exists");
                request.setAttribute("message", "Email already registered. Please use a different email.");
            } else {
                Long userId = userDAO.create(user);
                if (userId != null) {
                    request.setAttribute("status", "success");
                    request.setAttribute("message", "Registration successful!");
                } else {
                    request.setAttribute("status", "failed");
                    request.setAttribute("message", "Registration failed. Please try again.");
                }
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            request.setAttribute("message", "An error occurred: " + e.getMessage());
        }
        
        dispatcher.forward(request, response);
    }
}

