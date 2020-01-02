<%@ page import="com.jsp.board1.dao.Board1DAO" %>
<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-31
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String noSt = request.getParameter("no");
String refSt = request.getParameter("ref");
String stepSt = request.getParameter("step");
String depthSt = request.getParameter("depth");%>
<jsp:useBean id="vo" class="com.jsp.board1.vo.Board1VO"/>
<jsp:setProperty name="vo" property="*"/>
<% Board1DAO board1DAO = Board1DAO.getInstance();
if(noSt.equals("-1"))
{
    board1DAO.insertNewBoard1(vo);
}
else
{
    board1DAO.updateRefStepDepth(vo);
    board1DAO.insertReply(vo);
}
response.sendRedirect("/jsp_homepage1");%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
