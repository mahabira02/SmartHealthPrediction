package com.smart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

/**
 * Servlet implementation class patientlogin
 */
@WebServlet("/patientlogin")
public class patientlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patientlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String user = request.getParameter("user");
		String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        
        System.out.println(lat);
        System.out.println(lon);
		
		try {
			Connection con = DbConnection.getConnection();
			HttpSession session = request.getSession();
			/*PreparedStatement ps = con.prepareStatement("select * from patient where email=? and password=?");*/
			PreparedStatement ps = con.prepareStatement("select * from patient where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs= ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("userid", rs.getString("id"));
				session.setAttribute("email", email);
				session.setAttribute("fname", rs.getString("fname"));
				
			
				
				
				
				session.setAttribute("clat", lat);
	            session.setAttribute("clon", lon);
	            
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("patient.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
