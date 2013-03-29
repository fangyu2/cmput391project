package cmput391;

public class UserManager {
	public static UserManager userManager = null;

	private User user;
	
	protected UserManager(){}
	
	public static UserManager getUserManager(){
		if(userManager == null) {
			userManager = new UserManager();
		}
		return userManager;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public User getUser() {
		return user;
	}
}
