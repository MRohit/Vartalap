package com.vartalap.model;

import java.util.List;
import java.util.Set;

public class Tags {

	int tag_id;
	String tag_name,tag_type;
	Set<Question>questionList;
	
	public Tags(){
	
	}
	public Set<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(Set<Question> questionList) {
		this.questionList = questionList;
	}
	public Tags(int tag_id, String tag_name, String tag_type) {
		super();
		this.tag_id = tag_id;
		this.tag_name = tag_name;
		this.tag_type = tag_type;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public String getTag_type() {
		return tag_type;
	}
	public void setTag_type(String tag_type) {
		this.tag_type = tag_type;
	}
	@Override
	public String toString() {
		return "Tags [tag_id=" + tag_id + ", tag_name=" + tag_name
				+ ", tag_type=" + tag_type + ", questionList=" + questionList
				+ "]";
	}
		
}
