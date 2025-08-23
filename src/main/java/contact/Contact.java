package contact;

public class Contact {
	private int id;
	private String name,email,message;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Contact(String name, String email, String message) {
	    this.name = name;
	    this.email = email;
	    this.message = message;
	}

    public Contact(int id, String name, String email, String message) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
    }
    public int getId() 
    { 
    	return id; 
    }
    public void setId(int id) { 
    	this.id = id; 
    	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
