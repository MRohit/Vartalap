package com.vartalap.dao;

import java.util.List;

import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;
import com.vartalap.model.User;

public interface IUserDAO {
	
	public void addUser(User user,String password);
	public void postQuestion(Question questions,int id);
	public void postAnswer(Answer answers,int question_id, int user_id);
	public void addTag(Tags tags);
	public void rateAnswer(int rating, int ans_id);
	public int getUserId(String  userName);
	public User getUserDetails(int question_id);
	List<Answer> getAnswers(int question_id);
	User getUserProfile(String userName);
	public User getUserById(int user_id);
}
