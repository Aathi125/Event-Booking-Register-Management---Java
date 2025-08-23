package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import model.User;

/**
 * Servlet implementation class UserRegistrationServlet
 */
@WebServlet("/user-registration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			if (isEmailExists(email)) {
				// Email already exists, redirect to registration error page or display error
				// message
				response.sendRedirect("registration.jsp?error=email_exists");
				return;
			}

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);

			Connection conn = DbCon.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());

			int rowsInserted = pstmt.executeUpdate();
			if (rowsInserted > 0) {
				response.sendRedirect("EventIndex.jsp");
			} else {
				System.out.println("Failed");
//                response.sendRedirect("registration_error.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Failed");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Failed");
		}
	}

	private boolean isEmailExists(String email) throws SQLException, ClassNotFoundException {
		Connection conn = DbCon.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE email = ?");
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		return count > 0;
	}

}
