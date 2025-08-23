<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("EventIndex.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JAZZ Events Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<%@include file="includes/head.jsp"%>
<!-- Add your CSS styles -->
<style>
    /* Body Background Image */
    body {
        margin: 0;
        padding: 0;
        background-image: url('images/background.jpg'); /* Replace with your background image URL */
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "Open Sans", sans-serif;
    }

    /* Form container with transparent background */
    .form-container {
        background: rgba(0, 0, 0, 0.5);  /* Semi-transparent background */
        padding: 40px;
        border-radius: 10px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(10px); /* Apply blur effect to the background */
    }

    .form-container h2 {
        font-size: 28px;
        color: #fff;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        font-size: 16px;
        color: #fff;
    }

    .form-control {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 6px;
        border: 1px solid #ccc;
        background-color: rgba(255, 255, 255, 0.7); /* Light background for input fields */
        margin-top: 10px;
    }

    .form-control:focus {
        border-color: #fff;
        outline: none;
    }

    .btn-primary {
        background-color: #ff6600;  /* Blue background */
        border: none;
        padding: 12px 20px;
        color: #fff;
        font-size: 16px;
        width: 100%;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 10px;
    }

    .btn-primary:hover {
        background-color: #cc5200;  /* Darker blue */
    }

    .forgot-password {
        text-align: center;
        margin-top: 10px;
    }

    .forgot-password a {
        color: #ff6600;
        font-size: 14px;
        text-decoration: none;
    }

    .forgot-password a:hover {
        text-decoration: underline;
    }

    .register-link {
  	    color: #fff;
        text-align: center;
        margin-top: 10px;
    }

    .register-link a {
        color: #ff6600;
        font-size: 16px;
        text-decoration: none;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

    .alert {
        background-color: #f44336;
        color: white;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
    }

    .hidden {
        display: none;
    }
</style>

<script>
    // JavaScript function to display alert message
    function displayAlert(message) {
        var alertDiv = document.getElementById("alert");
        alertDiv.innerHTML = message;
        alertDiv.style.display = "block";
    }
</script>

</head>
<body>

    <div class="form-container">
        <h2>User Login</h2>
        <div id="alert" class="alert hidden"></div>
        <form action="user-login" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="login-email">Email Address</label>
                <input type="email" class="form-control" name="login-email" id="login-email" placeholder="Enter Your Email" required>
            </div>
            <div class="form-group">
                <label for="login-password">Password</label>
                <input type="password" class="form-control" name="login-password" id="login-password" placeholder="*" required>
            </div>
            <div class="form-group">
                <label class="flex items-center">
                    <input type="checkbox" class="w-4 h-4 rounded border border-orange-500/20 text-orange-600 focus:ring-orange-500">
                    <span class="text-sm text-gray-300">Remember me</span>
                </label>
            </div>
            <button type="submit" class="btn-primary">Login</button>
        </form>

        <div class="forgot-password">
            <p><a href="mailto:info@eventmanagement.com">Forgot my Password?</a></p>
        </div>

        <div class="register-link">
            <p>New User? <a href="registration.jsp">Register</a></p>
        </div>
    </div>

   

    <!-- Hidden alert div -->
    <script>
        function validateForm() {
            // You can add more validation here if needed
            return true;
        }
    </script>

    <% 
    // Check if there's an error message passed from the servlet
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
        <script>
            displayAlert("<%= errorMessage %>");
        </script>
    <% } %>
</body>
</html>