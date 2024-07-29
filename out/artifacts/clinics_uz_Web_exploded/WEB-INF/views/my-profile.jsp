<%@ page import="static com.itextpdf.kernel.pdf.PdfName.User" %>
<%@ page import="uz.pdp.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  User user = (User) session.getAttribute("user"); %>
<html>
<head>
    <title>My Update File</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 500px;
        }

        .card-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 10px 10px 0 0;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn-primary, .orange-button {
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .orange-button {
            background-color: #ffa500;
        }

        .orange-button:hover {
            background-color: #e59400;
        }

        .file-input-container {
            padding: 20px 0;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <!-- User Profile Display -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>User Profile</h3>
                </div>
                <div class="card-body">
                    <img src="${pageContext.request.contextPath}${user.picturePath}" alt="Profile Pic" height="100" width="100">
                    <form id="updateForm" action="${pageContext.request.contextPath}/user-profile" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${user.id}">

                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" value="${user.firstname}">
                        </div>

                        <c:if test="${user.role != 'PATIENT'}">
                            <div class="file-input-container">
                                <label for="image">Picture:</label><br>
                                <input type="file" id="image" name="image" required>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" value="${user.lastname}">
                        </div>

                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="${user.username}">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="text" class="form-control" id="password" name="password" value="${user.password}">
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" id="email" name="email" value="${user.email}">
                        </div>

                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                        </div>

                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" value="${user.age}">
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}">
                        </div>

                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select class="form-control" id="gender" name="gender">
                                <option value="MALE" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="FEMALE" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<c:if test="${user.role == 'PATIENT'}">
    <a href="${pageContext.request.contextPath}/user-profile/back-patient-page" class="btn btn-secondary mt-3">Back</a>
</c:if>
<c:if test="${user.role != 'PATIENT'}">
    <a href="${pageContext.request.contextPath}/user-profile/back-doctor-page" class="btn btn-secondary mt-3">Back</a>
</c:if>

</body>
</html>
