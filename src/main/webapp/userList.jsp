<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>User List - Last User Only</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            padding: 40px 20px;
            margin: 0;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 25px;
        }
        .create-link {
            display: inline-block;
            background-color: #28a745;
            color: white;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }
        .create-link:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }
        thead tr {
            background-color: #28a745;
            color: white;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tbody tr:hover {
            background-color: #e9f5e9;
        }
        .actions a {
            color: #28a745;
            font-weight: 600;
            text-decoration: none;
            margin: 0 6px;
            padding: 6px 10px;
            border-radius: 5px;
            border: 1px solid transparent;
            transition: all 0.3s;
        }
        .actions a:hover {
            background-color: #28a745;
            color: white;
            border-color: #28a745;
        }
        .actions a.delete-link:hover {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .actions a.delete-link {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Booking Details </h1>
        <a href="user?action=create" class="create-link">Create New Booking</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Seat Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty users}">
                    <c:set var="lastUser" value="${users[users.size() - 1]}" />
                    <tr>
                        <td>${lastUser.id}</td>
                        <td>${lastUser.username}</td>
                        <td>${lastUser.email}</td>
                        <td>${lastUser.contact}</td>
                        <td>${lastUser.ticket}</td>
                        <td class="actions">
                            <a href="user?action=getById&id=${lastUser.id}">View</a> |
                            <a href="user?action=edit&id=${lastUser.id}">Edit</a> 
                            <a href="user?action=delete&id=${lastUser.id}" class="delete-link" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${empty users}">
                    <tr>
                        <td colspan="6">No users found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
