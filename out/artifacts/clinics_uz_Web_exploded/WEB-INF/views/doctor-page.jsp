<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 24.07.2024
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor</title>
</head>
<body>
<div style="display: flex">


    <button class="button">
        <a href="${pageContext.request.contextPath}/requests">Incoming requests</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/accepted-requests/show">New-diagnose</a>
    </button>

</div>
</body>
</html>
