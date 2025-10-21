package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.HotelDao;
import master.dto.HotelDto;
@WebServlet("/UpdateHotelServlet")
public class UpdateHotelServlet extends HttpServlet {
	
	

	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
	        // Handle GET requests - redirect to tour add form
	        response.sendRedirect("UpdHotel.jsp");
	    }
	 @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        String hotelId = req.getParameter("hotelId"); // Keep it as String

        String hotelname = req.getParameter("hotelName");
        String tourplace = req.getParameter("tplace");

        HotelDto dto = new HotelDto(hotelId, hotelname, tourplace);
        HotelDao dao = new HotelDao();

        try {
            int status = dao.updateHotel(dto);
            if (status > 0) {
                out.println("Hotel Updated Successfully!");
            } else {
                out.println("Error in Updating Hotel");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Exception: " + e.getMessage());
        }
    }
}
