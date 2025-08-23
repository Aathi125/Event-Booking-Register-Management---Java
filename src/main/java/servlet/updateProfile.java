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

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Get the user from session
            User user = (User) request.getSession().getAttribute("auth");
            if (user == null) {
                response.sendRedirect("login.jsp"); // Redirect if user is not logged in
                return;
            }

            // Update user details
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);

            // Update user details in the database
            try {
                UserDao userDao = new UserDao(DbCon.getConnection());
                userDao.updateUser(user);
                request.setAttribute("updateSuccess", true); // Set attribute for successful update
                request.getRequestDispatcher("profile.jsp").forward(request, response); // Forward back to profile.jsp
                //out.println("Profile updated successfully.");
                // Redirect to profile page or any other appropriate page
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("Failed to update profile.");
            }
        }
    }
}