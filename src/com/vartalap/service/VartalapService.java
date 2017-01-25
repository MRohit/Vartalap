package com.vartalap.service;

import java.util.Comparator;
import java.util.List;

import com.vartalap.dao.IQuestionDAO;
import com.vartalap.dao.IUserDAO;
import com.vartalap.dao.IloginDAO;
import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;
import com.vartalap.model.User;

public class VartalapService {
	
	private IUserDAO dao;
	private IloginDAO loginDao;
	private IQuestionDAO questionDao;
	
	public void addUser(User user,String password){
		dao.addUser(user,password);
	}
	public  List<Answer> getAnswers(int question_id) {
		return dao.getAnswers(question_id);
	}
	public void postQuestion(Question questions,int id){
		dao.postQuestion(questions,id);
	}
	
	public void postAnswer(Answer answers, int question_id, int user_id){
		dao.postAnswer(answers,question_id,user_id);
	}
	
	public void addTag(Tags tags){
		dao.addTag(tags);
	}
	
	public void rateAnswer(int rating, int ans_id){
		dao.rateAnswer(rating, ans_id);
	}
	
	public IUserDAO getDao() {
		return dao;
	}
	public Boolean validateUser(String userName, String password){
		System.out.println("In Service"+userName+"  pass:"+password);
		
		return loginDao.validateUser(userName, password);
	}

	public void setDao(IUserDAO dao) {
		this.dao = dao;
	}

	public IloginDAO getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(IloginDAO loginDao) {
		this.loginDao = loginDao;
	}
	public int getUserId(String userName){
		return dao.getUserId(userName);
	}

	public List<Question> getQuestions() {
		List<Question> list=questionDao.getQuestions();
		java.util.Collections.sort(list, new Comparator<Question>() {

			@Override
			public int compare(Question o1, Question o2) {
				// TODO Auto-generated method stub
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		return list;
		
	}

	public IQuestionDAO getQuestionDao() {
		return questionDao;
	}

	public void setQuestionDao(IQuestionDAO questionDao) {
		this.questionDao = questionDao;
	}

	public User getUserDetails(int question_id) {
		return dao.getUserDetails(question_id);
	}
	public List<Question> getQuestionsBySearch(String keyword) {
		// TODO Auto-generated method stub
		return questionDao.getQuestionsBySearch(keyword);
	}
	public User getUserProfile(String userNname){
		
		return dao.getUserProfile(userNname);
		
	}
	public int incrementViewCount(int question_id) {
		return questionDao.incrementViewCount(question_id);
	}
	public List<Question> getQuestionsByType(String type) {
		return questionDao.getQuestionsByType(type);
	}
	public int[] getCountByType() {
		// TODO Auto-generated method stub
		return questionDao.getCountByType();
	}
	
	public int[][] getAnsCountByType() {
		return questionDao.getAnsCountByType();
	}
	
	public List<Question> getQuestionsByTags(String tagname) {
		return questionDao.getQuestionsByTags(tagname);
	}
	public List<Question> getUnansCountByType(String type) {
		// TODO Auto-generated method stub
		return questionDao.getUnansCountByType(type);
	}
	public List<Question> getUserQuestions(int user_id) {
		// TODO Auto-generated method stub
		return questionDao.getUserQuestions(user_id);
	}
	public List<Answer> getUserAnswers(int user_id) {
		// TODO Auto-generated method stub
		return questionDao.getUserAnswers(user_id);
	}
	public List<Tags> getTags(String skills) {
		return questionDao.getTags(skills);
	}
	public List<Tags> getAllTags() {
		
		return questionDao.getAllTags();
	}
	public User getUserById(int user_id) {
		
		return dao.getUserById(user_id);
	}
}
