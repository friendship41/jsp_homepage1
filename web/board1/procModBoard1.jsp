<%@ page import="com.jsp.board1.dao.Board1DAO" %>
<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<jsp:useBean id="vo" class="com.jsp.board1.vo.Board1VO"/>
<jsp:setProperty name="vo" property="*"/>
<% Board1DAO board1DAO = Board1DAO.getInstance();
    board1DAO.updateSingleBoard(vo);
    response.sendRedirect("/jsp_homepage1");%>
<html>
<head>
    <title>수정중..</title>
</head>
<body>

</body>
</html>
