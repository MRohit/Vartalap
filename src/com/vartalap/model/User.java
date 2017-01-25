package com.vartalap.model;

import java.util.Date;
import java.util.List;

public class User {

	int user_id;
	String firstName,middleName,lastName;
	String userName;
	String email;
	String gender,skills;
	long contact_no;
	Date DOB;
	
	List<Question>questionList;
	
	public List<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	public List<Answer> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}
	List<Answer>answerList;
	public User(){
		
	}
	public User(int user_id, String first_name, String middle_name,
			String last_name, String email, long contact_no, Date dOB) {
		super();
		this.user_id = user_id;
		this.firstName = first_name;
		this.middleName = middle_name;
		this.lastName = last_name;
		this.email = email;
		this.contact_no = contact_no;
		DOB = dOB;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getContact_no() {
		return contact_no;
	}
	public void setContact_no(long contact_no) {
		this.contact_no = contact_no;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", firstName=" + firstName
				+ ", middleName=" + middleName + ", lastName=" + lastName
				+ ", userName=" + userName + ", email=" + email + ", gender="
				+ gender + ", skills=" + skills + ", contact_no=" + contact_no
				+ ", DOB=" + DOB + ", questionList=" + questionList
				+ ", answerList=" + answerList + "]";
	}
	
	
}
