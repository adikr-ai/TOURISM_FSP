package master.dao;

import java.sql.*;
import master.dto.HotelDto;

public class HotelDao {
    private static final String URL = "jdbc:mysql://localhost:3306/tourdb";
    private static final String USER = "root";
    private static final String PASSWORD = "aditya09";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8+
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Ensure these match actual schema names and case
    private static final String TABLE = "addhotel";
    private static final String COL_ID = "HotelID";
    private static final String COL_NAME = "HotelName";
    private static final String COL_TPLACE = "Tplace";

    public boolean existsHotelById(int id) throws SQLException {
        String sql = "SELECT 1 FROM " + TABLE + " WHERE " + COL_ID + " = ? LIMIT 1";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    // Kept for backward compatibility with existing code paths
    public boolean HotelId(int id) throws SQLException {
        return existsHotelById(id);
    }

    public int addHotel(HotelDto hotel) throws SQLException {
        String sql = "INSERT INTO " + TABLE + " (" + COL_NAME + ", " + COL_TPLACE + ") VALUES (?, ?)";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, hotel.getHotelName());
            ps.setString(2, hotel.getTplace());
            return ps.executeUpdate();
        }
    }

    public int updateHotel(HotelDto hotel) throws SQLException {
        String sql = "UPDATE " + TABLE + " SET " + COL_NAME + " = ?, " + COL_TPLACE + " = ? WHERE " + COL_ID + " = ?";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, hotel.getHotelName());
            ps.setString(2, hotel.getTplace());
            ps.setInt(3, Integer.parseInt(hotel.getHotelId()));
            return ps.executeUpdate(); // returns 0 if id not found or no change
        }
    }

    public int deleteHotel(int hotelId) throws SQLException {
        String sql = "DELETE FROM " + TABLE + " WHERE " + COL_ID + " = ?";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, hotelId);
            return ps.executeUpdate(); // 0 if not found
        }
    }
}
