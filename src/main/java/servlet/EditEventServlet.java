package servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import connection.DbCon;
import dao.EventDao;
import model.Event;

/**
 * Servlet implementation class EditEventServlet
 * This servlet is used to fetch a single event by ID and forward the data to the editEvent.jsp page for editing.
 */
@WebServlet("/edit-event")
public class EditEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests to /edit-event
     * Retrieves the event ID from the request, fetches the event data from the database,
     * sets it as an attribute, and forwards the user to the editEvent.jsp page.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        //  Get the event ID from the request parameters
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            // Establish a connection to the database
            Connection conn = DbCon.getConnection();

            // Create a new DAO instance and fetch the event by ID
            EventDao dao = new EventDao(conn);
            Event event = dao.getEventById(id); // Fetch the event using DAO method

            // Set the fetched event object as a request attribute
            request.setAttribute("event", event);

            //  Forward the request to the editEvent.jsp page
            request.getRequestDispatcher("editEvent.jsp").forward(request, response);

        } catch (Exception e) {
            // If any error occurs, print stack trace and redirect to fallback page
            e.printStackTrace();
            response.sendRedirect("updateEvent.jsp");
        }
    }
}
