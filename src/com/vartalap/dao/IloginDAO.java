package com.vartalap.dao;

public interface IloginDAO {
	public Boolean validateUser(String userName,String password);
	public void logout(String userName,String password);
}
