<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Update file</title>
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
                    <form id="updateForm" action="${pageContext.request.contextPath}/user-profile" method="post">
                        <input type="hidden" name="id" value="${user.id}">

                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" value="${user.firstname}">
                        </div>
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
                                <option value="FEAMLE" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<a href="${pageContext.request.contextPath}/user-profile/back-patient-page">Back</a>

</body>
</html>

