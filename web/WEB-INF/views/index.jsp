<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/23/2024
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index page</title>
</head>
<body>
    <button>
        <a href="${pageContext.request.contextPath}/auth/login">Login</a>
    </button>
    <button>
        <a href="${pageContext.request.contextPath}/auth/register">Register</a>
    </button>
</body>
</html>
