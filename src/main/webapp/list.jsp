


<%@ page import="java.util.*,contact.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        a {
            text-decoration: none;
            color: white;
            background-color: #27ae60;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 10px auto;
            display: inline-block;
        }

        a:hover {
            background-color: #219150;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .action-link {
            color: #2980b9;
            font-weight: bold;
        }

        .action-link:hover {
            color: #1c5980;
        }
    </style>
</head>
<body>

<h2>Submitted Contacts</h2>
<div style="text-align: center;">
    <a href="Contact.jsp">Add New</a>
</div>

<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Actions</th>
    </tr>
    <%
        List<Contact> contacts = (List<Contact>) request.getAttribute("contactList");
        if (contacts != null) {
            for (Contact c : contacts) {
    %>
    <tr>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getMessage() %></td>
        <td>
            <a class="action-link" href="ContactServlet?action=edit&id=<%=c.getId()%>">Edit</a> |
            <a class="action-link" href="ContactServlet?action=delete&id=<%=c.getId()%>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>

