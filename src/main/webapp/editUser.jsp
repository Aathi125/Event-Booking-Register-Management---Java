<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Booking</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .booking-form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            width: 400px;
        }
        .booking-form h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .booking-form label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
        }
        .booking-form input[type="text"],
        .booking-form input[type="email"],
        .booking-form input[type="tel"],
        .booking-form input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .booking-form input[type="text"]:focus,
        .booking-form input[type="email"]:focus,
        .booking-form input[type="tel"]:focus,
        .booking-form input[type="number"]:focus {
            border-color: #28a745;
            outline: none;
        }
        .booking-form input[type="submit"] {
            background-color: #28a745;
            color: white;
            font-size: 18px;
            font-weight: 600;
            padding: 12px 0;
            border: none;
            border-radius: 6px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .booking-form input[type="submit"]:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;  /* increased spacing */
            color: #333;
            text-decoration: none;
            font-weight: 600;
        }
        .back-link:hover {
            color: #28a745;
        }
    </style>
</head>
<body>
    <form class="booking-form" action="user" method="POST">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="${user.id}" />

        <h1>Edit Booking</h1>

        <label for="username">Name:</label>
        <input type="text" id="username" name="username" value="${user.username}" required />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required />

        <label for="contact">Contact Number:</label>
        <input type="tel" id="contact" name="contact" value="${user.contact}" required pattern="[0-9]{7,15}" title="Please enter a valid contact number" />

        <label for="ticket">Seat Number:</label>
        <input type="number" id="ticket" name="ticket" value="${user.ticket}" min="1" required />

        <input type="submit" value="Update" />
    </form>
	
</body>
</html>
