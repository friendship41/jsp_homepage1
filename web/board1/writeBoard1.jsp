<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-31
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String id = (String) session.getAttribute("id");%>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<jsp:useBean id="vo" class="com.jsp.join.vo.MemberVO"/>
<% vo = dao.selectSingle(id);
String no = "-1";
String refSt = "0";
String stepSt = "0";
String depthSt = "0";
String check = request.getParameter("no");
if(check != null)
{
    no = check;
    refSt = request.getParameter("ref");
    stepSt = request.getParameter("step");
    depthSt = request.getParameter("depth");
}%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/board_wrt.css" />
    <script type="text/javascript" src="../js/script.js"></script>
    <title>글쓰기</title>
    <script type="text/javascript" src="https://jsgetip.appspot.com"></script>
    <script>
        function goGetIp() {
            console.log(ip());
            document.getElementById("ip").value=ip();
        }
        function checkWriteBoard() {
            var foorm = document.gogogo;
            if(document.getElementById("subject").value===""){
                alert("타이틀을 입력해 주세요");
                document.getElementById("subject").focus();
                return;
            }
            if(document.getElementById("content").value===""){
                alert("내용을 입력해 주세요");
                document.getElementById("content").focus();
                return;
            }
            foorm.submit();
        }
    </script>
</head>
<body onload="goGetIp()">
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
        <h1>Board</h1>
        <input type="button" value="list" class="btn"/> <!--게시판 목록으로 돌아가는 버튼-->
        <table id="board">
            <th id="img_bar">writing</th>
        </table>
        <div id="box">
            <div class="board">
                <form method="post" action="procWriteBoard1.jsp" id="gogogo" name="gogogo" enctype="multipart/form-data">
                    <div><label class="label">name</label><input type="text" required autofocus size="25" value="<%=vo.getName()%>" readonly name="name"></div>
                    <div><label class="label">e-mail</label><input type="email" required size="25" value="<%=vo.getEmail()%>" readonly name="email"></div>
<%--                    <div><label class="label">password</label><input type="password" required size="10">--%>
<%--                        <input type="checkbox" >비밀글 작성시 체크해주세요.</div>--%>
                    <% if(no.equals("-1")) {
                        out.print("<div><label class=\"label\">title</label><input type=\"text\" required size=\"50\" name=\"subject\" id=\"subject\"></div>");
                    }
                    else{
                        out.print("<div><label class=\"label\">title</label><input type=\"text\" required size=\"50\" name=\"subject\" id=\"subject\" value=\"[답글] \"></div>");
                    }%>
                    <div><label class="label">input text</label><textarea class="text_area" name="content" required id="content"></textarea></div>
                    <div><label class="label">file</label><input type="text" readonly size="63"><input type="button" value="찾기" class="btn"></div>

                    <div class="board_btn">
                        <input type="hidden" value="<%=vo.getId()%>" name="writer">
                        <input type="hidden" id="ip" name="ip">
                        <input type="hidden" id="no" name="no" value="<%=no%>">
                        <input type="hidden" id="ref" name="ref" value="<%=refSt%>">
                        <input type="hidden" id="step" name="step" value="<%=stepSt%>">
                        <input type="hidden" id="depth" name="depth" value="<%=depthSt%>">
                        <input type="reset" value="reset" class="btn">
                        <input type="button" value="save" class="btn" onclick="checkWriteBoard()">
                    </div>
                </form>
            </div><!--.board 닫는태그-->
        </div>



        <div class="clear"></div>

    </article>



    <div class="clear"></div>
    <!-- 푸터가 들어가는 곳 -->
    <%@ include file="../include/footer.jsp"%>

</div><!--warp 끝나는 부분-->
</body>
</html>
