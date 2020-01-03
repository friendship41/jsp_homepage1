<%@ page import="com.jsp.board1.dao.Board1DAO" %>
<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String no = request.getParameter("no");%>
<% Board1DAO board1DAO = Board1DAO.getInstance();
    try
    {
        int replyNum = board1DAO.selectReplyCount(Integer.parseInt(no));
        if(replyNum == 0)
        {

            board1DAO.deleteSingleBoard(Integer.parseInt(no));
        }
        else
        {
            board1DAO.updateBoardToNull(Integer.parseInt(no));
        }
        response.sendRedirect("/jsp_homepage1");
    }
    catch (NumberFormatException e)
    {
        System.out.println("procDeleteBoard.jsp-파라미터 값이 잘못넘어옴: "+e.getMessage());
        response.sendRedirect("/jsp_homepage1");
    } %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
