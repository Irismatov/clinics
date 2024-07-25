<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Appointment</title>

    <style>
        .top-right-button {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 10px 20px;
            background-color: #4CAF50; /* Зеленый цвет */
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .top-right-button:hover {
            background-color: #45a049; /* Темнее при наведении */
        }

        .appointment-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        .appointment-table th, .appointment-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .appointment-table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .appointment-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .appointment-table tr:hover {
            background-color: #f1f1f1;
        }

        .hidden {
            display: none;
        }

        createDiagnosisButton {
              padding: 10px 20px;
              background-color: #4CAF50; /* Green background */
              color: white; /* White text */
              border: none;
              cursor: pointer;
              border-radius: 5px; /* Rounded corners */
              margin-top: 20px; /* Space above the button */
          }

        createDiagnosisButton:hover {
              background-color: #45a049; /* Darker green on hover */
          }

        .disabled-button {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>

    <script>
        function showDiagnosisButton() {
            console.log("Start button clicked");
            document.getElementById('createDiagnosisSection').classList.remove('hidden');
            document.getElementById('createDiagnosisButton').disabled = false;
        }
    </script>
</head>
<body>

<button class="top-right-button" onclick="showDiagnosisButton()">Start</button>

<h2>Selected Appointment Details</h2>
<table class="appointment-table">
    <tr>
        <th>Firstname</th>
        <td>${appointment.patient.firstname}</td>
    </tr>
    <tr>
        <th>Lastname</th>
        <td>${appointment.patient.lastname}</td>
    </tr>
    <tr>
        <th>Age</th>
        <td>${appointment.patient.age}</td>
    </tr>
    <tr>
        <th>Gender</th>
        <td>${appointment.patient.gender}</td>
    </tr>
    <tr>
        <th>Address</th>
        <td>${appointment.patient.address}</td>
    </tr>
    <tr>
        <th>Email</th>
        <td>${appointment.patient.email}</td>
    </tr>
    <tr>
        <th>Phone number</th>
        <td>${appointment.patient.phoneNumber}</td>
    </tr>
</table>

<div id="createDiagnosisSection" class="hidden">
    <button id="createDiagnosisButton" disabled>Create diagnosis</button>
</div>

</body>
</html>
