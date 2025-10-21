package master.dao;

import java.sql.*;
import master.dto.TourDTO;
import master.utilities.ConnectionFactory;

public class TourDao {
    private Connection cn = null;
    private Statement st = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private String insert_sql = "INSERT INTO tour VALUES (?,?,?,?,?,?,?,?,?)";
    private String delete_sql = "DELETE FROM tour WHERE tourId=?";
    private String update_sql = "UPDATE tour SET startDate=?, endDate=?, price=? WHERE tourId=?";
    private String select_sql = "SELECT * FROM tour ORDER BY tourId";

    // 🔎 Search tour by ID
    public ResultSet searchById(String tourId) {
        String search_sql = "SELECT * FROM tours WHERE tourId='" + tourId + "'";
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConnection();
            st = cn.createStatement();
            rs = st.executeQuery(search_sql);
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return rs;
    }

    //  Insert tour
    public boolean insertData(TourDTO tdto) {
        try {
            // Get fresh connection
            Connection cn = ConnectionFactory.getConnection();
            
            if (cn == null) {
                System.out.println("✗ Cannot get database connection!");
                return false;
            }
            
            // Prepare statement
            PreparedStatement ps = cn.prepareStatement(insert_sql);
            ps.setString(1, tdto.getTourId());
            ps.setString(2, tdto.getTourName());
            ps.setString(3, tdto.getState());
            ps.setString(4, tdto.getCities());
            ps.setString(5, tdto.getTravelMode());
            ps.setString(6, tdto.getAccommodation());
            ps.setDate(7, tdto.getStartDate());
            ps.setDate(8, tdto.getEndDate());
            ps.setBigDecimal(9, tdto.getPrice());
            
            // Execute
            int result = ps.executeUpdate();
            System.out.println("Rows affected: " + result);
            
            // Close resources
            ps.close();
            cn.close();
            
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("✗ Insert failed: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }




    //  Delete tour
    public void deleteData(TourDTO tdto) {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConnection();
            ps = cn.prepareStatement(delete_sql);

            ps.setString(1, tdto.getTourId());
            ps.executeUpdate();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    // Update tour
    public void updateData(TourDTO tdto) {
        Connection cn = null;
        PreparedStatement ps = null;
        
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConnection();
            
            // Add null check
            if (cn == null) {
                System.out.println("Connection is null! Check ConnectionFactory");
                return;
            }
            
            ps = cn.prepareStatement(update_sql);
            
            ps.setDate(1, tdto.getStartDate());
            ps.setDate(2, tdto.getEndDate());
            ps.setBigDecimal(3, tdto.getPrice());
            ps.setString(4, tdto.getTourId());
            
            ps.executeUpdate();
            
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            // Close resources properly
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
   


    private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

	//  Get all tours
    public ResultSet getData() {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConnection();
            st = cn.createStatement();
            rs = st.executeQuery(select_sql);
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return rs;
    }

    public boolean saveTour(TourDTO tour) {
        return insertData(tour);
    }

	}

