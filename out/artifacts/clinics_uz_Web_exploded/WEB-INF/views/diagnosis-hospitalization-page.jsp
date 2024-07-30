<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diagnosis Details</title>
    <style>
        .diagnosis-details {
            padding: 20px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .diagnosis-description {
            font-size: 20px;
            font-weight: bold;
        }

        .prescriptions {
            margin-top: 20px;
        }

        .prescription {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .hospitalization-recommendation {
            margin-top: 30px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            margin-right: 10px;
        }

        .btn-hospitalization {
            background-color: #4CAF50;
            color: white;
        }

        .btn-hospitalization:hover {
            background-color: #45a049;
        }

        .btn-reject {
            background-color: #f44336;
            color: white;
        }

        .btn-reject:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
<c:if test="${empty diagnoses}">
    <h1>The doctor hasn't made a diagnosis yet</h1>
</c:if>
<h1>
    ${successMessage}
</h1>

<c:if test="${not empty diagnoses}">
    <h2>Diagnosis and Prescription Details</h2>


    <c:forEach var="diagnosis" items="${diagnoses}">
        <div class="diagnosis-details">
            <div class="diagnosis-description">Description: ${diagnosis.description}</div>
            <div class="prescriptions">
                <h3>Prescriptions:</h3>
                <c:forEach var="prescription" items="${diagnosis.prescriptions}">
                    <div class="prescription">
                        <div>Medicine: ${prescription.medicine}</div>
                        <div>Dosage: ${prescription.dosage}</div>
                        <div>Duration: ${prescription.duration}</div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${diagnosis.hospitalization}">
                <div class="hospitalization-recommendation">
                    <c:if test="${diagnosis.agreedToHospitalization == null}">
                        The doctor recommends hospitalization.
                        <form method="post">
                            <input type="hidden" name="diagnosisId" value="${diagnosis.id}">
                            <input type="hidden" name="decision" value="accept">
                            <button type="submit" formaction="${pageContext.request.contextPath}/create-room/accept"
                                    class="btn btn-hospitalization">Accept hospitalization
                            </button>
                        </form>
                        <div style="margin-bottom: 20px; padding: 10px; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9;">
                            <strong>${failMessage}</strong>
                        </div>
                        <form method="post">
                            <input type="hidden" name="diagnosisId" value="${diagnosis.id}">
                            <input type="hidden" name="decision" value="reject">
                            <button type="submit" formaction="${pageContext.request.contextPath}/create-room/reject"
                                    class="btn btn-reject">Refuse hospitalization
                            </button>
                        </form>
                    </c:if>
                </div>
            </c:if>
        </div>
    </c:forEach>
</c:if>

</body>
</html>


