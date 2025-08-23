package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;

/**
 * Servlet implementation for managing events (Add, Update, Delete)
 * URL mapping: /create-ubdate-delete
 */
@WebServlet("/create-ubdate-delete")
public class CreateUbdateDeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests and routes them to the correct action method.
	 * The "action" parameter in the request decides the operation.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); // get action type from form

        if (action != null) {
            switch (action) {
                case "add":
                    addProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    response.sendRedirect("EventIndex.jsp"); // default fallback
                    break;
            }
        } else {
            response.sendRedirect("EventIndex.jsp"); // redirect if no action is provided
        }
	}

	/**
	 * Adds a new event to the database.
	 */
	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve values from form input
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        try {
            // Open DB connection and insert new record
            Connection con = DbCon.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO events (name, category, price, image) VALUES (?, ?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, category);
            pst.setDouble(3, price);
            pst.setString(4, image);
            pst.executeUpdate(); // execute insert
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // log any error
        }

        // Redirect to form page after insert
        response.sendRedirect("AddEvent.jsp");
    }

	/**
	 * Updates an existing event in the database using its ID.
	 */
	private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve values from form input
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        try {
            // Open DB connection and prepare update statement
            Connection con = DbCon.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE events SET name=?, category=?, price=?, image=? WHERE id=?");
            pst.setString(1, name);
            pst.setString(2, category);
            pst.setDouble(3, price);
            pst.setString(4, image);
            pst.setInt(5, id);
            pst.executeUpdate(); // execute update
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // log any error
        }

        // Redirect to update view
        response.sendRedirect("updateEvent.jsp");
    }

	/**
	 * Deletes an event from the database using its ID.
	 */
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // event ID from form

        try {
            // Open DB connection and prepare delete statement
            Connection con = DbCon.getConnection();
            PreparedStatement pst = con.prepareStatement("DELETE FROM events WHERE id=?");
            pst.setInt(1, id);
            pst.executeUpdate(); // execute deletion
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // log any error
        }

        // Redirect to delete view
        response.sendRedirect("deleteEvent.jsp");
    }
}
