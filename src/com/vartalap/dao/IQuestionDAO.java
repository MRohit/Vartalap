package com.vartalap.dao;

import java.util.Date;
import java.util.List;

import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;

public interface IQuestionDAO {
	public List<Question> getQuestions();
	public List<Question> getQuestionsByDate(Date post_date);
	List<Question> getQuestionsBySearch(String search);
	public int incrementViewCount(int question_id);
	public List<Question> getQuestionsByType(String type);
	public int[] getCountByType();
	int[][] getAnsCountByType();
	public List<Question> getQuestionsByTags(String tagname);
	List<Question> getUnansCountByType(String type);
	List<Question> getUserQuestions(int userId);
	List<Answer> getUserAnswers(int userId);
	public List<Tags> getTags(String skills);
	List<Tags> getAllTags();
}
