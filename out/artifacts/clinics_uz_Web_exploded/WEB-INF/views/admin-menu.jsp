<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 30px;
            text-align: center;
        }
        .button {
            background-color: #28a745; /* Green, suitable for medical theme */
            color: #fff;
            border: none;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-size: 18px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeIn">
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

