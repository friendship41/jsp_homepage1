<%@ page import="com.jsp.join.dao.MemberDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오후 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String code = request.getParameter("code");
    String emailOK = request.getParameter("emailOK");
String confirmCode = request.getParameter("confirmCode");
String email = request.getParameter("email");
String id = request.getParameter("id");
    System.out.println("procCheckCode-code: "+code);
    System.out.println("procCheckCode-emailOK: "+emailOK);
    System.out.println("procCheckCode-confirmCode: "+confirmCode);
    System.out.println("procCheckCode-email: "+email);
    System.out.println("procCheckCode-id: "+id);

RequestDispatcher disp;

if(code != null && code.equals(confirmCode))
{
    MemberDAO memberDAO = new MemberDAO();
    if(emailOK.equals("true"))
    {
        String pw = memberDAO.selectPw(id);
        request.setAttribute("pw",pw);
    }
    else
    {
        List<String> list = memberDAO.selectIds(email);
        request.setAttribute("idList",list);
    }
    disp = request.getRequestDispatcher("showInfoForm.jsp");
    disp.forward(request, response);
}
else
{
    request.setAttribute("msg", "인증번호가 잘못되었습니다. 처음부터 다시 해주세요");
    disp = request.getRequestDispatcher("/common/MsgGoHome.jsp");
    disp.forward(request, response);
}%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
