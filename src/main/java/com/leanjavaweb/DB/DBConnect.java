package com.leanjavaweb.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				conn = DriverManager.getConnection("jdbc"
						+ ":mysql://u8q7iht11pxfowue:2Rra39ZmkIrwSRKzzWrP@buuj4ycd0gzt5wmd8bfw-mysql.services.clever-cloud.com:3306/buuj4ycd0gzt5wmd8bfw","u8q7iht11pxfowue","2Rra39ZmkIrwSRKzzWrP");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}