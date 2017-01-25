package com.vartalap.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class Question {

	int question_id;
	String description, title,type;
	Date date;
	int noOfAnswers;
	User user = new User();
	int viewCount;
	Set<Tags> tagList;
	
	/*public List<Answer> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}*/
	
	public User getUser() {
		return user;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getNoOfAnswers() {
		return noOfAnswers;
	}
	public void setNoOfAnswers(int noOfAnswers) {
		this.noOfAnswers = noOfAnswers;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Tags> getTagList() {
		return tagList;
	}
	public void setTagList(Set<Tags> tagList) {
		this.tagList = tagList;
	}
	
	public Question(){
		
		
	}
	public Question(int question_id, String description, String title,
			String type, Date date) {
		super();
		this.question_id = question_id;
		this.description = description;
		this.title = title;
		this.type = type;
		this.date = date;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", description="
				+ description + ", title=" + title + ", type=" + type
				+ ", date=" + date + ", noOfAnswers=" + noOfAnswers + ", user="
				+ user + ", viewCount=" + viewCount + ", tagList=" + tagList
				+ "]";
	}
	
}
