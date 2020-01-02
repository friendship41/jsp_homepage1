<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <% if(loginCheck == null || loginCheck.equals("")) {%>
    <div id="login"><a href="/jsp_homepage1/login/LoginForm.jsp">Login</a> | <a href="/jsp_homepage1/member/join.jsp">Join</a></div>
    <%}
    else
    {%>
    <div id="login"><%=loginCheck%>님 환영합니다!  |  <a href="/jsp_homepage1/login/logout.jsp">Logout</a></div>
    <%}%>
    <div class="clear"></div>
    <div id="logo">
        <img src="/jsp_homepage1/images/logo.png" width="265" height="62" alt="Javaline Web"></div>
    <nav id="top_menu">
        <ul>
            <li><a href="/jsp_homepage1">Home</a></li>
            <li><a href="#">Who is Tommy.Lee?</a></li>
            <li><a href="/jsp_homepage1/login/LoginForm.jsp">Member</a></li>
            <li><a href="/jsp_homepage1">Board</a></li>
            <li><a href="#">Ajax Board</a></li>
        </ul>
    </nav>

</header>
