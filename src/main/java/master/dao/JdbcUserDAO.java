package master.dao;

import master.dto.UserDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jakarta . servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/JdbcUserDAO")
public class JdbcUserDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials (set your own values)
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/tourdb";
    private final String jdbcUser = "root";
    private final String jdbcPassword = "aditya09";

    public JdbcUserDAO() {
        super();
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
    }

    private UserDTO mapResultSetToUser(ResultSet rs) throws SQLException {
        UserDTO user = new UserDTO();
        user.setId(rs.getLong("id"));
        user.setName(rs.getString("uname"));
        user.setEmail(rs.getString("uemail"));
        user.setPhone(rs.getString("uphone"));
        return user;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Example: authenticate user via POST parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Optional<UserDTO> userOpt = authenticateUser(email, password);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        if (userOpt.isPresent()) {
            out.println("Login successful! Welcome " + userOpt.get().getName());
        } else {
            out.println("Login failed. Invalid email or password.");
        }
    }

    // --- JDBC Methods (same as your original code) ---

    public Optional<UserDTO> authenticateUser(String email, String password) {
        String sql = "SELECT id, uname, uemail, uphone, upwd FROM users WHERE uemail = ? AND upwd = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email);
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Authentication failed", e);
        }
        return Optional.empty();
    }

    public Long create(UserDTO user) {
        String sql = "INSERT INTO users (uname, upwd, uemail, uphone) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pst.setString(1, user.getName());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPhone());

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                try (ResultSet rs = pst.getGeneratedKeys()) {
                    if (rs.next()) return rs.getLong(1);
                }
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Failed to create user", e);
        }
    }

    public Optional<UserDTO> findById(Long id) {
        String sql = "SELECT id, uname, uemail, uphone FROM users WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setLong(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) return Optional.of(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to find user by ID", e);
        }
        return Optional.empty();
    }

    public Optional<UserDTO> findByEmail(String email) {
        String sql = "SELECT id, uname, uemail, uphone FROM users WHERE uemail = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) return Optional.of(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to find user by email", e);
        }
        return Optional.empty();
    }

    public List<UserDTO> findAll() {
        String sql = "SELECT id, uname, uemail, uphone FROM users";
        List<UserDTO> users = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve all users", e);
        }
        return users;
    }

    public boolean update(UserDTO user) {
        String sql = "UPDATE users SET uname = ?, uemail = ?, uphone = ? WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPhone());
            pst.setLong(4, user.getId());

            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Failed to update user", e);
        }
    }

    public boolean deleteById(Long id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setLong(1, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Failed to delete user", e);
        }
    }

    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE uemail = ?";
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to check email existence", e);
        }
        return false;
    }
}

