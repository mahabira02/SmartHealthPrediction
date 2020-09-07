package com.smart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import com.util.DbConnection;

public class GlobalFunction 
{
	
	// Increase Rank
	
	
	
	
	
	
	// Get File Rank
	
	public String getRank(String file_id) {
		String rank = "";
		try 
		{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `files` where f_id='"+file_id+"'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				rank= rs.getString("rank");
			}
			return rank;
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return rank;
	}

	
	
	
	//get File Name
	
	public String getFileName(String f_id) 
	{
		String filename = "";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `files` where id='"+ f_id + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				filename= rs.getString("filename");

			}
			return filename;
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return filename;
	}

	public String getEmail(String id) 
	{
		String email = "";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` where id='"+ id + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) 
			{
				email= rs.getString("email");

			}
			
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return email;
	}
	public String getFullName(String id) 
	{
		String fname = "";
		String lname = "";
		String fullname="";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` where id='"+ id + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) 
			{
				fname= rs.getString("fname");
				lname= rs.getString("lname");
				fullname = fname+" "+lname;

			}
			
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return fullname;
	}
	
	public String getHospital(String id) 
	{
		String fname = "";
		String lname = "";
		String fullname="";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctor` where id='"+ id + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) 
			{
				fname= rs.getString("hospital");
				fullname = fname+" "+lname;

			}
			
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return fullname;
	}
	
	public String getDoctorName(String id) 
	{
		String fname = "";
		String lname = "";
		String fullname="";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctor` where id='"+ id + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) 
			{
				fname= rs.getString("fname");
				lname= rs.getString("lname");
				fullname = fname+" "+lname;

			}
			
		} catch (Exception e) {
			System.out.println("Exception " + e);

		}
		return fullname;
	}
	public int  getFileCountWord(String filedata ) 
	{
		int count=0;
		
	     filedata= filedata.replaceAll("[-+.^:;,']", "");
	     System.out.println("filedata is "+filedata);

	    char ch[]= new char[filedata.length()];

	    for(int i=0;i<filedata.length();i++)
	    {

	        ch[i]= filedata.charAt(i);

	        if( ((i>0)&&(ch[i]!=' ')&&(ch[i-1]==' ')) || ((ch[0]!=' ')&&(i==0)) )
	        	
	            count++;

	    }
	    
	    System.out.println("Number of words in given String: "+count);
	
		return count;
	}
	

	public static void main(String[] args) 
	{
		
		GlobalFunction gf=new GlobalFunction();
		String fd="Ritesh Rama Surange";
		int c=gf.getFileCountWord(fd);
		System.out.println("c "+c);
		
		
	}
	/*
		 String s="";
		    int count=0;

		    Scanner in = new Scanner(System.in);
		    System.out.println("Please enter a String");
		     s=in.nextLine();
		     
		     s= s.replaceAll("[-+.^:;,']", "");
		     System.out.println("s is "+s);

		    char ch[]= new char[s.length()];

		    for(int i=0;i<s.length();i++)
		    {

		        ch[i]= s.charAt(i);

		        if( ((i>0)&&(ch[i]!=' ')&&(ch[i-1]==' ')) || ((ch[0]!=' ')&&(i==0)) )
		            count++;

		    }
		    System.out.println("Number of words in given String: "+count);

		  }

*/	}


