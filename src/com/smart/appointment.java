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
 * Servlet implementation class appointment
 */
@WebServlet("/appointment")
public class appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hospitalid = request.getParameter("hospitalid");
		HttpSession session = request.getSession();
		String userid = session.getAttribute("userid").toString();
		String disase = session.getAttribute("result").toString();
		
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement pp = con.prepareStatement("select * from appointment where hospitalid=? and userid=? and disease=? and status='waiting'");
			pp.setString(1, hospitalid);
			pp.setString(2, userid);
			pp.setString(3, disase);
			ResultSet rr = pp.executeQuery();
			if(!rr.next())
			{
			PreparedStatement ps = con.prepareStatement("insert into appointment(hospitalid,userid,disease) values(?,?,?)");
			ps.setString(1, hospitalid);
			ps.setString(2, userid);
			ps.setString(3, disase);
			ps.executeUpdate();
			
			response.sendRedirect("recommend.jsp?success");
			}
			else{
				response.sendRedirect("recommend.jsp?present");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
