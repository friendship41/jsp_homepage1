<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오후 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String mssg = (String)request.getAttribute("msg");%>
<html>
<head>
    <title><%= mssg%></title>
    <script>
        function alertMessage(msg) {
            alert(msg);
            location.href = "/jsp_homepage1";
        }
        alertMessage("<%= mssg%>");
    </script>
</head>
<body>

</body>
</html>
