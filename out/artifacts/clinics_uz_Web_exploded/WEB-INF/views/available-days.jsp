<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Days</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background-color: #e6f7ff;
            border: 1px solid #b3daff;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            color: #007acc;
        }
        li:hover {
            background-color: #cceeff;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>
<h2>Select a Day</h2>
<ul>
    <c:forEach var="day" items="${days}">
        <li>
            <a href="select-day?doctorId=${doctorId}&date=${day}">
                    ${day}
            </a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
