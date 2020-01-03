<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오후 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String code = (String) request.getAttribute("code");
String emailOK = (String) request.getAttribute("emailOK");
String email = (String) request.getAttribute("email");
String id = (String) request.getAttribute("id");
    System.out.println("confirmIDPW-code: "+code);
    System.out.println("confirmIDPW-emailOK: "+emailOK);
    System.out.println("confirmIDPW-email: "+email);%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/post_code.css" />
    <script type="text/javascript" src="js/script.js"></script>
    <title>아이디/비밀번호 찾기</title>
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
            <h1>인증번호 확인</h1>
            <form class="post_code_form" method="post" action="login/procCheckCode.jsp">
                <div class="post_code">
                    <label>인증번호 : </label><input type="text" name="confirmCode" required autofocus size="30">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="code" value="<%=code%>">
                    <input type="hidden" name="emailOK" value="<%=emailOK%>">
                    <input type="hidden" name="email" value="<%=email%>">
                    <input type="submit" value="확인" class="btn">
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
