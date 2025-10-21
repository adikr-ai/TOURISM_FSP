package master.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import master.dao.BookDao;
import master.dto.BookDto;


/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
	    
	    // Forward to the booking JSP page
	    request.getRequestDispatcher("/Booking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BUTTON CLICKED - SERVLET CALLED!");

		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String tid=request.getParameter("tid");
		String hid=request.getParameter("hid");
		String rtype=request.getParameter("rtype");
		String bkdt=request.getParameter("bkdt");
		String uname=request.getParameter("uname");
		BookDto bdto=new BookDto();
		bdto.setTid(tid);
		bdto.setHid(hid);
		bdto.setRtype(rtype);
		bdto.setBkdt(bkdt);
		bdto.setUname(uname);
		BookDao bdao=new BookDao();
		
		int bkid = bdao.insertData(bdto);
       
		
		request.setAttribute("bookingId", bkid);
		RequestDispatcher rd =request.getRequestDispatcher("Response.jsp");
		rd.forward(request, response);
	}

}

