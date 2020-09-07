package com.smart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

/**
 * Servlet implementation class doctorlogin
 */
@WebServlet("/doctorlogin")
public class doctorlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctorlogin() {
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
		
		try {
			Connection con = DbConnection.getConnection();
			HttpSession session = request.getSession();
			PreparedStatement ps = con.prepareStatement("select * from doctor where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs= ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("userid", rs.getString("id"));
				session.setAttribute("email", email);
				session.setAttribute("fname", rs.getString("fname"));
				response.sendRedirect("doctorhome.jsp");
			
			}
			else
			{
				response.sendRedirect("doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
