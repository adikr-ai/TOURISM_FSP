package master.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.AllotmentDao;
import master.dto.AllotmentDto;

@WebServlet("/AllotmentServlet")
public class Allotment extends HttpServlet {
    private AllotmentDao allotmentDAO;

    @Override
    public void init() throws ServletException {
        allotmentDAO = new AllotmentDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().println("<h1>AllotmentServlet is working!</h1>");
        response.getWriter().println("<p>Use POST method to submit data.</p>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        
        String tourId = request.getParameter("tourId");
        String hotelId = request.getParameter("hotelId");

        if (tourId == null || hotelId == null) {
            response.getWriter().println("❌ Missing parameters!");
            return;
        }

        AllotmentDto allotment = new AllotmentDto(tourId, hotelId);
        boolean success = allotmentDAO.saveAllotment(allotment);

        if (success) {
            response.getWriter().println("✅ Allotment saved successfully!");
        } else {
            response.getWriter().println("❌ Failed to save allotment!");
        }
    }
}

