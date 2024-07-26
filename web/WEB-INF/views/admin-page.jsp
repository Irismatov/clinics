<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Doctor</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>Create Doctor</h2>
<form action="${pageContext.request.contextPath}/admin/create-doctors" method="post">
    <label for="role">Specialty:</label>
    <select id="role" name="role">
        <option value="DENTIST">DENTIST</option>
        <option value="SURGEON">SURGEON</option>
        <option value="NEUROLOGIST">NEUROLOGIST</option>
        <option value="GENERAL_PRACTITIONER">GENERAL_PRACTITIONER</option>
        <option value="THERAPIST">THERAPIST</option>
        <option value="PEDIATRICIAN">PEDIATRICIAN</option>
        <option value="OTOLARYNGOLOGY">OTOLARYNGOLOGY</option>
        <option value="CARDIOLOGIST">CARDIOLOGIST</option>
        <option value="RHEUMATOLOGIST">RHEUMATOLOGIST</option>
        <option value="ENDOCRINOLOGIST">ENDOCRINOLOGIST</option>
        <option value="GASTROENTEROLOGIST">GASTROENTEROLOGIST</option>
        <option value="ALLERGIST">ALLERGIST</option>
        <option value="ANESTHESIOLOGIST">ANESTHESIOLOGIST</option>

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

                        <form action="${pageContext.request.contextPath}/admin/delete-doctor" method="post">
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
                                            <option value="DENTIST" ${user.role == 'DENTIST' ? 'selected' : ''}>Dentist</option>
                                            <option value="SURGEON" ${user.role == 'SURGEON' ? 'selected' : ''}>Surgeon</option>
                                            <option value="NEUROLOGIST" ${user.role == 'NEUROLOGIST' ? 'selected' : ''}>Neurologist</option>
                                            <option value="GENERAL_PRACTITIONER" ${user.role == 'GENERAL_PRACTITIONER' ? 'selected' : ''}>General Practitioner</option>
                                            <option value="THERAPIST" ${user.role == 'THERAPIST' ? 'selected' : ''}>Therapist</option>
                                            <option value="PEDIATRICIAN" ${user.role == 'PEDIATRICIAN' ? 'selected' : ''}>Pediatrician</option>
                                            <option value="OTOLARYNGOLOGY" ${user.role == 'OTOLARYNGOLOGY' ? 'selected' : ''}>Otolaryngology</option>
                                            <option value="CARDIOLOGIST" ${user.role == 'CARDIOLOGIST' ? 'selected' : ''}>Cardiologist</option>
                                            <option value="RHEUMATOLOGIST" ${user.role == 'RHEUMATOLOGIST' ? 'selected' : ''}>Rheumatologist</option>
                                            <option value="ENDOCRINOLOGIST" ${user.role == 'ENDOCRINOLOGIST' ? 'selected' : ''}>Endocrinologist</option>
                                            <option value="ANESTHESIOLOGIST" ${user.role == 'ANESTHESIOLOGIST' ? 'selected' : ''}>Anesthesiologist</option>
                                            <option value="GASTROENTEROLOGIST" ${user.role == 'GASTROENTEROLOGIST' ? 'selected' : ''}>Gastroenterologist</option>
                                            <option value="ALLERGIST" ${user.role == 'ALLERGIST' ? 'selected' : ''}>Allergist</option>
                                        </select>

                                    </div>

                                    <div class="form-group">
                                        <label for="firstname${user.id}">First Name</label>
                                        <input name="firstname" type="text" class="form-control" id="firstname${user.id}"
                                               value="${user.firstname}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastname${user.id}">Last Name</label>
                                        <input name="lastname" type="text" class="form-control" id="lastname${user.id}"
                                               value="${user.lastname}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="username${user.id}">Username</label>
                                        <input name="username" type="text" class="form-control" id="username${user.id}"
                                               value="${user.username}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password${user.id}">Password</label>
                                        <input name="password" type="password" class="form-control" id="password${user.id}"
                                               value="${user.password}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email${user.id}">Email</label>
                                        <input name="email" type="email" class="form-control" id="email${user.id}"
                                               value="${user.email}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="age${user.id}">Age</label>
                                        <input name="age" type="number" class="form-control" id="age${user.id}"
                                               value="${user.age}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender${user.id}">Gender</label>
                                        <select name="gender" class="form-control" id="gender${user.id}" required>
                                            <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
                                            <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneNumber${user.id}">Phone Number</label>
                                        <input name="phoneNumber" type="text" class="form-control" id="phoneNumber${user.id}"
                                               value="${user.phoneNumber}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address${user.id}">Address</label>
                                        <input name="address" type="text" class="form-control" id="address${user.id}"
                                               value="${user.address}" required>
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
