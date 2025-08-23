package contact;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";
        ContactDao dao = new ContactDao();

        if ("list".equals(action)) {
            List<Contact> contactList = dao.getAllContacts();
            request.setAttribute("contactList", contactList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
            dispatcher.forward(request, response);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Contact contact = dao.getContactById(id);
            request.setAttribute("contact", contact);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editContact.jsp");
            dispatcher.forward(request, response);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteContact(id);
            response.sendRedirect("ContactServlet?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        ContactDao dao = new ContactDao();

        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            dao.updateContact(new Contact(id, name, email, message));
        } else {
            dao.insertContact(new Contact(name, email, message));
        }

        response.sendRedirect("ContactServlet?action=list");
    }
}
