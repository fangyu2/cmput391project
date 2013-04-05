package cmput391;

public class User {

	private String userName;
	private String userClass;
	
	public User(String userName, String userClass) {
		this.userName = userName;
		this.userClass = userClass;
	}
	
	/**
	 * sets user name of the logged in user as username
	 * @param userName
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	/**
	 * sets the user class as provided
	 * @param userClass
	 */
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	
	/**
	 * 
	 * @return name of the user logged in
	 */
	public String getUserName() {
		return userName;
	}
	
	/**
	 * 
	 * @return users class ie. doctor, radiologist
	 */
	public String getUserClass() {
		return userClass;
	}
	
	
	
}
