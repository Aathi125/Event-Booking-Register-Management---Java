package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.UserDao;
import model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");
            
            String adminEmail = "admin@gmail.com";
            String adminPassword = "123456";
            
            if(email.equals(adminEmail) && password.equals(adminPassword)) {
                // Admin logged in successfully, redirect to addProduct.jsp
                response.sendRedirect("AddEvent.jsp");
                return; // Exit the method
            }
            
            try {
                UserDao udao = new UserDao(DbCon.getConnection());
                User user = udao.userLogin(email,password);
                
                if(user != null) {
                    out.print("User Login");
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("EventIndex.jsp");
                } else {
                    // Set error message attribute if login fails
                    request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            
            out.print(email+password);
        }
    }
}
