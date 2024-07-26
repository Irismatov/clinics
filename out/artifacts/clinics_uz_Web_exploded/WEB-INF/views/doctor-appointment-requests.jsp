<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lokin
  Date: 7/25/2024
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Appointment Requests</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .appointment-card {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .appointment-card strong {
            display: block;
            font-size: 1.2em;
            margin-bottom: 5px;
        }
        .btn-group {
            margin-top: 10px;
        }
        .reason-input {
            display: none;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Doctor Appointment Requests</h1>
    <c:forEach items="${appointmentRequests}" var="appointment" varStatus="loop">
        <div class="appointment-card">
            <strong>User: ${appointment.user_fio}</strong>
            <strong>Start Time: ${appointment.start_time}</strong>
            <strong>End Time: ${appointment.end_time}</strong>
            <div class="btn-group">
                <form method="post" action="${pageContext.request.contextPath}/appointment/requests" style="display:inline;">
                    <input type="hidden" name="appointment_id" value="${appointment.appointment_id}">
                    <input type="hidden" name="action" value="1">
                    <button type="submit" class="btn btn-success">Accept</button>
                </form>
                <form method="post" action="${pageContext.request.contextPath}/appointment/requests" style="display:inline;">
                    <input type="hidden" name="appointment_id" value="${appointment.appointment_id}">
                    <input type="hidden" name="action" value="0">
                    <button type="button" id="rejectButton-${appointment.appointment_id}" class="btn btn-danger" onclick="showReasonInput('${appointment.appointment_id}')">Reject</button>
                    <div id="reasonDiv-${appointment.appointment_id}" class="reason-input">
                        <input type="text" id="reasonInput-${appointment.appointment_id}" name="reason" placeholder="What is the reason" required>
                        <button type="submit" class="btn btn-danger">Finish</button>
                    </div>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    function showReasonInput(appointmentId) {
        document.getElementById("reasonDiv-" + appointmentId).style.display = "block";
        document.getElementById("rejectButton-" + appointmentId).style.display = "none";

    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
