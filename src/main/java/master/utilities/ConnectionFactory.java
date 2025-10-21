package master.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    
    public static Connection getConnection() {
        try {
            // Simple, direct connection without singleton complexity
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url = "jdbc:mysql://localhost:3306/tourdb";
            String username = "root";
            String password = "aditya09";
            
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("✓ Connection successful!");
            return conn;
            
        } catch (ClassNotFoundException e) {
            System.err.println("✗ MySQL Driver not found! Download mysql-connector-java JAR");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.err.println("✗ Database connection failed!");
            System.err.println("Check: 1) MySQL running? 2) Database 'tourdb' exists? 3) Correct password?");
            e.printStackTrace();
            return null;
        }
    }
}


