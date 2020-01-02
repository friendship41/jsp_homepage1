<%@ page import="com.jsp.board1.dao.Board1DAO" %>
<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String no = request.getParameter("no");%>
<jsp:useBean id="vo" class="com.jsp.board1.vo.Board1VO"/>
<% Board1DAO board1DAO = Board1DAO.getInstance();
    try
    {
        vo = board1DAO.selectSingleBoard1(Integer.parseInt(no));
    }
    catch (NumberFormatException e)
    {
        System.out.println("board_mod.jsp-파라미터 값이 잘못넘어옴: "+e.getMessage());
        response.sendRedirect("/jsp_homepage1");
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
        function checkModBoard() {
            var foorm = document.gogogo2;
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
                <form method="post" action="procModBoard1.jsp" id="gogogo2" name="gogogo2">
                    <div><label class="label">name</label><input type="text" required autofocus size="25" value="<%=vo.getWriter()%>" readonly name="writer"></div>
                    <div><label class="label">e-mail</label><input type="email" required size="25" value="<%=vo.getEmail()%>" readonly name="email"></div>
                    <%--                    <div><label class="label">password</label><input type="password" required size="10">--%>
                    <%--                        <input type="checkbox" >비밀글 작성시 체크해주세요.</div>--%>
                    <div><label class="label">title</label><input type="text" required size="50" name="subject" id="subject" value="<%=vo.getSubject()%>"></div>
                    <div><label class="label">input text</label><textarea class="text_area" name="content" required id="content"><%=vo.getContent()%></textarea></div>
                    <%--                    <div><label class="label">file</label><input type="text" readonly size="70">--%>
                    <%--                        <input type="button" value="찾기" class="btn"></div>--%>

                    <div class="board_btn">
                        <input type="hidden" id="no" name="no" value="<%=vo.getNo()%>">
                        <input type="hidden" id="ip" name="ip">
                        <input type="reset" value="reset" class="btn">
                        <input type="button" value="save" class="btn" onclick="checkModBoard()">
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
