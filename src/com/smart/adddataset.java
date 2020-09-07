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

import com.util.DbConnection;

/**
 * Servlet implementation class adddataset
 */
@WebServlet("/adddataset")
public class adddataset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adddataset() {
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
		
		String disease = request.getParameter("disease");
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		String s3 = request.getParameter("s3");
		String s4 = request.getParameter("s4");
		String s5 = request.getParameter("s5");
		String s6 = request.getParameter("s6");
		String s7 = request.getParameter("s7");
		String s8 = request.getParameter("s8");
		String s9 = request.getParameter("s9");
		String s10 = request.getParameter("s10");
		
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("select * from datainfo where  disease=? or (s1=? and s2=? and s3=? and s4=? and s5=? and s6=? and s7=? and s8=? and s9=? and s10=?)");
			ps.setString(1, disease);
			ps.setString(2, s1);
			ps.setString(3, s2);
			ps.setString(4, s3);
			ps.setString(5, s4);
			ps.setString(6, s5);
			ps.setString(7, s6);
			ps.setString(8, s7);
			ps.setString(9, s8);
			ps.setString(10,s9);
			ps.setString(11, s10);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				
					response.sendRedirect("adddataset.jsp?present");
			}
				else
				{
					PreparedStatement pp = con.prepareStatement("insert into datainfo(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,disease) values(?,?,?,?,?,?,?,?,?,?,?)");
					pp.setString(1, s1);
					pp.setString(2, s2);
					pp.setString(3, s3);
					pp.setString(4, s4);
					pp.setString(5, s5);
					pp.setString(6, s6);
					pp.setString(7, s7);
					pp.setString(8, s8);
					pp.setString(9, s9);
					pp.setString(10, s10);
					pp.setString(11, disease);
					pp.executeUpdate();
					
					response.sendRedirect("adddataset.jsp?success");
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
