package master.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import master.dto.UserDTO;

public class UserDAOImpl extends UserDAO {
    private String jdbcUrl;
    private String username;
    private String password;
    
    // Constructor that accepts JDBC parameters
    public UserDAOImpl(String jdbcUrl, String username, String password) {
        this.jdbcUrl = jdbcUrl;
        this.username = username;
        this.password = password;
        
        // Load JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }
    
    // Helper method to get database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcUrl, username, password);
    }
    
    public long create(UserDTO user) {
        String sql = "INSERT INTO users (name, email, phone, pwd) VALUES (?, ?, ?, ?)";
        
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            // Set the parameters
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getPassword());
            
            // EXECUTE the statement - this was missing!
            int result = stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            return result; // Returns 1 if successful, 0 if failed
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public Optional<UserDTO> findById(Long id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                UserDTO user = mapResultSetToUser(rs);
                return Optional.of(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding user by ID", e);
        }
        return Optional.empty();
    }
    
    public boolean validateUser1(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND pwd = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            boolean found = rs.next();
            rs.close();
            stmt.close();
            conn.close();
            return found;
        } catch (Exception e) {
            return false;
        }
    }


    public Optional<UserDTO> findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE uemail = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                UserDTO user = mapResultSetToUser(rs);
                return Optional.of(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding user by email", e);
        }
        return Optional.empty();
    }
    
    @Override
    public List<UserDTO> findAll() {
        List<UserDTO> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                UserDTO user = mapResultSetToUser(rs);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding all users", e);
        }
        return users;
    }
    
    public boolean update(UserDTO user) {
        String sql = "UPDATE users SET uname = ?, uemail = ?, uphone = ?, upwd = ? WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getPassword());
            stmt.setLong(5, user.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user", e);
        }
    }
    
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM users WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setLong(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting user", e);
        }
    }
    
    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error checking email existence", e);
        }
        return false;
    }

    
  

    
    public Optional<UserDTO> authenticateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE uemail = ? AND upwd = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                UserDTO user = mapResultSetToUser(rs);
                return Optional.of(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error authenticating user", e);
        }
        return Optional.empty();
    }
    
    // Helper method to map ResultSet to UserDTO
    private UserDTO mapResultSetToUser(ResultSet rs) throws SQLException {
        UserDTO user = new UserDTO();
        user.setId(rs.getLong("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setPassword(rs.getString("pwd"));
        return user;
    }

	public UserDTO validateUser(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}
}
