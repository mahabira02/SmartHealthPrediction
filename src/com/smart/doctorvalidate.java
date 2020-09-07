package com.smart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class doctorvalidate
 */
@WebServlet("/doctorvalidate")
public class doctorvalidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctorvalidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass1 = request.getParameter("password");
		String pass2 = request.getParameter("rpassword");
		
		 if (!pass1.equals(pass2))
		{
			response.sendRedirect("doctorregistration.jsp");
			/*RequestDispatcher dispatcher=request.getRequestDispatcher("/registration");
			dispatcher.forward(request, response);*/
			/*response.sendRedirect("/registration");*/
		}
		else
		{
			response.sendRedirect("registration");
			/*response.sendRedirect("doctorregistration.jsp");*/
		}

	}
}
