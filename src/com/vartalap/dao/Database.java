package com.vartalap.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
 
 public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
  
  Connection connection =  null;
  
  // Store the database URL in a string
  String url = "jdbc:mysql://localhost:3306/vartalap_db"; 
  
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  
  // set the url, username and password for the databse 
  connection = DriverManager.getConnection(url,"root","root");   
  return connection;
  
 }
}