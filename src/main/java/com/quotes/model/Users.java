package com.quotes.model;



public class Users {

	private int id;
	private String name;
	private String password;
	
	public Users(int id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}


	//for Login
	public Users(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
	
	
	public Users() {
	}


	public int getId() {
		return id;
	}



	public String getName() {
		return name;
	}
	


	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	

}
