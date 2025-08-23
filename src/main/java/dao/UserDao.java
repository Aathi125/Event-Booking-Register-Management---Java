package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {
    // Database connection
    private Connection con;

    // SQL query, statement, and result set placeholders
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    // Constructor to initialize the database connection
    public UserDao(Connection con) {
        this.con = con;
    }

    /**
     * User login authentication method.
     * Returns a User object if the credentials match, otherwise null.
     */
    public User userLogin(String email, String password) {
        User user = null;
        try {
            // Prepare SQL query to match user credentials
            query = "SELECT * FROM users WHERE email=? AND password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            // Execute query
            ResultSet rs = pst.executeQuery();

            // If credentials match, populate and return a User object
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }

    /**
     * Updates user details in the database.
     * Returns true if the update was successful.
     */
    public boolean updateUser(User user) throws SQLException {
        query = "UPDATE users SET name=?, email=? ,password=? WHERE id=?";
        pst = this.con.prepareStatement(query);
        pst.setString(1, user.getName());
        pst.setString(2, user.getEmail());
        pst.setString(3, user.getPassword());
        pst.setInt(4, user.getId());

        // Returns true if at least one row was updated
        int rowsAffected = pst.executeUpdate();
        return rowsAffected > 0;
    }

    /**
     * Deletes a user from the database based on user ID.
     * Returns true if the delete operation was successful.
     */
    public boolean deleteUser(int userId) throws SQLException {
        query = "DELETE FROM users WHERE id=?";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, userId);

        // Returns true if at least one row was deleted
        int rowsAffected = pst.executeUpdate();
        return rowsAffected > 0;
    }

    /**
     * Retrieves a list of all users from the database.
     */
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            query = "SELECT * FROM users";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            // Loop through result set and populate user list
            while (rs.next()) {
                User row = new User();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setEmail(rs.getString("email"));
                row.setPassword(rs.getString("password"));

                users.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    /**
     * Retrieves a specific user from the database by user ID.
     */
    public User getUserById(int id) {
        User user = null;
        try {
            // Prepare and execute SQL query
            PreparedStatement pst = this.con.prepareStatement("SELECT * FROM users WHERE id = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            // Populate the User object if found
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
