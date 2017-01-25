package com.psl.beans;

import java.util.*;


public class Vehicle  {
	public Vehicle(int vehicleId, String make, Set<User> users) {
		super();
		this.vehicleId = vehicleId;
		this.make = make;
		this.users = users;
	}
	public Vehicle(int vehicleId, String make) {
		super();
		this.vehicleId = vehicleId;
		this.make = make;
	}
	public Vehicle() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int vehicleId;
	private String make;
	private Set<User> users=new HashSet<User>();
	public int getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
