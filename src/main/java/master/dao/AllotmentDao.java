package master.dao;

import java.sql.*;

import master.dto.AllotmentDto;

public class AllotmentDao {
    private static final String URL = "jdbc:mysql://localhost:3306/tourdb";
    private static final String USER = "root";
    private static final String PASSWORD = "aditya09"; // change as per your setup

    public boolean saveAllotment(AllotmentDto allotment) {
        String query = "INSERT INTO allotments (tour_id, hotel_id) VALUES (?, ?)";

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(query)) {

                ps.setString(1, allotment.getTourId()); 
                ps.setString(2, allotment.getHotelId()); 

                int rows = ps.executeUpdate();
                return rows > 0;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

