package servlet;

import connection.DbCon;
import dao.UserDao;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteAccount")
public class deleteAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Get the user from session
            User user = (User) request.getSession().getAttribute("auth");
            if (user == null) {
                response.sendRedirect("login.jsp"); // Redirect if user is not logged in
                return;
            }

            // Delete user's account from the database
            try {
                UserDao userDao = new UserDao(DbCon.getConnection());
                userDao.deleteUser(user.getId());
                // Clear the session and redirect to login page or any other appropriate page
                request.getSession().invalidate();
                response.sendRedirect("registration.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("Failed to delete account.");
            }
        }
    }
}