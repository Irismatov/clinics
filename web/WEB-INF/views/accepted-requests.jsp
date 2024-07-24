<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accepted Requests</title>
    <style>
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            transition: 0.4s;
            border-bottom: 1px solid #ddd;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow: hidden;
            border-top: 1px solid #ddd;
        }

        .panel p {
            margin: 0;
            padding: 10px 0;
        }

        .btn-select {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-select:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Accepted Appointments</h1>
<c:forEach var="appointment" items="${appointments}">
    <button class="accordion">
            ${appointment.patient.firstname} ${appointment.patient.lastname}
        <br>
        <fmt:formatDate value="${appointment.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /> -
        <fmt:formatDate value="${appointment.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />
    </button>
    <div class="panel">
        <p>Patient First Name: ${appointment.patient.firstname}</p>
        <p>Patient Last Name: ${appointment.patient.lastname}</p>
        <p>Start Time: <fmt:formatDate value="${appointment.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
        <p>End Time: <fmt:formatDate value="${appointment.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
        <form action="${pageContext.request.contextPath}/accepted-requests/selected-appointment" method="post" style="display:inline;">
            <input type="hidden" name="appointment" value="${appointment}">
            <button type="submit" class="select-button">SELECT</button>
        </form>
    </div>
</c:forEach>

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
</script>
</body>
</html>

