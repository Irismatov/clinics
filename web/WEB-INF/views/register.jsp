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
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
private String firstname;
private String lastname;
@Column(unique = true)
private String username;
private String password;
private String email;
private Integer age;
private String gender;
private String phoneNumber;
private String address;
private String code;

<div class="container">
    <div class="text">
        Sign Up
    </div>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="firstname" required>
                <div class="underline"></div>
                <label for="">firstname</label>
            </div>
            <div class="input-data">
                <input type="text" name="lastname" required>
                <div class="underline"></div>
                <label for="">Lastname</label>
            </div>
            <div class="input-data">
                <input type="text" name="username" required>
                <div class="underline"></div>
                <label for="">Username</label>
            </div>
            <div class="input-data">
                <input type="password" name="password" required>
                <div class="underline"></div>
                <label for="">password</label>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="age" required>
                <div class="underline"></div>
                <label for="">Age</label>
            </div>
            <div class="input-data">
                <input type="text" name="gender" required>
                <div class="underline"></div>
                <label for="">Gender</label>
            </div>
            <div class="input-data">
                <input type="text" name="address" required>
                <div class="underline"></div>
                <label for="">Address</label>
            </div>
            <div class="input-data">
                <input type="email" name="email" required>
                <div class="underline"></div>
                <label for="">Email</label>
            </div>
            <div class="input-data">
                <input type="text" name="code" required>
                <div class="underline"></div>
                <label for="">Code</label>
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