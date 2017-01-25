package com.vartalap.dao;


import com.vartalap.model.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import com.vartalap.model.User;


public class UserDAO {
 
 public ArrayList<Question> getUsers(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
  
  ArrayList<Question> userList = new ArrayList<Question>();
  Database db = new Database();
  Connection connection = db.getConnection();
  
  try{
   PreparedStatement ps = connection.prepareStatement("SELECT * FROM question WHERE title like ?");
   ps.setString(1, "%" +s+"%");
   ResultSet rs = ps.executeQuery();
   
   while(rs.next()){
    Question user = new Question();
    user.setQuestion_id(rs.getInt("question_id"));
    user.setTitle(rs.getString("title"));
    userList.add(user);
   }
  }catch(Exception e){
   e.printStackTrace();
  }
  return userList;
 }
}

