package com.psl.beans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


public class User implements Serializable{
	public User(int userId, String userName) {
		super();
		this.userId = userId;
		this.userName = userName;
	}
	public User(int userId, String userName, Set<Vehicle> vehicle) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.vehicle = vehicle;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private int userId;
	private String userName;
	private Set<Vehicle> vehicle=new HashSet<Vehicle>();
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Set<Vehicle> getVehicle() {
		return vehicle;
	}
	public void setVehicle(Set<Vehicle> vehicle) {
		this.vehicle = vehicle;
	}
}
