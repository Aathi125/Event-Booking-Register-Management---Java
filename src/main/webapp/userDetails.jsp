<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Event Details</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            padding: 40px 20px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
            text-align: center; /* Center contents */
        }
        h1 {
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
            margin-bottom: 25px; /* Space below table before buttons */
            text-align: left; /* Align table text left */
        }
        td {
            padding: 12px 10px;
            border-bottom: 1px solid #ddd;
            vertical-align: top;
        }
        td:first-child {
            font-weight: 600;
            width: 40%;
            color: #333;
        }
        td:last-child {
            color: #555;
        }
        .btn-pay {
            background-color: #28a745;
            color: white;
            font-weight: 600;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 15px;
            width: 100%; /* full width */
            max-width: 300px; /* limit max width */
            transition: background-color 0.3s;
        }
        .btn-pay:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            font-weight: 600;
            color: #28a745;
            text-decoration: none;
            transition: color 0.3s;
        }
        .back-link:hover {
            color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Details</h1>
        <table>
            <tr>
                <td>ID:</td>
                <td>${user.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${user.email}</td>
            </tr>
            <tr>
                <td>Contact Number:</td>
                <td>${user.contact}</td>
            </tr>
            <tr>
                <td>Seat Number:</td>
                <td>${user.ticket}</td>
            </tr>
        </table>

        <form action="payment.jsp" method="POST" style="margin-bottom:15px;">
            <input type="hidden" name="userId" value="${user.id}" />
            <button type="submit" class="btn-pay">Pay Now</button>
        </form>

        <a href="user" class="back-link">Back to Booking</a>
    </div>
</body>
</html>
