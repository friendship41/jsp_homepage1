<%@ page import="com.jsp.board1.dao.Board1DAO" %>
<%@ page import="com.jsp.board1.vo.Board1VO" %>
<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-31
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String no = request.getParameter("no");
String id = (String) session.getAttribute("id");
Board1VO board1VO = null;
if(no == null || no.equals("")){
    response.sendRedirect("/jsp_homepage1");
}
else
{
    Board1DAO board1DAO = Board1DAO.getInstance();
    try
    {
        board1DAO.updateReadCnt(Integer.parseInt(no));
        board1VO = board1DAO.selectSingleBoard1(Integer.parseInt(no));
    }
    catch (NumberFormatException e)
    {
        System.out.println("board_read.jsp-파라미터 값이 잘못넘어옴: "+e.getMessage());
        response.sendRedirect("/jsp_homepage1");
    }
}%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/board_read.css" />
    <script type="text/javascript" src="../js/script.js"></script>
    <title><%=board1VO.getSubject()%></title>
    <script>
        function goTOMod() {
            var url = "/jsp_homepage1/board1/board_mod.jsp?no="+<%=no%>;
            location.href=url;
        }
        function goTOReply() {
            var url1 = "/jsp_homepage1/board1/writeBoard1.jsp?no="+<%=no%>;
            var url2 = url1+"&ref="+<%=board1VO.getRef()%>;
            var url3 = url2+"&step="+<%=board1VO.getStep()%>;
            var url4 = url3+"&depth="+<%=board1VO.getDepth()%>;
            location.href=url4;
        }
        function deleteConfirm() {
            var confirmm = confirm("정말로 삭제하시겠습니까?");
            if(confirmm === true)
            {
                location.href="/jsp_homepage1/board1/procDeleteBoard.jsp?no="+<%=no%>;
            }
        }
    </script>
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
        <h1>게시글 보기</h1>
        <div id="read_warp">
            <span class="read_board"><h2>글번호</h2></span>
            <span><h3><%=board1VO.getNo()%></h3></span>
            <span class="read_board"><h2>조회수</h2></span><span><h3><%=board1VO.getReadcnt()%></h3></span>
            <span class="read_board"><h2>글제목</h2></span><span id="read_title"><h3><%=board1VO.getSubject()%></h3></span>

            <span id="bd_text"><h4><%=board1VO.getContent()%></h4></span>
<%--            <span class="read_board"><h2>첨부파일보기</h2></span><span id="file"><input type="text" size="35" readonly>--%>
<%--												<input type="button" value="받기" class="btn"></span>--%>
            <div id="read_btn">
                <% if(id != null && !id.equals("")){
                    if(board1VO.getWriter().equals(id)){%>
                <input type="button" value="글수정" class="btn" onclick="goTOMod()">
                <input type="button" value="글삭제" class="btn" onclick="deleteConfirm()">
                <%  }
                    else{%>
                <input type="button" value="답글" class="btn" onclick="goTOReply()">
                <%  }
                }%>
                <input type="button" value="글목록" class="btn" onclick="location.href='/jsp_homepage1'"></div>
            <div class="clear"></div>

    </article>



    <div class="clear"></div>
    <!-- 푸터가 들어가는 곳 -->
    <%@ include file="../include/footer.jsp"%>

</div><!--warp 끝나는 부분-->
</body>
</html>
