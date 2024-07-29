<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create employee</title>
    <style>
        .error-message {
            color: red;
            text-align: center;
            font-size: 14px;
            margin-bottom: 15px; /* Space between the error message and the form */
        }
    </style>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<a href="${pageContext.request.contextPath}/admin" class="back-link">
    <span>Back</span>
</a>

<h2>Create Doctor</h2>
<c:if test="${not empty message}">
    <div class="error-message">${message}</div>
</c:if>
<form action="${pageContext.request.contextPath}/admin/create-doctors" method="post">
    <label for="role">Specialty:</label>
    <select id="role" name="role">
        <c:forEach var="role" items="${roles}">
            <c:if test="${role != 'MAIN_DOCTOR'}">
                <option value="${role}" ${user.role == role ? 'selected' : ''}>${role}</option>
            </c:if>        </c:forEach>
    </select>
    <br><br>

    <label for="firstname">First Name:</label>
    <input type="text" id="firstname" name="firstname" required><br><br>

    <label for="lastname">Last Name:</label>
    <input type="text" id="lastname" name="lastname" required><br><br>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="age">Age:</label>
    <input type="number" id="age" name="age" required><br><br>

    <label for="gender">Gender:</label>
    <select id="gender" name="gender">
        <option value="MALE">Male</option>
        <option value="FEMALE">Female</option>
    </select><br><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br><br>

    <input type="submit" value="Create Doctor">
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
