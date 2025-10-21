package master.servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import master.dao.TourDao;
import master.dto.TourDTO;

@WebServlet("/TourDeleteServlet")
public class TourDelete extends HttpServlet {
	
	
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
	        // Handle GET requests - redirect to tour add form
	        response.sendRedirect("success.jsp");
	    }
	 
	 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
       
        String tourId = request.getParameter("tourId");

        
        TourDTO dto = new TourDTO();
        dto.setTourId(tourId);

       
        TourDao dao = new TourDao();
        dao.deleteData(dto);

        
        response.sendRedirect("success.jsp"); 
    }
}

