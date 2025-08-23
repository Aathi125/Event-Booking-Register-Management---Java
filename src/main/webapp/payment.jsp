<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Payment Portal</title>
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
        .payment-form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            width: 400px;
        }
        .payment-form h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
        }
        input[type="text"],
        input[type="number"],
        input[type="month"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="month"]:focus,
        input[type="password"]:focus {
            border-color: #28a745;
            outline: none;
        }
        button {
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
        button:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #333;
            text-decoration: none;
            font-weight: 600;
        }
        .back-link:hover {
            color: #28a745;
        }
        .user-info {
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
            text-align: center;
        }
    </style>
</head>
<body>
    <form class="payment-form" action="processPayment" method="POST">
        <h1>Payment Portal</h1>

        <div class="user-info">User ID: <%= userId != null ? userId : "N/A" %></div>
        <input type="hidden" name="userId" value="<%= userId != null ? userId : "" %>" />

        <label for="cardNumber">Card Number</label>
        <input type="text" id="cardNumber" name="cardNumber" maxlength="16" placeholder="1234 5678 9012 3456" required pattern="\d{16}" title="Enter 16-digit card number" />

        <label for="expiryDate">Expiry Date</label>
        <input type="month" id="expiryDate" name="expiryDate" required />

        <label for="cvv">CVV</label>
        <input type="password" id="cvv" name="cvv" maxlength="3" placeholder="123" required pattern="\d{3}" title="Enter 3-digit CVV" />

        <button type="submit">Submit Payment</button>
    </form>
</html>
