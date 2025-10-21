package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import master.dao.HotelDao;

@WebServlet("/DeleteHotelServlet")
public class HotelDel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        handleDelete(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        handleDelete(req, res);
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html; charset=UTF-8");
        PrintWriter out = res.getWriter();

        String hotelIdStr = firstNonEmpty(
                req.getParameter("hotelid"),
                req.getParameter("hotelId"),
                req.getParameter("id")
        );

        if (hotelIdStr == null || hotelIdStr.trim().isEmpty()) {
            out.println("<h1>Error: Hotel ID is missing.</h1>");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(hotelIdStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h1>Error: Invalid Hotel ID. Received: " + escapeHtml(hotelIdStr) + "</h1>");
            return;
        }

        HotelDao dao = new HotelDao();
        try {
            // 1) Check existence (calls implemented method)
            boolean exists = dao.existsHotelById(id);
            if (!exists) {
                out.println("<h1>Error: Hotel not found for ID " + id + ".</h1>");
                return;
            }

            // 2) Attempt delete
            int affected = dao.deleteHotel(id);
            if (affected > 0) {
                out.println("<h1>Hotel Deleted Successfully! (ID " + id + ")</h1>");
            } else {
                out.println("<h1>Error: Delete failed unexpectedly for ID " + id + ".</h1>");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            out.println("<h1>Error: Cannot delete hotel ID " + id + " due to related records (constraint violation).</h1>");
        } catch (SQLException e) {
            out.println("<h1>Database error: " + escapeHtml(e.getMessage()) + "</h1>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>An unexpected error occurred.</h1>");
        }
    }

    private static String firstNonEmpty(String... vals) {
        if (vals == null) return null;
        for (String v : vals) if (v != null && !v.trim().isEmpty()) return v;
        return null;
    }

    private static String escapeHtml(String s) {
        if (s == null) return null;
        return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")
                .replace("\"","&quot;").replace("'","&#39;");
    }
}
