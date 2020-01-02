package com.jsp.mail.servlet;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

@WebServlet("/MailToU")
public class MailToU extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Authenticator auth = new MyAuthentication();

        Session session = Session.getDefaultInstance(props,auth);
        MimeMessage msg = new MimeMessage(session);

        try
        {
            msg.setSentDate(new Date());

            InternetAddress from = new InternetAddress("poo963369@naver.com");

            msg.setFrom(from);

            String email = request.getParameter("email");

            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);

            msg.setSubject("비밀번호 인증번호", "UTF-8");

            String code = request.getParameter("code");
            msg.setText(code, "UTF-8");

            msg.setHeader("content-Type", "text/html");

            javax.mail.Transport.send(msg);
        }
        catch (MessagingException e)
        {
            e.printStackTrace();
        }

        request.setAttribute("code", request.getParameter("code"));
        RequestDispatcher disp = request.getRequestDispatcher("/login/findIDPW.jsp");
        disp.forward(request, response);


    }

//    메일서버에 로그인정보 코드 부분
    class MyAuthentication extends Authenticator{
        PasswordAuthentication pa;

        public MyAuthentication(){
            String id = "poo963369";
            String pw = "####";

            pa = new PasswordAuthentication(id, pw);
        }

        public PasswordAuthentication getPasswordAuthentication(){
            return pa;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}
