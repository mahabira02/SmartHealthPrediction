/*******************************************************************************
 * Copyright (c) Group-18.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms.
 * Contributors: GROUP 18
 *******************************************************************************/

/*

 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smart;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 import javax.mail.internet.*;
 import javax.mail.*;
 import java.util.*;


/*******  SSL:- (Secure Sockets Layer) ********/
public class SendMailSSL {
    
    Session session;
    String To;
   
public int EmailSending(String To, String Sub, String Msg) {
      System.out.println("----------To-----------"+To);
        int flag;
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host","smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                        	return new PasswordAuthentication("mahabira07@gmail.com","groupno18");
                        }
                    });
        
            String From = "mahabira07@gmail.com";
                
    
            Message message = new MimeMessage(session);
            // Set From: header field of the header.
           // message.setFrom(new InternetAddress(From));
            message.setFrom(new InternetAddress(From," Smart Health Prediction System "));
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            // Set Subject
            message.setSubject(Sub);
            
            // Now set the actual message
            /* message.setText(Msg); */
            
            // For set msg As HTML coding "Use Either .setText Or This Method to Send Msg"
            message.setContent(Msg, "text/html" );

            Transport.send(message);
            System.out.println("Sent message successfully....");
            
            flag = -1;
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
            
        }
      return flag;
    }//SEND USER MAIL END
   
    public static void main(String[] args) {
        
       
            SendMailSSL s = new SendMailSSL();
        s.EmailSending("mahabira01@gmail.com", "Test", "Test");
       
    }
}//CLOSE MAIN CLASS