package model;

public class Booking {
	private int id;
    private String username;
    private String email;
    private String contact;
    private String ticket;
    
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getContact() {
		return contact;
	}
	public String getTicket() {
		return ticket;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
}
