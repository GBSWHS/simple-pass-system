package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connect {
	public static Connection getConnection () throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		
		return DriverManager.getConnection("jdbc:mysql://mariadb:3306/pass", "pass", null);
	}
}
