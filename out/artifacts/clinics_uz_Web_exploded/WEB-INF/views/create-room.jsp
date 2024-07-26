<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/25/2024
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Room</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/create-room" method="post">

        <h4 style="color: red">Create a Room</h4>
        <label>Name of Room</label>
        <label>
            <input type="text" name="name" placeholder="name" required>
        </label>
        <label>Number of Room</label>
        <label>
            <input type="number" name="number" placeholder="room" required>
        </label>

        <label>Number of floor</label>
        <label>
            <input type="number" name="floor" placeholder="flor" required>
        </label>
        <label>How many beds</label>
        <label>
            <input type="number" name="beds" placeholder="beds" required>
        </label>

        <button type="submit">Create Room</button>


        <a href="${pageContext.request.contextPath}/create-room/back-administrator-page">Back</a>
    </form>
</body>
</html>
