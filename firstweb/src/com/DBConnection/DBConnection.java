package com.DBConnection;
import java.sql.*;

public class DBConnection {
	String driverClass = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=gbk";
	private Connection conn = null;
	String username = "root";
	String password = "windowmysql123";
	public DBConnection(){
		try{
			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			
		}
	}
	public Connection getConnection(){
		return this.conn;		
	}
	public void close(){
		try{
			this.conn.close();
		}catch(Exception e){
			
		}
	}
}
