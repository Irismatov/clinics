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
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .top-right-button:hover {
            background-color: #45a049;
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

        .disabled-button {
            background-color: #ccc;
            cursor: not-allowed;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Accordion styles */
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 10px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: background-color 0.4s ease;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            /*display: none;*/
            overflow: hidden;

            background-color: white;
        }
        .prescription{
            padding-bottom: 20px;
        }
        .input-container{
            position:relative;
            margin-bottom:25px;
        }
        .input-container label{
            position:absolute;
            top:0px;
            left:0px;
            font-size:16px;
            color:#fff;
            pointer-event:none;
            transition: all 0.5s ease-in-out;
        }
        .input-container input{
            border:0;
            border-bottom:1px solid #555;
            background:transparent;
            width:100%;
            padding:8px 0 5px 0;
            font-size:16px;
            color:#fff;
        }
        .input-container input:focus{
            border:none;
            outline:none;
            border-bottom:1px solid #e74c3c;
        }
        .btn{
            color:#fff;
            background-color: #23d5ab;
            outline: none;
            border: 0;
            color: #fff;
            padding:10px 20px;
            text-transform:uppercase;
            margin-top:50px;
            border-radius:2px;
            cursor:pointer;
            position:relative;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Стили для кнопок */
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        /* Стили для панели рецептов */
        .panel {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            margin-top: 10px;
            background-color: #f1f1f1;
        }
        /*.btn:after{
            content:"";
            position:absolute;
            background:rgba(0,0,0,0.50);
            top:0;
            right:0;
            width:100%;
            height:100%;
        }*/
        .input-container input:focus ~ label,
        .input-container input:valid ~ label{
            top:-12px;
            font-size:12px;

        }
    </style>


    <script>
        function showDiagnosisButton() {
            console.log("Diagnosis button shown"); // Отладочный вывод
            document.getElementById('createDiagnosisSection').classList.remove('hidden');
            document.getElementById('createDiagnosisButton').disabled = false;
        }

        document.addEventListener('DOMContentLoaded', function() {
            console.log("DOM fully loaded and parsed");

            document.getElementById('createDiagnosisButton').addEventListener('click', function() {
                console.log("Create Diagnosis button clicked");
                document.getElementById('diagnosisModal').style.display = 'block';
            });


            document.querySelector('.modal .close').addEventListener('click', function() {
                console.log("Modal close button clicked");
                document.getElementById('diagnosisModal').style.display = 'none';
            });

            window.addEventListener('click', function(event) {
                if (event.target == document.getElementById('diagnosisModal')) {
                    console.log("Outside modal clicked"); // Отладочный вывод
                    document.getElementById('diagnosisModal').style.display = 'none';
                }
            });


            document.getElementById('addPrescription').addEventListener('click', function() {
                console.log("Add Prescription clicked");
                var panel = document.getElementById('prescriptionPanel');
                var newPrescription = document.createElement('div');
                newPrescription.className = 'prescription';
                newPrescription.innerHTML = `
                    <label for="medicine">Medicine:</label>
                    <input type="text" name="medicine" class="input-container" required><br>
                    <label for="dosage">Dosage:</label>
                    <input type="text" name="dosage" class="input-container" required><br>
                    <label for="duration">Duration:</label>
                    <input type="text" name="duration" class="input-container" required><br>
                `;
                panel.appendChild(newPrescription);
            });

            document.getElementById('submitDiagnosis').addEventListener('click', function() {
                console.log("Submit Diagnosis clicked");
                var diagnosisForm = document.getElementById('diagnosisForm');
                diagnosisForm.submit();
            });
        });
    </script>
</head>
<body>

<button class="top-right-button btn" onclick="showDiagnosisButton()">Start</button>

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
    <button id="createDiagnosisButton" class="btn" disabled>Create diagnosis</button>
</div>

<!-- Modal -->
<div id="diagnosisModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Create Diagnosis</h2>
        <form id="diagnosisForm" action="${pageContext.request.contextPath}/accepted-requests/createDiagnosis" method="post">
            <input type="hidden" name="appointmentId" value="${appointment.id}">
            <label for="diagnosisDescription">Diagnosis Description:</label>
            <input type="text" id="diagnosisDescription" name="diagnosisDescription" required><br>
            <label for="hospitalization">Hospitalization Recommended:</label>
            <select id="hospitalization" name="hospitalization" required>
                <option value="true">Yes</option>
                <option value="false">No</option>
            </select><br>
            <button type="button" id="addPrescription" class="btn">Add Prescription</button>
            <div id="prescriptionPanel" class="panel"></div>
            <button type="button" id="submitDiagnosis" class="btn">Submit Diagnosis</button>
        </form>
    </div>
</div>

</body>
</html>
