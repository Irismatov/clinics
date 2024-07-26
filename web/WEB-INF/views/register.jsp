<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/23/2024
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}form.css">
</head>
<body>
<h4 style="color: red">${message}</h4>

<div class="container">
    <div class="text">
        Sign Up
    </div>
    <form action="${pageContext.request.contextPath}/auth/register" method="post">
        <div class="form-row">
            <div class="input-data">
                <label for=>Enter Firstname</label>
                <label>
                    <input type="text" name="firstname" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>Enter Lastname</label>
                <label>
                    <input type="text" name="lastname" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>Enter Username</label>
                <label>
                    <input type="text" name="username" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>Enter password</label>
                <label>
                    <input type="password" name="password" required>
                </label>
                <div class="underline"></div>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <label for=>Enter Age</label>
                <label>
                    <input type="text" name="age" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>Gender</label>
                <label>
                    <select name="gender">
                       <option value="MALE">MALE</option>
                       <option value="FEMALE">FEMALE</option>
                       <option value="OTHER">OTHER</option>
                    </select>
                </label>
            </div>
            <div class="input-data">
                <label for=>Address</label>
                <label>
                    <input type="text" name="address" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>phoneNumber</label>
                <label>
                    <input type="text" name="phoneNumber" required>
                </label>
                <div class="underline"></div>
            </div>
            <div class="input-data">
                <label for=>Email</label>
                <label>
                    <input type="email" name="email" required>
                </label>
                <div class="underline"></div>
            </div>


        </div>
        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="submit">
            </div>
        </div>
    </form>
</div>
</body>
</html>