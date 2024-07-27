<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctors List</title>
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

<c:if test="${not empty message}">
    <div class="error-message">${message}</div>
</c:if>

<c:choose>
    <c:when test="${not empty users}">
        <h2>Doctors List</h2>
        <table border="1">
            <thead>
            <tr>
                <th>#</th>
                <th>Role</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}" varStatus="num">
                <tr>
                    <td>${num.index + 1}</td>
                    <td>${user.role}</td>
                    <td>${user.firstname}</td>
                    <td>${user.lastname}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.age}</td>
                    <td>${user.gender}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.address}</td>
                    <td>
                        <button type="submit" class="btn btn-dark btn-sm" data-toggle="modal" data-target="#editEventModal${user.id}">Edit</button>

                        <form action="${pageContext.request.contextPath}/admin/delete-doctor" method="post" style="display:inline;">
                            <input type="hidden" name="userId" value="${user.id}">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>

                <div class="modal fade" id="editEventModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="editEventModal${user.id}" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editEventLabel${user.id}">Edit user</h5>
                                <span class="navbar-text">${user.username}</span>
                            </div>

                            <form action="${pageContext.request.contextPath}/admin/update-doctor" method="post">
                                <input type="hidden" name="userId" value="${user.id}">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="role${user.id}">Role</label>
                                        <select name="role" class="form-control" id="role${user.id}" required>
                                            <c:forEach var="role" items="${roles}">
                                                <c:if test="${role != 'MAIN_DOCTOR'}">
                                                    <option value="${role}" ${user.role == role ? 'selected' : ''}>${role}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="firstname${user.id}">First Name</label>
                                        <input name="firstname" type="text" class="form-control" id="firstname${user.id}" value="${user.firstname}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastname${user.id}">Last Name</label>
                                        <input name="lastname" type="text" class="form-control" id="lastname${user.id}" value="${user.lastname}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="username${user.id}">Username</label>
                                        <input name="username" type="text" class="form-control" id="username${user.id}" value="${user.username}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password${user.id}">Password</label>
                                        <input name="password" type="password" class="form-control" id="password${user.id}" value="${user.password}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email${user.id}">Email</label>
                                        <input name="email" type="email" class="form-control" id="email${user.id}" value="${user.email}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="age${user.id}">Age</label>
                                        <input name="age" type="number" class="form-control" id="age${user.id}" value="${user.age}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender${user.id}">Gender</label>
                                        <select name="gender" class="form-control" id="gender${user.id}" required>
                                            <option value="MALE" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
                                            <option value="FEMALE" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneNumber${user.id}">Phone Number</label>
                                        <input name="phoneNumber" type="text" class="form-control" id="phoneNumber${user.id}" value="${user.phoneNumber}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address${user.id}">Address</label>
                                        <input name="address" type="text" class="form-control" id="address${user.id}" value="${user.address}" required>
                                    </div>
                                </div>
                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>You don't have any doctors yet.</p>
    </c:otherwise>
</c:choose>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
