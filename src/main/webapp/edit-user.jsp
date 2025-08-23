<!-- Importing required classes -->
<%@page import="dao.UserDao"%>
<%@page import="connection.DbCon"%>
<%@page import="model.User"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Fetching the user ID from the request parameter
    int userId = Integer.parseInt(request.getParameter("id"));

    // Creating an instance of UserDao to access user data from the database
    UserDao userDao = new UserDao(DbCon.getConnection());

    // Fetch the user object by its ID to populate the form with existing data
    User user = userDao.getUserById(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update User</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Fonts and Icons -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

<!-- Custom Styles for Layout -->
<style>
    * {
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
    }

    body {
        background-color: #fef7f0;
    }

    /* Sidebar Navigation */
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 220px;
        height: 100vh;
        background-color: #1a1a2e;
        padding: 20px 0;
        color: #fff;
    }

    .sidebar h4 {
        text-align: center;
        color: #ffa500;
        margin-bottom: 30px;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        padding: 12px 20px;
    }

    .sidebar ul li a {
        color: #fff;
        text-decoration: none;
        display: block;
    }

    .sidebar ul li:hover,
    .sidebar ul li.active {
        background-color: #ffa500;
        border-left: 5px solid white;
    }

    /* Main Content next to sidebar */
    .main-content {
        margin-left: 220px;
        padding: 20px;
    }

    /* Top Navigation Bar */
    .top-navbar {
        background-color: #ff6f00;
        padding: 15px 25px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 10px;
    }

    .top-navbar a {
        background-color: #e53935;
        color: white;
        padding: 6px 14px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
        transition: 0.3s;
    }

    .top-navbar a:hover {
        background-color: #c62828;
    }

    /* Styling for form wrapper */
    .form-container {
        background-color: #fff;
        max-width: 700px;
        margin: 40px auto;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 0 20px rgba(255,111,0,0.2);
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 20px;
        background: linear-gradient(90deg, #ff8f00, #ff6f00);
        color: #fff;
        padding: 12px;
        border-radius: 10px 10px 0 0;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        font-weight: 500;
        margin-bottom: 6px;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 15px;
    }

    .btn-submit {
        background-color: #ff6f00;
        border: none;
        padding: 12px 20px;
        font-weight: 600;
        border-radius: 10px;
        color: white;
        cursor: pointer;
        width: 100%;
        transition: 0.3s ease;
    }

    .btn-submit:hover {
        background-color: #e65100;
    }

    .validation-message {
        color: #d32f2f;
        font-size: 14px;
    }

    /* Responsive Fix */
    @media (max-width: 768px) {
        .sidebar {
            width: 100%;
            height: auto;
            position: relative;
        }
        .main-content {
            margin-left: 0;
        }
    }
</style>
</head>
<body>

<!-- Sidebar Section -->
<div class="sidebar">
    <h4>Admin Dashboard</h4>
    <ul>
        <li><a href="AddEvent.jsp"><i class="fas fa-plus-circle"></i> Add Event</a></li>
        <li><a href="updateEvent.jsp"><i class="fas fa-edit"></i> Update Event</a></li>
        <li><a href="deleteEvent.jsp"><i class="fas fa-trash-alt"></i> Delete Event</a></li>
        <li class="active"><a href="userManagement.jsp"><i class="fas fa-user-cog"></i> User Management</a></li>
        <li><a href="EventIndex.jsp"><i class="fas fa-home"></i> Back to Home</a></li>
    </ul>
</div>

<!-- Main Content Section -->
<div class="main-content">
    <div class="top-navbar">
        <span>Update User</span>
        <a href="EventIndex.jsp">Logout</a>
    </div>

    <!-- Form to update user information -->
    <div class="form-container">
        <h2>Update User</h2>
        <form action="update-delete" method="post">
            <!-- Hidden fields to carry user ID and specify update action -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%=user.getId()%>">

            <!-- Username input -->
            <div class="form-group">
                <label for="name">User Name:</label>
                <input type="text" id="name" name="name" value="<%=user.getName()%>" required>
            </div>

            <!-- Email input -->
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="<%=user.getEmail()%>" required>
            </div>

            <!-- Password input -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="number" id="password" name="password" value="<%=user.getPassword()%>" required>
                <div id="validation-message" class="validation-message"></div>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn-submit">Update Event</button>
        </form>
    </div>
</div>

</body>
</html>
