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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .button-container {
            display: flex;
            gap: 10px;
        }

        .button {
            background-color: #4CAF50; /* Green background */
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 15px 32px; /* Some padding */
            text-align: center; /* Centered text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make the container behave like a button */
            font-size: 16px; /* Increase font size */
            margin: 4px 2px; /* Add some margin */
            cursor: pointer; /* Add a pointer on hover */
            border-radius: 8px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth background color change */
        }

        .button a {
            color: white;
            text-decoration: none;
        }

        .button:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
</head>
<body>
<div class="button-container">
    <button class="button">
        <a href="${pageContext.request.contextPath}/requests">Incoming requests</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/accepted-requests/show">New-diagnose</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/user-profile">My Profile</a>
    </button>
</div>
</body>
</html>

