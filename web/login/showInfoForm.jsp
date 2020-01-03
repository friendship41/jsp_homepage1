<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-03
  Time: 오전 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String pw = (String) request.getAttribute("pw");
    List<String> list = (List<String>) request.getAttribute("idList");%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/post_code.css" />
    <script type="text/javascript" src="../js/script.js"></script>
    <title>아이디/비밀번호 확인</title>
</head>
<body>
<div id="warp">
    <!--헤더파일 들어가는 곳-->
    <%@ include file="../include/header.jsp"%>

    <!--그림파일 들어가는 곳 없어도 되지만 한번 넣어보자-->
    <div id="sub_img">
    </div>
    <!--왼쪽의 서브메뉴가 들어가는 곳-->
    <%@ include file="../include/left.jsp"%>

    <!--실제 내용 콘텐츠가 들어가는 곳-->
    <article id="contents">
        <div id="post_code_wrap">
            <h1>확인 결과</h1>
            <form class="post_code_form" method="post" action="/jsp_homepage1/login/procCheckCode.jsp">
                <div class="post_code">
                    <% if(pw != null && !pw.equals("")) {%>
                    <label>비밀번호 : </label><input type="text" name="confirmCode" required autofocus size="30" readonly value="<%=pw%>">
                    <%}
                    if(list != null)
                    {
                        if(list.size() > 0)
                        {
                            for(String s : list)
                            {%>
                                <label>아이디 : </label><input type="text" name="confirmCode" required autofocus size="30" readonly value="<%=s%>">
                            <%}
                        }
                        else
                        {%>
                            <label>검색결과가 없습니다 회원가입해주세요 </label>
                        <%}
                    }%>
                </div>
            </form>
        </div>

        <div class="clear"></div>

    </article>



    <div class="clear"></div>
    <!-- 푸터가 들어가는 곳 -->
    <%@ include file="../include/footer.jsp"%>

</div><!--warp 끝나는 부분-->
</body>
</html>
