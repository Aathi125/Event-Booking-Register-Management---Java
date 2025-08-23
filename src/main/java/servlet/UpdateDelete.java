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
 * Servlet to handle user update and delete actions.
 * This servlet maps to the URL pattern /update-delete.
 */
@WebServlet("/update-delete")
public class UpdateDelete extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests (form submissions).
     * Depending on the 'action' parameter, it will call update or delete method.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve action from the form (either 'update' or 'delete')
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "update":
                    updateUser(request, response); // Call update method
                    break;
                case "delete":
                    deleteUser(request, response); // Call delete method
                    break;
                default:
                    // If action is unrecognized, redirect to home
                    response.sendRedirect("EventIndex.jsp");
                    break;
            }
        } else {
            // If action is null, redirect to home
            response.sendRedirect("EventIndex.jsp");
        }
    }

    /**
     * Updates user information in the database based on form input.
     * @param request contains id, name, email, password
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get user details from the form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Connect to database
            Connection con = DbCon.getConnection();
            
            // Prepare SQL update query
            PreparedStatement pst = con.prepareStatement(
                "UPDATE users SET name=?, email=?, password=? WHERE id=?"
            );
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setInt(4, id);

            // Execute the update query
            pst.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error if something goes wrong
        }

        // After update, redirect back to the user management page
        response.sendRedirect("userManagement.jsp");
    }

    /**
     * Deletes a user from the database using the user ID.
     * @param request contains the id of the user to delete
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get user ID from the form
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            // Connect to database
            Connection con = DbCon.getConnection();
            
            // Prepare SQL delete query
            PreparedStatement pst = con.prepareStatement("DELETE FROM users WHERE id=?");
            pst.setInt(1, id);

            // Execute the delete query
            pst.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print error if something goes wrong
        }

        // After delete, redirect back to the user management page
        response.sendRedirect("userManagement.jsp");
    }
}
