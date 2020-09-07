package com.smart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.util.DbConnection;

/**
 * Servlet implementation class patientregister
 */
@WebServlet("/patientupdate")
public class patientupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patientupdate() {
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String ename=request.getParameter("emname");
		String eno=request.getParameter("emnumber");
		String bloodgroup=request.getParameter("bloodgroup");
		String alltofood=request.getParameter("alltofood");
		String alltomedicine=request.getParameter("alltomedicine");
		
		System.out.println(mobile);
		
		try {
			Connection con =DbConnection.getConnection();
			HttpSession session = request.getSession();
			PreparedStatement ps = con.prepareStatement("update patient set fname=?,lname=?,dob=?,address=?,mobile=?,email=?,ename=?,eno=?,bloodgroup=?,alltofood=?,alltomedicine=? where id=?");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob);
			ps.setString(4, address);
			ps.setString(5, mobile);
			ps.setString(6, email);
			ps.setString(7, ename);
			ps.setString(8, eno);
			ps.setString(9, bloodgroup);
			ps.setString(10, alltofood);
			ps.setString(11, alltomedicine);
			ps.setString(12, (String) session.getAttribute("userid"));
			ps.executeUpdate();
			response.sendRedirect("home.jsp");
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}
