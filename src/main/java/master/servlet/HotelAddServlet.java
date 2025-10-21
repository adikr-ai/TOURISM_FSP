package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.coyote.Response;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.HotelDao;
import master.dto.HotelDto;

@WebServlet("/HotelAddServlet") 




public class HotelAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        String name = req.getParameter("hotelName");
        String place = req.getParameter("tplace");

        HotelDto dto = new HotelDto(0, name, place);
        HotelDao dao = new HotelDao();

        try {
            int status = dao.addHotel(dto);
            if (status > 0) {
                out.println("Hotel Added Successfully!");
            } else {
                out.println("Error in Adding Hotel");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Exception: " + e.getMessage());
        }
    }


protected void doGet(HttpServletRequest req, HttpServletResponse res) 
        throws ServletException, IOException {
    // Forward GET requests to POST method
	   doPost(req, res);
}
}