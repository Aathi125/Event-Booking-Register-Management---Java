package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import model.*;

/**
 * Data Access Object (DAO) class for managing Event entities.
 * This class handles all interactions with the "events" table in the database.
 */
public class EventDao {

    // Database connection object
    private Connection con;

    // SQL-related objects
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    // Constructor to initialize connection
    public EventDao(Connection con) {
        this.con = con;
    }

    /**
     * Retrieves all event records from the database.
     * 
     * @return List of Event objects
     */
    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        try {
            // SQL query to select all rows from events table
            query = "SELECT * FROM events";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            // Iterate through the result set and populate Event objects
            while (rs.next()) {
                Event row = new Event();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                events.add(row); // Add to list
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return events;
    }

    /**
     * Retrieves a single event (product) by ID.
     * This method is used when you only need one item’s full detail.
     * 
     * @param id The ID of the event
     * @return Event object or null if not found
     */
    public Event getSingleProduct(int id) {
        Event row = null;
        try {
            // SQL query to select an event with a specific ID
            query = "SELECT * FROM events WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            // If a matching record is found, populate the Event object
            if (rs.next()) {
                row = new Event();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }

    /**
     * Alternative method to get an event by ID.
     * This can be useful for update or detail views.
     * 
     * @param id The ID of the event
     * @return Event object or null if not found
     */
    public Event getEventById(int id) {
        Event event = null;
        try {
            // SQL query to select a single event by ID
            String sql = "SELECT * FROM events WHERE id = ?";
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            // Populate and return the Event object if found
            if (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setCategory(rs.getString("category"));
                event.setPrice(rs.getDouble("price"));
                event.setImage(rs.getString("image"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return event;
    }
}
