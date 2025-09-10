package com.booking.boot.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	public static Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/edudb?useSSL=false&serverTimezone=UTC";
		String user = "admin";
		String password = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}

}
