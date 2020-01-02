<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-30
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String id = request.getParameter("id");%>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/idcheck.css" />
    <script type="text/javascript" src="../js/script.js"></script>
    <title>중복확인 결과</title>
</head>
<body>
    <div id="warp">
        <article id="contents">
            <div class="nothing"></div>
            <% String pw = dao.selectPw(id);
            if(pw == null)
            {%>
                <div class="chil">사용 가능한 아이디 입니다.</div>
            <%}
            else
            {%>
                <div class="chil">중복된 아이디 입니다.</div>
            <%}%>
            <div class="chil"><input type="button" value="닫기" class="btn" onclick="window.close()"/></div>
        </article>
    </div>
</body>
</html>


