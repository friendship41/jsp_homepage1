package com.jsp.mail.servlet;

import com.jsp.join.dao.MemberDAO;

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
        String formEmail = request.getParameter("email");
        String formId = request.getParameter("id");
        String formCode = request.getParameter("code");
        request.setAttribute("email", formEmail);
        System.out.println("MailToU-formCode: "+formCode);
        System.out.println("MailToU-formId: "+formId);
        System.out.println("MailToU-formEmail: "+formEmail);
        boolean dbCheck = false;

        MemberDAO memberDAO = new MemberDAO();
        if(formId != null && !formId.equals(""))
        {
            String dbEmail = memberDAO.selectEmail(formId);
            System.out.println("MailToU-dbEmail: "+dbEmail);
            if(dbEmail == null)
            {
                request.setAttribute("msg","없는 아이디 입니다..");
                RequestDispatcher disp = request.getRequestDispatcher("/common/MsgGoBack.jsp");
                disp.forward(request, response);
                return;
            }
            else
            {
                if(dbEmail.equals(formEmail))
                {
                    System.out.println("true");
                    dbCheck=true;
                }
                else
                {
                    request.setAttribute("msg", "잘못된 아이디 이거나 이메일입니다..");
                    RequestDispatcher disp = request.getRequestDispatcher("/common/MsgGoBack.jsp");
                    disp.forward(request, response);
                    return;
                }
            }
        }


        Properties props = new Properties();
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


            InternetAddress to = new InternetAddress(formEmail);
            msg.setRecipient(Message.RecipientType.TO, to);

            msg.setSubject("비밀번호 인증번호", "UTF-8");

            msg.setText(formCode, "UTF-8");

            msg.setHeader("content-Type", "text/html");

            Transport.send(msg);
        }
        catch (MessagingException e)
        {
            e.printStackTrace();
        }

        System.out.println("MailToU-code: "+formCode);
        request.setAttribute("code", formCode);
        if(dbCheck)
        {
            request.setAttribute("emailOK", "true");
            request.setAttribute("id", formId);
        }
        RequestDispatcher disp = request.getRequestDispatcher("/login/confirmIDPW.jsp");
        disp.forward(request, response);


    }

//    메일서버에 로그인정보 코드 부분
    class MyAuthentication extends Authenticator{
        PasswordAuthentication pa;

        public MyAuthentication(){
            String id = "poo963369";
            String pw = "########";     //비밀번호

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
