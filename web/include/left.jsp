<nav id="sub_menu">
    <ul>
        <% if(loginCheck == null || loginCheck.equals("")) { %>
        <li><a href="/jsp_homepage1/login/LoginForm.jsp">Login</a></li>
        <li><a href="/jsp_homepage1/member/join.jsp">Join Us</a></li>
        <%}
        else {%>
        <li><a href="/jsp_homepage1/login/logout.jsp">Logout</a></li>
        <%}%>
        <li><a href="/jsp_homepage1">Board</a></li>
        <li><a href="#">Ajax Board</a></li>
    </ul>
</nav>
