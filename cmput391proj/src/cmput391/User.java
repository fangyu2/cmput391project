package cmput391;

/*
 * We use this class to set the user's login class when they first log in.
 * This allows us to do security checks on each page that the user can visit.
 * This check allows for us to make sure patients can't add a record by simply
 * typing in the addRecords.jsp page (it boots them  back to the Home.jsp page)
 * 
 */

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
