package master.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Optional;
import master.dto.UserDTO;
import java.util.List;

public abstract class UserDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    protected Connection jdbcConnection;

    public UserDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
    
    public UserDAO() {
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Abstract methods
    public abstract long create(UserDTO user) throws SQLException;
    public abstract Optional<UserDTO> authenticateUser(String email, String password) throws SQLException;
    public abstract List<UserDTO> findAll() throws SQLException;
    public abstract boolean emailExists(String email) throws SQLException;

    // Fixed validateUser method
    public UserDTO validateUser(String email, String password) {
        try {
            Optional<UserDTO> userOptional = authenticateUser(email, password);
            return userOptional.orElse(null);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

	
    
    // You can add other abstract methods here later
    // public abstract void update(UserDTO user) throws SQLException;
    // public abstract void delete(long userId) throws SQLException;
