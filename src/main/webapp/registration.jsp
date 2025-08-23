<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Body Background Image */
        body {
            margin: 0;
            padding: 0;
            background-image: url('images/background.jpg'); /* Replace with your local image file path */
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center; 
            align-items: center; /* This ensures header is at the top and footer at the bottom */
            font-family: 'Poppins', sans-serif;
        }

        /* Form container with transparent background and blur effect */
        .form-container {
            background: rgba(0, 0, 0, 0.5);  /* Semi-transparent background */
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px); /* Apply blur effect to the background */
            z-index: 10; /* Ensure the form is above the background */
            margin-top: 50px;
            position: relative;
            
        }

        /* "User Login" Title */
        .form-container h2 {
            font-size: 32px;  /* Increased font size for better visibility */
            font-weight: 700; /* Made it bold */
            color: #fff;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Roboto', sans-serif; /* Use a bold font for the heading */
        }

        /* Other Form Styling */
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
            background-color: #ff6600;  /* Orange background */
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
            background-color: #cc5200;  /* Darker orange for hover effect */
        }

        /* Styling for the "New User?" and "Register" link */
        .register-link a {
            color: #fff; /* White color for "New User?" */
            font-size: 16px;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .register-link a {
            color: #ff6600;  /* Register button color same as login button */
            font-size: 16px;
            font-weight: 600;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #fff;
            font-size: 14px;
            text-decoration: none;
        }

        .forgot-password a:hover {
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
</head>
<body>
    
    <div class="form-container">
        <h2>Registration Form</h2>
        <div id="alert" class="alert hidden"></div>
        <form action="user-registration" method="post" class="mt-4">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Your Name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="*" required>
            </div>
            <button type="submit" class="btn-primary">Register</button>
        </form>
    </div>

    <script>
        // Get the value of the 'error' parameter from the URL
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');

        // If the 'error' parameter is present and equals 'email_exists', display an alert
        if (error === 'email_exists') {
            const alertBox = document.createElement('div');
            alertBox.classList.add('alert');
            alertBox.textContent = 'Email already exists. Please use a different email.';
            document.body.appendChild(alertBox);

            // Hide the alert after a certain duration (e.g., 5 seconds)
            setTimeout(() => {
                alertBox.classList.add('hidden');
            }, 5000); // Adjust the duration as needed
        }
    </script>
</body>
</html>