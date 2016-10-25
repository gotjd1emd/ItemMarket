package model.dto;

public class UserDTO {
	private String id; 
	private String password;
	private String tel;
	private String email;
	private String location;
	private int cash;
	
	
	public UserDTO(String id, String password, String tel, String email, String location, int cash) {
		super();
		this.id = id;
		this.password = password;
		this.tel = tel;
		this.email = email;
		this.location = location;
		this.cash = cash;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	
	
}
