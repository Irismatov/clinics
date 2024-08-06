<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Management</title>
    <style>
        body {
            background-color: #f0f2f5; /* Light background for a clean look */
            color: #333; /* Dark text for readability */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font */
        }
        .container {
            background: #ffffff; /* White background for contrast */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            max-width: 500px; /* Generous width */
            width: 100%; /* Full width for smaller screens */
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px; /* Space between buttons */
        }
        .button {
            background: linear-gradient(145deg, #007bff, #0056b3); /* Gradient background */
            border: none;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%; /* Full width for consistency */
            max-width: 200px; /* Maximum width for buttons */
        }
        .button:hover {
            background: linear-gradient(145deg, #0056b3, #003d7a); /* Darker gradient on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Subtle shadow change on hover */
        }
        .back-link {
            background: #6c757d; /* Grey background for a neutral look */
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            width: 100%; /* Full width for consistency */
            max-width: 200px; /* Maximum width for buttons */
            transition: all 0.3s ease;
        }
        .back-link:hover {
            background: #5a6268; /* Darker grey on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect on hover */
        }
    </style>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/admin/create-doctors" method="post">
        <input type="submit" value="Create Employee" class="button">
    </form>
    <a href="${pageContext.request.contextPath}/admin/show-employee" class="button">
        View Doctors
    </a>
    <a href="${pageContext.request.contextPath}/" class="back-link">
        Back to Login
    </a>
</div>
</body>
</html>
