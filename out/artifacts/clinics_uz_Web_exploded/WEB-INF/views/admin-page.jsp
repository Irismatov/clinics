<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Doctor</title>
</head>
<body>
<h2>Create Doctor</h2>
<form action="${pageContext.request.contextPath}/auth/create-doctors" method="post">
    <label for="role">Specialty:</label>
    <select id="role" name="role">
        <option value="DENTIST">DENTIST</option>
        <option value="SURGEON">SURGEON</option>
        <option value="NEUROLOGIST">NEUROLOGIST</option>
        <option value="GENERAL_PRACTITIONER">GENERAL_PRACTITIONER</option>
        <option value="SURGEON">I_AM_BATMAN</option>
        <!-- Add other specialties as needed -->
    </select><br><br>

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
</body>
</html>
