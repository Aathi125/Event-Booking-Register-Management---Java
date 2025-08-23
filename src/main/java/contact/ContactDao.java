package contact;

import java.sql.*;
import java.util.*;

public class ContactDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/EventManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Aathi1125";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");  // Use MySQL driver class
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Keep the rest of the code as it is



    public void insertContact(Contact contact) {
        String sql = "INSERT INTO ContactUs (name, email, message) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Contact> getAllContacts() {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT * FROM ContactUs";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Contact getContactById(int id) {
        String sql = "SELECT * FROM ContactUs WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Contact(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateContact(Contact contact) {
        String sql = "UPDATE ContactUs SET name=?, email=?, message=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.setInt(4, contact.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteContact(int id) {
        String sql = "DELETE FROM ContactUs WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
