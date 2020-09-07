package com.smart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

/**
 * Servlet implementation class patientregister
 */
@WebServlet("/patientregister")
public class patientregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patientregister() {
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
		String password=request.getParameter("password");
		
		System.out.println(mobile);
		
		try {
			Connection con =DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into patient(fname,lname,dob,address,mobile,email,ename,eno,bloodgroup,alltofood,alltomedicine,password) values(?,?,?,?,?,?,?,?,?,?,?,?)");
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
			ps.setString(12, password);
			ps.executeUpdate();
			
			response.sendRedirect("patient.jsp");
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}
