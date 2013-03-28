package cmput391;

public class User {

	private String userName;
	private char userClass;
	
	public User(String userName, char userClass) {
		this.userName = userName;
		this.userClass = userClass;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setUserClass(char userClass) {
		this.userClass = userClass;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public char getUserClass() {
		return userClass;
	}
	
	
	
}
