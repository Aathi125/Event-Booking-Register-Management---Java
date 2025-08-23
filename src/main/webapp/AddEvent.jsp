<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Set favicon for the page -->
<link rel="icon" type="image/x-icon" sizes="32x32" href="images/favicon.ico">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <!-- Internal CSS Styling -->
    <style>
        /* General resets and font settings */
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #fef7f0;
        }

        /* Sidebar styles */
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

        /* Main content section */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }

        /* Top navigation bar inside main content */
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

        /* Form container styling */
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

        /* Form input styling */
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

        /* Submit button styling */
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

        /* Price validation message style */
        .validation-message {
            color: #d32f2f;
            font-size: 14px;
        }

        /* Responsive layout */
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
        <li class="active"><a href="AddEvent.jsp"><i class="fas fa-plus-circle"></i> Add Event</a></li>
        <li><a href="updateEvent.jsp"><i class="fas fa-edit"></i> Update Event</a></li>
        <li><a href="deleteEvent.jsp"><i class="fas fa-trash-alt"></i> Delete Event</a></li>
        <li><a href="userManagement.jsp"><i class="fas fa-user-cog"></i> User Management</a></li>
        <li><a href="EventIndex.jsp"><i class="fas fa-home"></i> Back to Home</a></li>
    </ul>
</div>

<!-- Main page content -->
<div class="main-content">

    <!-- Top navigation bar -->
    <div class="top-navbar">
        <span>Add New Event</span>
        <a href="EventIndex.jsp" class="btn btn-danger btn-sm">Logout</a>
    </div>

    <!-- Event Form Section -->
    <div class="form-container">
        <h2>Add Event</h2>

        <!-- Form to submit new event data -->
        <form action="create-ubdate-delete" method="post" onsubmit="return validatePrice()">
            <input type="hidden" name="action" value="add">

            <!-- Event Name Input -->
            <div class="form-group">
                <label for="name">Event Name:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter event name" required>
            </div>

            <!-- Venue Input -->
            <div class="form-group">
                <label for="category">Venue:</label>
                <input type="text" class="form-control" id="category" name="category" placeholder="Enter venue" required>
            </div>

            <!-- Price Input -->
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" name="price" placeholder="Enter price" required>
                <div id="validation-message" class="validation-message"></div>
            </div>

            <!-- Image URL Input -->
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" class="form-control" id="image" name="image" placeholder="e.g., images/banner.jpg">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-submit">Add Event</button>
        </form>
    </div>
</div>

<!-- JS to validate price field -->
<script>
    function validatePrice() {
        var price = document.getElementById("price").value;
        var validationMessage = document.getElementById("validation-message");

        // Ensure price is between 0 and 200,000
        if (price < 0 || price > 200000) {
            validationMessage.innerHTML = "Price should be between 0 and 200000.";
            return false;
        } else {
            validationMessage.innerHTML = "";
        }
        return true;
    }
</script>

</body>
</html>
