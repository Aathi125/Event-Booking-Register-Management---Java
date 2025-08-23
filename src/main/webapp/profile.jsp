<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    User user = (User) session.getAttribute("auth");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if user is not logged in
    }
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    	request.setAttribute("auth", auth);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="includes/head.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
    @import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex; /* Use flexbox */
        }

        .avatar-container {
            flex: 1; /* Take 1/3 of the space */
            padding-right: 20px; /* Add some space between avatar and form */
        }

        .form-container {
            flex: 2; /* Take 2/3 of the space */
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            /* Add your avatar image as background */
            background-image: url('product-images/user.avif');
            background-size: cover;
            background-position: center;
            margin: auto; /* Center the avatar */
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        button[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .update-button {
            background-color: #28a745;
            color: #fff;
        }

        .update-button:hover {
            background-color: #218838;
        }

        .delete-button {
            background-color: #dc3545;
            color: #fff;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .notification {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
    </style>
    <%@include file="includes/head.jsp"%>
</head>

<body>
 <!-- Header -->
 <%@include file="includes/navbar.jsp"%>
    <div class="container">
        <div class="avatar-container">
            <img src="product-images/user.avif">
        </div>
        <div class="form-container">
            <h1>Welcome</h1>
            <h1> <%= user.getName() %></h1>
            <% if (request.getAttribute("updateSuccess") != null) { %>
                <div class="notification">
                    Profile updated successfully!
                </div>
            <% } %>
            <form action="updateProfile" method="post">
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" value="<%= user.getName() %>"><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>"><br>
                <label for="password">New Password:</label><br>
                <input type="password" id="password" name="password"><br><br>
                <div class="button-container">
                    <button type="submit" class="update-button">Update Profile</button>
                    <button type="submit" formaction="deleteAccount" class="delete-button">Delete Account</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
