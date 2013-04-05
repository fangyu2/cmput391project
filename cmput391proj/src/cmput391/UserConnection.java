package cmput391;

import java.sql.*;


/*
 * This class is responsible for creating our connections in all of our 
 * pages, so we aren't required to specifically enter in database 
 * connections and drivers etc. 
 * 
 * To create a connection using this class we simply invoke:
 *    stmt = UserConnection.getConnection().getConn().createStatement();
 * and to close the connection we use:
 *    stmt.close();
 * 
 */

public class UserConnection {

	public static UserConnection userConnection = null;
	public static final String driverName = "oracle.jdbc.driver.OracleDriver";
	public static final String dbstring = "jdbc:oracle:thin:@gwynne.cs.ualberta.ca:1521:CRS";
	private Connection conn = null;
	private String userName = "jdemery";
	private String userPassword = "jim12345";


	/**
	 * start the connection when userconnection class
	 */
	protected UserConnection() {
		try {
			Class drvClass = Class.forName(driverName);
			DriverManager.registerDriver((Driver) drvClass.newInstance());
		}
		catch(Exception ex) {
			System.out.println("<hr>" + ex.getMessage() + "<hr>");
		}
		try {
			conn = DriverManager.getConnection(dbstring, userName, userPassword);
			conn.setAutoCommit(false);
		}
		catch(Exception ex) {
			System.out.println("<hr>" + ex.getMessage() + "<hr>");
		}
	}

	/**
	 * 
	 * @return a user connection singleton
	 */
	public static UserConnection getConnection() {
		if(userConnection == null) {
			userConnection = new UserConnection();
		}
		return userConnection;
	}

	/**
	 * 
	 * @return the sql connection
	 */
	public Connection getConn() {
		return conn;
	}
	
}
