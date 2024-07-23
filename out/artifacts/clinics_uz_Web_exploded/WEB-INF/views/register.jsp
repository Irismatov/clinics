<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/22/2024
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<%--    <form action="${pageContext.request.contextPath}/register" method="post">--%>
<%--        <input type="text" name="firstname" placeholder="firstname" required>--%>
<%--        <input type="text" name="lastname" placeholder="lastname" required>--%>
<%--        <input type="text" name="username" placeholder="username" required>--%>
<%--        <input type="text" name="phoneNumber" placeholder="phoneNumber" required>--%>
<%--        <input type="text" name="gender" placeholder="gender" required>--%>
<%--        <input type="text" name="address" placeholder="address" required>--%>
<%--        <input type="number" name="age" placeholder="age" required>--%>
<%--        <select id="role" name="role" required>--%>
<%--            <option value="MAIN_DOCTOR">MAIN_DOCTOR</option>--%>
<%--            <option value="DENTIST">DENTIST</option>--%>
<%--            <option value="GENERAL_PRACTITIONER">GENERAL_PRACTITIONER</option>--%>
<%--            <option value="NEUROLOGIST">NEUROLOGIST</option>--%>
<%--            <option value="SURGEON">SURGEON</option>--%>
<%--            <option value="PATIENT">PATIENT</option>--%>
<%--        </select>--%>
<%--        <input type="email" name="email" placeholder="email" required>--%>
<%--        <input type="password" name="password" placeholder="password" required>--%>
<%--        <button type="submit">Register</button>--%>
<%--    </form>--%>
<form action="${pageContext.request.contextPath}/register">
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
