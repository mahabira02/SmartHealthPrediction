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
 * Servlet implementation class appointmentslot
 */
@WebServlet("/appointmentslot")
public class appointmentslot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appointmentslot() {
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
		String id = request.getParameter("id");
	    String userid = request.getParameter("userid");
	    String hospitalid = request.getParameter("hospitalid");
	  //  System.out.println(id+"="+userid+"="+hospitalid);
	    String date = request.getParameter("date");
	    String time = request.getParameter("time");
	    GlobalFunction GF = new GlobalFunction();
	    try {
	    	Connection con = DbConnection.getConnection();
	    	
	    	PreparedStatement pp = con.prepareStatement("select * from appointment where adate=? and atime=?");
	    	pp.setString(1, date);
	    	pp.setString(2, time);
	    	ResultSet rr = pp.executeQuery();
	    	if(!rr.next()){
	    	SendMailSSL send = new SendMailSSL();
	    	
	    	String email = GF.getEmail(userid);
	    	String Msg = "Hello "+GF.getFullName(userid)+",\n "+"Your Appointment Details : \n\n"
	    	+" Hospital Name : "+GF.getHospital(hospitalid)
	    	+" \n Doctor Name : "+GF.getDoctorName(hospitalid)
	    	+" \nDate : "+date
	    	+" \nTime : "+time
	    	+" \n\n Thank You.";
	    	int flag = send.EmailSending(email, "Appointment", Msg);
	    	System.out.print(flag);
	    	if(flag>0)
	    	{
	    		PreparedStatement ps = con.prepareStatement("update appointment set status='accept',adate=?,atime=? where id=?");
	    		ps.setString(1, date);
	    		ps.setString(2, time);
	    		ps.setString(3, id);
	    		ps.executeUpdate();
	    		response.sendRedirect("appointmentdoctor.jsp?success");
	    	}
	    	else
	    	{
	    		response.sendRedirect("appointmentdoctor.jsp?fail");
	    	}
	    	}else{
	    		response.sendRedirect("appointmentdoctor.jsp?present");
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
