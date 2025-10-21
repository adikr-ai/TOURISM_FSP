package master.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.TourDao;
import master.dto.TourDTO;

@WebServlet("/TourUpdateServlet")
public class TourUpdate extends HttpServlet {
	
	

	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
	        // Handle GET requests - redirect to tour add form
	        response.sendRedirect("TourUpdate.jsp");
	    }
	 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        
        String tourId = request.getParameter("tourId");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        BigDecimal price = new BigDecimal(request.getParameter("price"));

       
        TourDTO dto = new TourDTO();
        dto.setTourId(tourId);
        dto.setStartDate(startDate);
        dto.setEndDate(endDate);
        dto.setPrice(price);

       
        TourDao dao = new TourDao();
        dao.updateData(dto);

     
        response.sendRedirect("success.jsp"); 
    }
}

