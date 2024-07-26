<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Specialties</title>
    <style>
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 10px;
        }
        .doctor-card {
            border-radius: 8px;
            padding: 16px;
            display: inline-block;
            width: 300px;
            vertical-align: top;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .doctor-card:hover {
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
            transform: translateY(-5px);
            opacity: 1;
            transition: 0.3s ease-in-out;
            outline: none;
        }
        .select-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        .but_hover {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
            opacity: 1;
        }
        .but_hover:hover {
            background-color: #45a049;
            opacity: 0.5;
            border: none;
            outline: none;
        }
        a {
            text-decoration: none;
            color: white;
            font-size: 15px;
        }
        .back-link {
            color: white;
            background-color: red;
            border: none;
            padding: 10px;
            margin-top: 10px;
            width: 70px;
            border-radius: 7px;
        }
    </style>
</head>
<body>
<div class="container">
    <div style="display: flex; flex-wrap: wrap;">
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ALLERGIST">ALLERGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=GASTROENTEROLOGIST">GASTROENTEROLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=RHEUMATOLOGIST">RHEUMATOLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ANESTHESIOLOGIST">ANESTHESIOLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ENDOCRINOLOGIST">ENDOCRINOLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=CARDIOLOGIST">CARDIOLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=OTOLARYNGOLOGIST">OTOLARYNGOLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=PEDIATRICIAN">PEDIATRICIAN</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=THERAPIST">THERAPIST</a>
        </button>
        <button class="but_hover">

            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=NEUROLOGIST">NEUROLOGIST</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=SURGEON">SURGEON</a>
        </button>
        <button class="but_hover">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=DENTIST">DENTIST</a>
        </button>
    </div>
    <h2>Doctors by specialty: ${param.specialty}</h2>
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
</div>
</body>
</html>
