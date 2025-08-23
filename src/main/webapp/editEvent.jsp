<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.Event" %>

<%
// Retrieve the event object from the request scope (set in servlet before forwarding)
Event event = (Event) request.getAttribute("event");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Event</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Import Poppins font and FontAwesome icons -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

<!-- Page styling -->
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

    /* Sidebar style */
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

    /* Main content shifts due to fixed sidebar */
    .main-content {
        margin-left: 220px;
        padding: 20px;
    }

    /* Top bar for logout and title */
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

    /* Styling for the event update form */
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

    /* Responsive handling */
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

<!-- Sidebar navigation -->
<div class="sidebar">
    <h4>Admin Dashboard</h4>
    <ul>
        <li><a href="AddEvent.jsp"><i class="fas fa-plus-circle"></i> Add Event</a></li>
        <li class="active"><a href="updateEvent.jsp"><i class="fas fa-edit"></i> Update Event</a></li>
        <li><a href="deleteEvent.jsp"><i class="fas fa-trash-alt"></i> Delete Event</a></li>
        <li><a href="userManagement.jsp"><i class="fas fa-user-cog"></i> User Management</a></li>
        <li><a href="EventIndex.jsp"><i class="fas fa-home"></i> Back to Home</a></li>
    </ul>
</div>

<!-- Main content section -->
<div class="main-content">
    <div class="top-navbar">
        <span>Update Event</span>
        <a href="EventIndex.jsp">Logout</a>
    </div>

    <div class="form-container">
        <h2>Update Event</h2>
        <!-- Form to update event data -->
        <form action="create-ubdate-delete" method="post" onsubmit="return validatePrice()">
            <!-- Hidden fields to indicate update action and send event ID -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%=event.getId()%>">

            <!-- Event Name -->
            <div class="form-group">
                <label for="name">Event Name:</label>
                <input type="text" id="name" name="name" value="<%=event.getName()%>" required>
            </div>

            <!-- Venue/Category -->
            <div class="form-group">
                <label for="category">Venue:</label>
                <input type="text" id="category" name="category" value="<%=event.getCategory()%>" required>
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" value="<%=event.getPrice()%>" required>
                <div id="validation-message" class="validation-message"></div>
            </div>

            <!-- Image URL -->
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" id="image" name="image" value="<%=event.getImage()%>">
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn-submit">Update Event</button>
        </form>
    </div>
</div>

<!-- Client-side JavaScript for price validation -->
<script>
    function validatePrice() {
        var price = document.getElementById("price").value;
        var message = document.getElementById("validation-message");

        // Price must be between 0 and 200000
        if (price < 0 || price > 200000) {
            message.innerHTML = "Price should be between 0 and 200000.";
            return false;
        } else {
            message.innerHTML = "";
        }
        return true;
    }
</script>

</body>
</html>
