<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 22.07.2024
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Specialties</title>

    <style>
        .doctor-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 16px;
            margin: 16px;
            display: inline-block;
            width: calc(33% - 40px); /* 3 карточки в ряд */
            vertical-align: top;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .select-button {
            background-color: #4CAF50; /* Зеленый цвет */
            color: white; /* Белый текст */
            border: none; /* Без границы */
            padding: 10px 20px; /* Отступы */
            text-align: center; /* Выравнивание текста */
            text-decoration: none; /* Без подчеркивания */
            display: inline-block; /* Выравнивание кнопки */
            font-size: 16px; /* Размер шрифта */
            margin: 4px 2px; /* Отступы */
            cursor: pointer; /* Курсор при наведении */
            border-radius: 4px; /* Скругление углов */
        }
    </style>

</head>
<body>

<div style="display: flex; flex-wrap: wrap;">
    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ALLERGIST">ALLERGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=GASTROENTEROLOGIST">GASTROENTEROLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=RHEUMATOLOGIST">RHEUMATOLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ANESTHESIOLOGIST">ANESTHESIOLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ENDOCRINOLOGIST">ENDOCRINOLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=CARDIOLOGIST">CARDIOLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=OTOLARYNGOLOGIST">OTOLARYNGOLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=PEDIATRICIAN">PEDIATRICIAN</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=THERAPIST">THERAPIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=NEUROLOGIST">NEUROLOGIST</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=SURGEON">SURGEON</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=DENTIST">DENTIST</a>
    </button>

</div>

<h2> Doctors by specialty: ${param.specialty}</h2>

<c:choose>
    <c:when test="${not empty doctors}">
        <div style="display: flex; flex-wrap: wrap;">
            <c:forEach var="doctor" items="${doctors}">
                <div class="doctor-card">
                    <p>Firstname: ${doctor.firstname} ${doctor.lastname}</p>
                    <p>Age: ${doctor.age}</p>
                    <p>Email: ${doctor.email}</p>

                    <form action="${pageContext.request.contextPath}/appointment/select-doctor" method="post" style="display:inline;">
                        <input type="hidden" name="doctorId" value="${doctor.id}">
                        <button type="submit" class="select-button">Select</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <div>No doctors available for this specialty</div>
    </c:otherwise>
</c:choose>

<form action="${pageContext.request.contextPath}/appointment/show" method="post">
    <button type="submit" class="back-link">
        <span>Back</span>
    </button>
</form>

</body>
</html>

