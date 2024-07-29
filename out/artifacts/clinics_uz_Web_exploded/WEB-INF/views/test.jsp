<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="data" scope="request" type="java.util.List<uz.pdp.DTO.AppointmentRequestDTO>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            overflow-x: hidden;
        }

        .bg_sedf {
            background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
            border-radius: 20px;
            animation: GradientBackground 10s ease infinite;
        }

        @keyframes GradientBackground {
            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }

        #time-remaining {
            font-size: 1.2em;
            color: #333;
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

        .nav-item.active {
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
            margin-left: 30px;
            position: relative;
            z-index: 1;
        }
        .scrollable-div {
            position: relative;
            width: 100%;

            height: 500px;
            overflow: auto;
            background-color: rgba(181, 179, 179, 0.849);
            border-radius: 20px;
            -webkit-box-shadow: -1px 3px 20px -4px rgba(34, 60, 80, 0.2);
            -moz-box-shadow: -1px 3px 20px -4px rgba(34, 60, 80, 0.2);
            box-shadow: -1px 3px 20px -4px rgba(34, 60, 80, 0.2);
        }
        .scrollable-div::-webkit-scrollbar {
            display: none;
        }
        table {
            width: 100%;
            margin: 10px 80px;
            font-size: 18px;
            text-align: left;
            padding: 30px;
            border-collapse: separate;
            border-spacing: 0 15px;
            color: white !important;
        }
        .action-buttons button {
            margin-right: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button {
        }

        .edit-button {
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
            border-radius: 12px;
            transition: background-color 0.3s ease, transform 0.3s ease,
            box-shadow 0.3s ease;
        }

        .delete-button {
            background-color: #5a60fd;
            color: white;
            border: none;

            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
            transition: background-color 0.3s ease, transform 0.3s ease,
            box-shadow 0.3s ease;
        }

        .details-button {
            background-color: #007bff;
            color: white;
            border: none;

            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
            transition: background-color 0.3s ease, transform 0.3s ease,
            box-shadow 0.3s ease;
        }

        .edit-button:hover {
            transform: translateY(-5px) scale(1.05) !important;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2) !important;
        }

        .details-button:hover {
            transform: translateY(-5px) scale(1.05) !important;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2) !important;
        }

        .delete-button:hover {
            transform: translateY(-5px) scale(1.05) !important;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2) !important;
        }
        @keyframes buttonPress {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(0.95);
            }
            100% {
                transform: scale(1);
            }
        }

        .button:active {
            animation: buttonPress 0.2s ease;
        }

        .tab_img {
            border-radius: 50%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }


        .tab_img:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<main>
    <div class="slider">
        <header class="header">
            <div class="d-flex justify-content-between align-items-center pt-3">
                <ul class="d-flex gap-5">
                    <li>Location: 121 Wallstreet Street, NY , USA</li>
                    <li>Email: info@beclinic.com</li>
                </ul>
                <ul class="d-flex gap-3 pe-4 align-items-center">
                    <li>For emergency cases: 800 123 45 67</li>
                    <button class="login">Login</button>
                    <i
                            style="cursor: pointer; font-size: 25px;"
                            class="fa-solid fa-magnifying-glass"
                    ></i>
                </ul>
            </div>
            <hr />
            <nav class="nav">
                <ul class="d-flex gap-3 align-items-center">
                    <img
                            src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2021/12/logo.png"
                            alt=""
                    />
                    <li data-menu="home" class="nav-item active">Home</li>
                    <li data-menu="doctors" class="nav-item">Doctors</li>
                    <li data-menu="appointments" class="nav-item">My appointments</li>
                    <li data-menu="balance" class="nav-item">Balance</li>
                    <li data-menu="profile" class="nav-item">My profile</li>
                    <li data-menu="diagnosis" class="nav-item">My diagnosis</li>
                </ul>
                <ul class="pe-4">
                    <button class="button_hover">My appointment</button>
                </ul>
            </nav>
        </header>
        <div class="slide active">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-1.jpg"
                    alt="Doctor Image 1"
            />
        </div>
        <div class="slide">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-2.jpg"
                    alt="Doctor Image 2"
            />
        </div>
        <div class="slide">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-3.jpg"
                    alt="Doctor Image 3"
            />
        </div>

        <!-- rasm ustidagi table -->
        <div class="text">
            <div class="scrollable-div">
                <table id="data-table">
                    <tr>
                        <th>Img</th>
                        <th>FIO</th>
                        <th>Start time</th>
                        <th>End time</th>
                        <th>Actions</th>
                    </tr>
                    <tbody>
                    <c:forEach var="item" items="${data}">
                        <tr>
                            <c:choose>
                                <c:when test="${item.img == null}">
                                    <td><img src="https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg" width="50" height="50"></td>
                                </c:when>
                                <c:otherwise>
                                     <td><img src="${pageContext.request.contextPath}/${item.img}" width="50" height="50"/></td>
                                </c:otherwise>
                            </c:choose>

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
</main>

<!-- bootstrap modal edit -->


<!-- bootstrap modal edit -->
<div
        class="modal fade"
        id="editModal"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog bg_sedf">
        <div
                class="modal-content bg-gradient-to-r from-blue-400 via-white to-blue-400 transform transition-transform duration-500 hover:scale-105 shadow-xl rounded-lg bg_sedf"
        >
            <div class="modal-header border-b border-gray-200">
                <h1
                        class="modal-title fs-5 text-xl font-semibold text-gray-800"
                        id="staticBackdropLabel"
                >
                    Edit Doctor
                </h1>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <form id="editDoctorForm">
                    <div class="mb-3">
                        <label for="startTime" class="form-label text-gray-700"
                        >Start Time</label
                        >
                        <input
                                type="time"
                                class="form-control border-gray-300 rounded-lg shadow-sm"
                                id="startTime"
                        />
                    </div>
                    <div class="mb-3">
                        <label for="endTime" class="form-label text-gray-700"
                        >End Time</label
                        >
                        <input
                                type="time"
                                class="form-control border-gray-300 rounded-lg shadow-sm"
                                id="endTime"
                        />
                    </div>
                </form>
            </div>
            <div class="modal-footer border-t border-gray-200">
                <button
                        type="button"
                        class="btn btn-secondary bg-gray-500 text-white rounded-lg shadow-md hover:bg-gray-600 transition duration-200"
                        data-bs-dismiss="modal"
                >
                    Cancel
                </button>
                <button
                        type="button"
                        class="btn btn-primary bg-blue-500 text-white rounded-lg shadow-md hover:bg-blue-600 transition duration-200"
                        id="saveChanges"
                >
                    Save
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Global o'zgaruvchilar
    let editIndex = -1;

    // Doktorlar ro'yxati


    /*const data = [
        {
            img:
                "https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg",
            fio: "Ali",
            startTime: "09:00",
            endTime: "10:00",
            status: "BOOKED",
        },
        {
            img:
                "https://previews.123rf.com/images/nikiteev/nikiteev1610/nikiteev161000085/64736863-doctor-man-icon-flat-design-illustration.jpg",
            fio: "Bobur",
            startTime: "10:00",
            endTime: "11:00",
            status: "ACCEPTED",
        },
        {
            img:
                "https://thumbs.dreamstime.com/b/young-female-doctor-profile-icon-flat-style-illustration-portrait-woman-wearing-surgical-mask-medical-176256306.jpg",
            fio: "Madina",
            startTime: "11:00",
            endTime: "12:00",
            status: "FINISHED",
        },
        {
            img:
                "https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg",
            fio: "Kamron",
            startTime: "12:00",
            endTime: "13:00",
            status: "BOOKED",
        },
        {
            img:
                "https://previews.123rf.com/images/nikiteev/nikiteev1610/nikiteev161000085/64736863-doctor-man-icon-flat-design-illustration.jpg",
            fio: "Sardor",
            startTime: "13:00",
            endTime: "14:00",
            status: "ACCEPTED",
        },
        {
            img:
                "https://thumbs.dreamstime.com/b/young-female-doctor-profile-icon-flat-style-illustration-portrait-woman-wearing-surgical-mask-medical-176256306.jpg",
            fio: "Nodira",
            startTime: "14:00",
            endTime: "15:00",
            status: "FINISHED",
        },
        {
            img:
                "https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg",
            fio: "Zafar",
            startTime: "15:00",
            endTime: "16:00",
            status: "BOOKED",
        },
        {
            img:
                "https://previews.123rf.com/images/nikiteev/nikiteev1610/nikiteev161000085/64736863-doctor-man-icon-flat-design-illustration.jpg",
            fio: "Dilshod",
            startTime: "16:00",
            endTime: "17:00",
            status: "ACCEPTED",
        },
        {
            img:
                "https://thumbs.dreamstime.com/b/young-female-doctor-profile-icon-flat-style-illustration-portrait-woman-wearing-surgical-mask-medical-176256306.jpg",
            fio: "Maksuda",
            startTime: "17:00",
            endTime: "18:00",
            status: "FINISHED",
        },
        {
            img:
                "https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg",
            fio: "Shodiyor",
            startTime: "18:00",
            endTime: "19:00",
            status: "BOOKED",
        },
    ];*/

    const data = ${data}

    // bootstrap modal controls
    const editModal = new bootstrap.Modal("#editModal", {
        keyboard: false,
    });

    // Modalni ochish va ma'lumotlarni yuklash
    function openEditModal(index) {
        const item = data[index];
        document.getElementById("startTime").value = item.startTime;
        document.getElementById("endTime").value = item.endTime;
        editIndex = index; // Tanlangan indeksni saqlash
        editModal.show(); // Modalni ochish
    }


    // Save tugmasini bosganda ma'lumotlarni yangilash
    document.getElementById("saveChanges").addEventListener("click", () => {
        if (editIndex >= 0) {
            const updatedItem = {
                startTime: document.getElementById("startTime").value,
                endTime: document.getElementById("endTime").value,
                status: data[editIndex].status, // Statusni o'zgartirmaymiz
            };

            data[editIndex] = updatedItem; // Ma'lumotni yangilash
            updateTable(); // Jadvalni yangilash
            editModal.hide(); // Jadvalni yopish
        }
    });

    // Jadvalni yangilash
    function updateTable() {
        const dataTable = document.querySelector("#data-table tbody");
        dataTable.innerHTML = ""; // Jadvalni tozalash
        data.forEach((item, index) => {
            const row = createDataRow(item, index);
            dataTable.appendChild(row);
        });
    }

    // Jadval qatorini yaratish
    function createDataRow(item, index) {
        const row = document.createElement("tr");

        let actionsHTML = "";
        if (item.status === "ACCEPTED") {
            const timeLeft = getTimeLeft(item.startTime);
            actionsHTML = `<td colspan="2">${timeLeft}</td>`;
        } else if (item.status === "FINISHED") {
            actionsHTML = `<td><button class="btn btn-info get-details-button" onclick="getDetails(${index})">Get Details</button></td>`;
        } else {
            actionsHTML = `
          <td class="action-buttons">
            <button class="btn btn-warning edit-button" onclick="openEditModal(${index})">Change time</button>
            <button class="btn btn-danger delete-button" onclick="deleteRow(${index})">Cancel</button>
          </td>`;
        }

        row.innerHTML = `
          <td><img class="tab_img" src="${item.img}" width="50" height="50" /></td>
          <td>${item.fio}</td>
          <td>${item.startTime}</td>
          <td>${item.endTime}</td>
          ${actionsHTML}
        `;
        return row;
    }

    // Vaqtni hisoblash
    function getTimeLeft(startTime) {
        const now = new Date();
        const [hours, minutes] = startTime.split(":").map(Number);
        const appointmentTime = new Date(
            now.getFullYear(),
            now.getMonth(),
            now.getDate(),
            hours,
            minutes
        );
        const timeLeftMs = appointmentTime - now;
        if (timeLeftMs < 0) return "Qabul tugadi";

        const hoursLeft = Math.floor(timeLeftMs / (1000 * 60 * 60));
        const minutesLeft = Math.floor(
            (timeLeftMs % (1000 * 60 * 60)) / (1000 * 60)
        );

        return `${hoursLeft}h ${minutesLeft}m`;
    }

    // Qatorni o'chirish
    function deleteRow(index) {
        data.splice(index, 1); // Ma'lumotlar ro'yxatidan o'chirish
        updateTable(); // Jadvalni yangilash
    }
    // Detallarni olish funksiyasi
    function getDetails(index) {
        const item = data[index];
        alert(
            `Details for ${item.fio}:\nStart Time: ${item.startTime}\nEnd Time: ${item.endTime}`
        );
    }

    // Navbar menu activ qilish
    document.querySelectorAll(".nav-item").forEach((item) => {
        item.addEventListener("click", () => {
            document.querySelector(".nav-item.active").classList.remove("active");
            item.classList.add("active");
        });
    });

    // Initial table load
    updateTable();
</script>
</body>
</html>
