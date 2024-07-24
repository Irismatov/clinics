<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/24/2024
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Code</title>
</head>
<body>
<h4 style="color: red">${message}</h4>
<form action="${pageContext.request.contextPath}/auth/registration-code" method="post">
    <div class="input-data">
        <input type="text" name="code" required>
        <div class="underline"></div>
        <label for=>Code</label>
        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="submit">
            </div>
        </div>
    </div>
</form>

</body>
</html>
