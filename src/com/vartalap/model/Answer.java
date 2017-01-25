package com.vartalap.model;

import java.util.Date;
import java.util.List;

public class Answer {

	int answer_id, rating;
	Date date;
	String answer;
	int user_id;
	User user;
	/*List<Question>questionList;
	List<User>userList;*/
	/*
	public List<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}*/
	public Answer(){
		
	}
	public Answer(int answer_id, int rating, Date date, String answer) {
		super();
		this.answer_id = answer_id;
		this.rating = rating;
		this.date = date;
		this.answer = answer;
	}

	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
