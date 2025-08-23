<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List, connection.DbCon, dao.UserDao, model.User"%>
<%
    // Establish database connection and retrieve all users using UserDao
    Connection conn = DbCon.getConnection();
    UserDao userDao = new UserDao(conn);
    List<User> users = userDao.getAllUsers();  // Store list of all users
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management System</title>

    <!-- Load Google Fonts and Font Awesome for styling and icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        /* Global styling and reset */
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #fef7f0;
        }

        /* Sidebar styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 220px;
            background-color: #1a1a2e;
            color: #fff;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
            color: #ffa500;
        }

        .sidebar ul {
            list-style: none;
            padding-left: 0;
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

        /* Main content area */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }

        /* Top navbar above the table */
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

        /* Table container */
        .table-wrapper {
            margin-top: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(255,111,0,0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #ff6f00;
            color: white;
        }

        table th, table td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: left;
        }

        table tbody tr:hover {
            background-color: #ffe0b2;
        }

        /* Button style for delete and update */
        .btn-delete {
            background-color: #e53935;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #c62828;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
            }

            table th, table td {
                font-size: 14px;
            }
        }
    </style>

    <!-- JS confirmation popup for delete -->
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this event?");
        }
    </script>
</head>
<body>

<!-- Sidebar navigation -->
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

<!-- Main Content Area -->
<div class="main-content">
    <!-- Header navbar -->
    <div class="top-navbar">
        <span>User Management</span>
        <a href="EventIndex.jsp">Logout</a>
    </div>

    <!-- Table displaying user data -->
    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for(User user : users) { %>
                    <tr>
                        <td><%=user.getName()%></td>
                        <td><%=user.getEmail()%></td>
                        <td><%=user.getPassword()%></td>
                        <td style="display: flex; gap: 10px;">
                            <!-- DELETE FORM: Sends user ID to servlet for deletion -->
                            <form action="<%= request.getContextPath() %>/update-delete" method="post" onsubmit="return confirmDelete()">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=user.getId()%>">
                                <button type="submit" class="btn-delete">Delete</button>
                            </form>

                            <!-- UPDATE FORM: Sends user ID to edit-user.jsp for updating -->
                            <form action="edit-user.jsp" method="get">
                                <input type="hidden" name="id" value="<%=user.getId()%>">
                                <button type="submit" class="btn-delete" style="background-color: #007bff;">Update</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
