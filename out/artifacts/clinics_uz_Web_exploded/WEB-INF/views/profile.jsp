<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 26.07.2024
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>User Profile</h3>
                </div>
                <div class="card-body">
                    <form id="updateForm" action="${pageContext.request.contextPath}/user-profile/showPic" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${user.id}">


                        <c:if test="${user.role != 'PATIENT'}">
                            <div class="file-input-container">
                                <label for="image">Picture:</label><br>
                                <input type="file" id="image" name="image">
                            </div>
                        </c:if>


                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
