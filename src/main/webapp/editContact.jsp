
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="contact.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Contact</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            margin-top: 20px;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #0066cc;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Contact</h2>
    <form action="ContactServlet" method="post">
        <input type="hidden" name="id" value="<%= ((Contact)request.getAttribute("contact")).getId() %>">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= ((Contact)request.getAttribute("contact")).getName() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= ((Contact)request.getAttribute("contact")).getEmail() %>" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" required><%= ((Contact)request.getAttribute("contact")).getMessage() %></textarea>

        <input type="submit" value="Update Contact">
    </form>

    <div class="back-link">
        <a href="ContactServlet?action=list">← Back to List</a>
    </div>
</div>

</body>
</html>
