<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/25/2024
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator Page</title>
</head>
<body>
    <h2>Here is Administrator page</h2>

    <button>
    <a href="${pageContext.request.contextPath}/create-room">Create Room</a>
    </button>
    <button>
    <a href="${pageContext.request.contextPath}/create-room/all-rooms">All rooms</a>
    </button>
</body>
</html>
