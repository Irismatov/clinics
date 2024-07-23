<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/22/2024
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Request Email</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/send-code">
        <label>
            <input type="email" name="email" placeholder="email" required>
        </label>
        <button type="submit">Get code</button>
    </form>



<form action="">
    <label>
        <input type="text" name="password" placeholder="password" required>
    </label>
    <button type="submit"></button>
</form>
</body>
</html>
