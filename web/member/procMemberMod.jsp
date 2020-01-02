<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-31
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<jsp:useBean id="vo" class="com.jsp.join.vo.MemberVO"/>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<jsp:setProperty name="vo" property="*"/>
<% boolean result = dao.updateMember(vo); %>
<html>
<head>
    <title>Title</title>
    <script>
        function success() {
            alert("정보수정 성공!");
            location.href="/jsp_homepage1";
        }
        function fail() {
            alert("정보수정 실패");
            location.href="/jsp_homepage1";
        }
    </script>
</head>
<% if(result) {%>
<body onload="success()">
<%}
else {%>
<body onload="fail()">
<%}%>

</body>
</html>
