<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-30
  Time: 오후 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String id = (String) session.getAttribute("id");
String pw = request.getParameter("pw");%>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<% String dbpw = dao.selectPw(id);%>
<html>
<head>
    <title>Title</title>
    <script>
        function success() {
            alert("회원탈퇴 되셨습니다 안녕히가세요.");
            location.href="/jsp_homepage1";
        }
        function fail() {
            alert("비밀번호가 다릅니다");
            history.back();
        }
    </script>
</head>
<%if(dbpw.equals(pw)){
    session.setAttribute("id", null);
    dao.deleteMember(id);%>
<body onload="success()">
<%}
else{
%>
<body onload="fail()">
<%}%>
</body>
</html>
