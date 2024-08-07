package com.quotes.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.quotes.model.Users;


public class UserBo {
	
	private static Connection connection;
	private static PreparedStatement prepareStatement;
	private static Statement statement;
	private static ResultSet res;	
	

	//Register
	private final static String RIGISTER_QUERY = "INSERT into `users`(`name`,`password`) values(?,?)";
	//Login
	private final static String GET_LOGIN_QUERY = "SELECT * FROM  `users` WHERE `name`=? AND `password`=?";
		
	
	
	public static final UserBo objUserBoImp() {
		return new UserBo();
	}
	
	public UserBo() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/quote_db","root","root");			
			
		} catch (ClassNotFoundException |SQLException e1) {
			e1.printStackTrace();
		} 
		
	}
	
	
	
	//Login
		public Users getLogin(String name,String password)
		{
			Users usr=null;
			
			try {
				
				prepareStatement=connection.prepareStatement(GET_LOGIN_QUERY);
				prepareStatement.setString(1, name);
				prepareStatement.setString(2, password);
				
				ResultSet res = prepareStatement.executeQuery();
				
				if(res.next())
				{
					name = res.getString("name");
					password = res.getString("password");
					usr=new Users(name,password);
					
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return usr;
			
		}
		
		
		
	//Register
		public int register(Users usr)
		{
			try{
				prepareStatement = connection.prepareStatement(RIGISTER_QUERY);
				
				prepareStatement.setString(1, usr.getName());
				prepareStatement.setString(2, usr.getPassword());
				int i = prepareStatement.executeUpdate();
				
				return i;
				
			}
			catch(SQLException e )
			{
				e.printStackTrace();
				return 0;
				
			}
//			return 0;
			
		}
		

}
