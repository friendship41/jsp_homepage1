<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-30
  Time: 오후 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String id = request.getParameter("id");
String pw = request.getParameter("pw");%>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<% String dbpw = dao.selectPw(id); %>
<html>
<head>
    <title>로그인중..</title>
    <script>
        function success() {
            alert("로그인 성공!");
            location.href="login2.jsp";
        }
        function noId() {
            alert("아이디가 없습니다");
            history.back();
        }
        function pwFalse() {
            alert("비밀번호가 틀렸습니다");
            history.back();
        }
    </script>
</head>
<% if(dbpw == null){ %>
<body onload="noId()">
<% }
else{
    if(!dbpw.equals(pw)){%>
        <body onload="pwFalse()">
    <%}
    else{
        session.setAttribute("id", id);%>
        <body onload="success()">
    <%}
}%>

</body>
</html>
