package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;

import org.apache.catalina.filters.ExpiresFilter.XPrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import master.dao.TourDao;
import master.dto.TourDTO;

@WebServlet("/TourAddServlet")
public class TourAdd extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Handle GET requests - redirect to tour add form
        response.sendRedirect("Tour.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // Debug: Print all received parameters
            System.out.println("=== Form Parameters ===");
            System.out.println("tourId: " + request.getParameter("tourId"));
            System.out.println("tourName: " + request.getParameter("tourName"));
            System.out.println("state: " + request.getParameter("state"));
            System.out.println("cities: " + request.getParameter("cities"));
            System.out.println("travelMode: " + request.getParameter("travelMode"));
            System.out.println("accommodation: " + request.getParameter("accommodation"));
            System.out.println("startDate: " + request.getParameter("startDate"));
            System.out.println("endDate: " + request.getParameter("endDate"));
            System.out.println("price: " + request.getParameter("price"));
            
            // Get form parameters
            String tourId = request.getParameter("tourId");
            String tourName = request.getParameter("tourName");
            String state = request.getParameter("state");
            String cities = request.getParameter("cities");
            String travelMode = request.getParameter("travelMode");
            String accommodation = request.getParameter("accommodation");
            
            // Parse dates properly
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            
            Date startDate = null;
            Date endDate = null;
            
            if (startDateStr != null && !startDateStr.isEmpty()) {
                startDate = Date.valueOf(startDateStr); // This works for "yyyy-MM-dd" format
            }
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate = Date.valueOf(endDateStr);
            }
            
            // Parse price
            String priceStr = request.getParameter("price");
            BigDecimal price = null;
            if (priceStr != null && !priceStr.isEmpty()) {
                price = new BigDecimal(priceStr);
            }
            
            // Create TourDTO object
            TourDTO tour = new TourDTO();
            tour.setTourId(tourId);
            tour.setTourName(tourName);
            tour.setState(state);
            tour.setCities(cities);
            tour.setTravelMode(travelMode);
            tour.setAccommodation(accommodation);
            tour.setStartDate(startDate);
            tour.setEndDate(endDate);
            tour.setPrice(price);
            
            // Call DAO to insert data
            TourDao dao = new TourDao();
            boolean isInserted = dao.insertData(tour);
            
            // Provide feedback
            PrintWriter out = response.getWriter();
            if (isInserted) {
                out.println("<script>alert('Tour added successfully!'); window.location='Tour.jsp';</script>");
                System.out.println("Data inserted successfully!");
            } else {
                out.println("<script>alert('Failed to add tour!'); window.history.back();</script>");
                System.out.println("Failed to insert data!");
            }
            
        } catch (Exception e) {
            System.out.println("Error in TourAdd servlet: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}
