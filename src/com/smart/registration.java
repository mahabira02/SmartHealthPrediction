package com.smart;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.java.swing.plaf.motif.resources.motif;
import com.util.DbConnection;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String lat;
     String lon;
     String fullname;
     String RegistrationNumber;
     String specialist;
     String experience;
     String contact;
     String email;
     String hospital;
     String filename;
     String address;
     String city;
     String state;
     String password;
     //String RegistrationNumber;
     private static final int THRESHOLD_SIZE = 1024*1024*3; // 3MB
    	private static final int MAX_FILE_SIZE = 1024*1024*40; // 40MB
    	private static final int REQUEST_SIZE = 1024*1024*50; // 50MB
    	private List<FileItem> fileItem = null;
    	  
    	 protected List<FileItem> initRequest(HttpServletRequest req) 
    	 {
    		 boolean isMultipart = ServletFileUpload.isMultipartContent(req);
    	     if(!isMultipart) throw new UnsupportedOperationException();
    	     DiskFileItemFactory factory = new DiskFileItemFactory();
    	     factory.setSizeThreshold(THRESHOLD_SIZE);
    	     factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
    	     ServletFileUpload upload = new ServletFileUpload(factory);
    	     upload.setFileSizeMax(MAX_FILE_SIZE);
    	     upload.setSizeMax(REQUEST_SIZE);
    	     List<FileItem> formItems = null;
    	     
    	     try 
    	     	{
    	    	 formItems = upload.parseRequest(req);
    	     	} 
    	     catch (Exception e) 
    	     	{
    	    	 e.printStackTrace();
    	     	}
    	 return formItems;
    	}
    		
    	
    		
    		   protected String getFieldValue(List<FileItem> formItems, String fieldName) 
    		   {
    		    String value = null;
    		    try {
    		     for(FileItem fi : formItems )
    		     {
    		      if (fi.isFormField()) 
    		      {
    		       if(fi.getFieldName().equals(fieldName))
    		       {
    		        value = fi.getString();
    		       }
    		      }
    		     }
    		    }
    		    catch (Exception ex) {
    		     ex.printStackTrace();
    		    }
    		    return value;
    		   }
    		   protected File uploadFile(List<FileItem> formItems, String destFolder) 
    			 {
    			  String uploadPath = destFolder;
    			  File uploadDir = new File(uploadPath);
    			  if (!uploadDir.exists()) 
    			  {
    			   uploadDir.mkdir();
    			  }
    			  File uploadedFile = null;
    			  try 
    			  {
    			   for(FileItem fi : formItems )
    			   {
    			    if (!fi.isFormField()) 
    			    {
    			     String fileName = new File(fi.getName()).getName();
    			     String filePath = uploadPath + File.separator + fileName;
    			     uploadedFile = new File(filePath);
    			     fi.write(uploadedFile);
    			    }
    			   }
    			  }
    			  catch (Exception ex) 
    			  {
    			   ex.printStackTrace();
    			  }
    			  return uploadedFile;
    			 }	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		fileItem = initRequest(request);
		
		lat = getFieldValue(fileItem, "latFld");
		lon = getFieldValue(fileItem, "lngFld");
		fullname = getFieldValue(fileItem, "fname");
		RegistrationNumber = getFieldValue(fileItem, "RegistrationNumber");
		specialist = getFieldValue(fileItem, "domain");
		experience = getFieldValue(fileItem, "exp");
		contact = getFieldValue(fileItem, "contactNo");
		email = getFieldValue(fileItem, "email");
		hospital = getFieldValue(fileItem, "hospital");
		
		address = getFieldValue(fileItem, "area");
		city = getFieldValue(fileItem, "city");
		state = getFieldValue(fileItem, "state");
		password = getFieldValue(fileItem, "password");
		//RegistrationNumber=getFieldValue(fileItem, "RegistrationNumber");
		
		
		File file = uploadFile(fileItem,"E:\\workspace\\smartrideapp\\drivinglicense");
		filename = file.getName();
		
		
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement pp = con.prepareStatement("select * from doctor where email=?");
			pp.setString(1, email);

			ResultSet rr = pp.executeQuery();
			if(!rr.next())
			{
			PreparedStatement ps = con.prepareStatement("insert into doctor(lat,lon,fname,RegistrationNumber,specialist,experience,mobile,email,hospital,filename,address,city,state,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, lat);
			ps.setString(2, lon);
			ps.setString(3, fullname);
			ps.setString(4, RegistrationNumber);
			ps.setString(5, specialist);
			ps.setString(6, experience);
			ps.setString(7, contact);
			ps.setString(8, email);
			ps.setString(9, hospital);
			ps.setString(10, filename);
			ps.setString(11, address);
			ps.setString(12, city);
			ps.setString(13, state);
			ps.setString(14, password);
			//ps.setString(15, RegistrationNumber);
			ps.executeUpdate();
			
			response.sendRedirect("doctor.jsp");
			}else
			{
				response.sendRedirect("doctorregistration.jsp?present");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
