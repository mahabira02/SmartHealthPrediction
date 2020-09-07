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
 * Servlet implementation class addsymptom
 */
@WebServlet("/addsymptom")
public class addsymptom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsymptom() {
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
		String symptom = request.getParameter("symp");
		
		try{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select symptomkey from symptomskey order by id desc limit 1");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				int key = Integer.parseInt(rs.getString("symptomkey"));
				
				key = key+1;
				
				PreparedStatement ps1 = con.prepareStatement("insert into symptomskey(symptomkey,symptomname) values(?,?)");
				ps1.setString(1, Integer.toString(key));
				ps1.setString(2, symptom);
				ps1.executeUpdate();
				
			}
			response.sendRedirect("addsymptom.jsp");
		}catch(Exception e){
			e.printStackTrace();
			}
	}

}
