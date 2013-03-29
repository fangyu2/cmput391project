package cmput391;

public class User {

	private String userName;
	private String userClass;
	
	public User(String userName, String userClass) {
		this.userName = userName;
		this.userClass = userClass;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public String getUserClass() {
		return userClass;
	}
	
	
	
}
