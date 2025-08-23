<!-- Import required Java classes and packages -->
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, connection.DbCon, dao.EventDao, model.Event"%>

<%
    // Get a database connection
    Connection conn = DbCon.getConnection();

    // Create an instance of the DAO (Data Access Object) to fetch event data
    EventDao eventDao = new EventDao(conn);

    // Retrieve all events from the database
    List<Event> evnts = eventDao.getAllEvents();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Import Google Font and Font Awesome for icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <!-- Embedded CSS for layout and styling -->
    <style>
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #fef7f0;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 220px;
            height: 100vh;
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

        /* Main content area next to sidebar */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }

        /* Top navigation bar above the table */
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

        /* Table styling for listing events */
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

        /* Update button style */
        .btn-update {
            background-color: #e53935;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-update:hover {
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
</head>
<body>

<!-- Sidebar Navigation Menu -->
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

<!-- Main Content Area -->
<div class="main-content">
    <!-- Top Navigation/Toolbar -->
    <div class="top-navbar">
        <span>Update Events</span>
        <a href="EventIndex.jsp">Logout</a>
    </div>

    <!-- Table displaying all events with update buttons -->
    <div class="table-wrapper">
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Image URL</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                // Iterate through the list of events and display each in a row
                for (Event product : evnts) {
            %>
            <tr>
                <td><%=product.getName()%></td>
                <td><%=product.getCategory()%></td>
                <td><%=product.getPrice()%></td>
                <td><%=product.getImage()%></td>
                <td>
                    <!-- Update button with event ID passed to edit-event servlet -->
                    <a href="edit-event?id=<%=product.getId()%>" class="btn-update">Update</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>