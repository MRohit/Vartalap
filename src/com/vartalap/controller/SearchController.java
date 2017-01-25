package com.vartalap.controller;

import com.vartalap.dao.*;
import com.vartalap.model.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
 private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SearchController() {
  
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
  String text = request.getParameter("term");
  System.out.println("Hello from Get Method: " +text);
 // Question question = new Question();
  try {
   UserDAO userDAO=new UserDAO();
ArrayList<Question> users  = userDAO.getUsers(text);
   for(Question user: users){
    System.out.println(user.getTitle());
   }
   
   String searchResult = new Gson().toJson(users);
   
   PrintWriter writer = response.getWriter();
   writer.write(searchResult);
  
  }catch(Exception e){
   e.printStackTrace();
  }
  
 }

 

}
