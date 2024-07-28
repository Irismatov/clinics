<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            overflow-x: hidden;
        }

        .search-button {
            background-color: transparent;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            font-size: 27px;
            padding: 7px;
            transition: background-color 0.3s ease;
        }

        .active {
            border-bottom: 2px solid white;
        }

        .button_hover {
            transition: background-color 0.3s ease;
            background-color: rgba(255, 255, 255, 0.301);
            border-radius: 8px;
            text-align: center;
            width: 140px;
            height: 40px;
            font-size: 14px;
            border: none;
            padding: 7px;
            border: 1px solid white;
            color: white;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.295) !important;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 2;
            color: white !important;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
        }

        .nav {
            color: white !important;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .slider {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            display: none;
            align-items: center;
            background-size: cover;
            background-position: center;
            transition: opacity 1s ease-in-out;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .slide .text h1 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            color: white;
            max-width: 400px;
        }

        .slide .text button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 7px;
        }

        .active {
            display: flex;
            opacity: 1;
        }

        .fade-out {
            opacity: 0;
        }

        li {
            list-style: none;
            cursor: pointer;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .login {
            border-radius: 10px;
            text-align: center;
            border: none;
            color: white;
            background-color: #59d4fb;
            padding: 10px;
            width: 100px;
        }

        .text {
            padding: 30px;
            margin-top: 250px;
            margin-left: 150px;
            position: relative;
            z-index: 1;
        }

        .scrollable-div {
            width: 100%;
            height: 400px;
            overflow: auto;
        }

        .scrollable-div::-webkit-scrollbar {
            display: none;
        }

        table {
            width: 100%;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
            border-radius: 20px;
            color: wheat;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .action-buttons button {
            margin-right: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .edit-button {
            background-color: #4caf50;
            color: white;
        }

        .delete-button {
            background-color: #f44336;
            color: white;
        }

        .details-button {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<main>
    <div class="slider">
        <header class="header">
            <div class="d-flex justify-content-between align-items-center pt-3">
                <ul class="d-flex gap-5">
                    <li>Location: 121 Wallstreet Street, NY, USA</li>
                    <li>Email: info@beclinic.com</li>
                </ul>
                <ul class="d-flex gap-3 pe-4 align-items-center">
                    <li>For emergency cases: 800 123 45 67</li>
                    <button class="login">Login</button>
                    <i style="cursor: pointer; font-size: 25px;" class="fa-solid fa-magnifying-glass"></i>
                </ul>
            </div>
            <hr/>
            <nav class="nav">
                <ul class="d-flex gap-3 align-items-center">
                    <img src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2021/12/logo.png" alt=""/>
                    <li data-menu="home" class="active">Home</li>
                    <li data-menu="doctors">Doctors</li>
                    <li data-menu="appointments">My appointments</li>
                    <li data-menu="balance">Balance</li>
                    <li data-menu="profile">My profile</li>
                    <li data-menu="diagnosis">My diagnosis</li>
                </ul>
                <ul class="pe-4">
                    <button class="button_hover">APPOINTMENT</button>
                </ul>
            </nav>
        </header>
        <div class="slide active">
            <img src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-1.jpg" alt="Doctor Image 1"/>
        </div>
        <div class="slide">
            <img src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-2.jpg" alt="Doctor Image 2"/>
        </div>
        <div class="slide">
            <img src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-3.jpg" alt="Doctor Image 3"/>
        </div>

        <!-- rasm ustidagi table -->
        <div class="text">
            <div class="scrollable-div">
                <table id="data-table">
                    <thead>
                    <tr>
                        <th>Img</th>
                        <th>FIO</th>
                        <th>Start time</th>
                        <th>End time</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${data}">
                        <tr>
                            <td><img src="${item.img}" width="50" height="50"/></td>
                            <td>${item.doctor_fio}</td>
                            <td>${item.appointment_start}</td>
                            <td>${item.appointment_end}</td>
                            <td class="action-buttons">
                                <c:choose>
                                    <c:when test="${item.status == 'FINISHED'}">
                                        <button class="details-button">Details</button>
                                    </c:when>
                                    <c:when test="${item.status == 'BOOKED'}">
                                        <button class="edit-button">Edit</button>
                                        <button class="delete-button">Delete</button>
                                    </c:when>
                                    <c:when test="${item.status == 'IGNORED'}">
                                        <strong>Doctor could not see the request</strong>
                                    </c:when>
                                    <c:when test="${item.status == 'REJECTED'}">
                                        <strong>Your booking request was rejected</strong>
                                    </c:when>
                                    <c:when test="${item.status == 'ACCEPTED'}">
                                        <strong>Your booking request was accepted</strong>
                                    </c:when>
                                    <c:when test="${item.status == 'CANCELLED'}">
                                        <strong>You cancelled the booking</strong>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <h1>${jsonData}</h1>
</main>

<script>
    let currentIndex = 0;
    const slides = document.querySelectorAll(".slide");

    function showNextSlide() {
        slides[currentIndex].classList.remove("active");
        slides[currentIndex].classList.add("fade-out");
        currentIndex = (currentIndex + 1) % slides.length;
        slides[currentIndex].classList.add("active");
        slides[currentIndex].classList.remove("fade-out");
    }

    setInterval(showNextSlide, 3000);
</script>
</body>
</html>
