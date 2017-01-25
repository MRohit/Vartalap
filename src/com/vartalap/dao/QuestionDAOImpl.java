package com.vartalap.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;

public class QuestionDAOImpl implements IQuestionDAO {


	private JdbcTemplate template;
	

	@Override
	public  List<Question> getQuestions() {
		return template.query("SELECT * FROM question q order by date DESC;", new RowMapper<Question>() {

			
			@Override
			public Question mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Question q = new Question();
				q.setQuestion_id(rs.getInt("question_id"));
				q.setTitle(rs.getString("title"));
				q.setDate(rs.getDate("date"));
				q.setDescription(rs.getString("description"));
				q.setViewCount(rs.getInt("views"));

				return q;
			}
			
		});

		}

	@Override
	public List<Question> getQuestionsByDate(Date post_date) {
		// TODO Auto-generated method stub
		return template.query("select * from question", new RowMapper<Question>() {

			
			@Override
			public Question mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Question q = new Question();
				q.setQuestion_id(rs.getInt("question_id"));
				q.setTitle(rs.getString("title"));
				q.setDate(rs.getDate("date"));
				q.setDescription(rs.getString("description"));
				q.setViewCount(rs.getInt("views"));

				return q;
			}
			
		});
		

	}

	@Override
	public List<Question> getQuestionsBySearch(String search) {
		// TODO Auto-generated method stub
		return template.query("select * from question where title like '%"+search+"%'", new RowMapper<Question>() {

			
			@Override
			public Question mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Question q = new Question();
				q.setQuestion_id(rs.getInt("question_id"));
				q.setTitle(rs.getString("title"));
				q.setDate(rs.getDate("date"));
				q.setDescription(rs.getString("description"));
				q.setViewCount(rs.getInt("views"));
				return q;
			}
			
		});

		
		

	}
	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int incrementViewCount(int question_id) {
		String sql = "select views from question where question_id="+question_id;
		System.out.println(sql);
		int count = template.queryForInt(sql);
		count+=1;
		System.out.println(sql);
		sql = "update question set views="+count+" where question_id="+question_id;
		return template.update(sql);
	}

	@Override
	public List<Question> getQuestionsByType(String type) {
			return template.query("select * from question where type='"+type+"'", new RowMapper<Question>() {

			
			@Override
			public Question mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Question q = new Question();
				q.setQuestion_id(rs.getInt("question_id"));
				q.setTitle(rs.getString("title"));
				q.setDate(rs.getDate("date"));
				q.setDescription(rs.getString("description"));
				q.setViewCount(rs.getInt("views"));
				return q;
			}
			
		});
	}

	@Override
	public int[] getCountByType() {
		int[] qcount = new int[3];
		System.out.println("select count(*) from question where type='technical'");
		qcount[0] = template.queryForInt("select count(*) from question where type='technical'");
		System.out.println("select count(*) from question where type='hr'");
		qcount[1] = template.queryForInt("select count(*) from question where type='hr'");
		System.out.println("select count(*) from question where type='admin'");
		qcount[2] = template.queryForInt("select count(*) from question where type='admin'");
		return qcount;
	}
	
	@Override
	public int[][] getAnsCountByType() {
		int[][] qcount = new int[3][2];
		System.out.println("select count(*) from question where type='technical'");
		qcount[0][0] = template.queryForInt("select count(*) from question where type='technical'");
		qcount[0][1]= template.queryForInt("select count(*) from Question where type='technical' and question_id in (select distinct(question_id) from answer)");
		
		System.out.println("select count(*) from question where type='hr'");
		qcount[1][0] = template.queryForInt("select count(*) from question where type='hr'");
		qcount[1][1]= template.queryForInt("select count(*) from Question where type='hr' and question_id in (select distinct(question_id) from answer)");
		
		System.out.println("select count(*) from question where type='admin'");
		qcount[2][0] = template.queryForInt("select count(*) from question where type='admin'");
		qcount[2][1]= template.queryForInt("select count(*) from Question where type='admin' and question_id in (select distinct(question_id) from answer)");
		
		return qcount;
	}

	@Override
	public List<Question> getUnansCountByType(String type) {
return template.query("select * from question where type='"+type+
		"' and question_id not in(select distinct(question_id) from answer)", new RowMapper<Question>() {
			
			@Override
			public Question mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Question q = new Question();
				q.setQuestion_id(rs.getInt("question_id"));
				q.setTitle(rs.getString("title"));
				q.setDate(rs.getDate("date"));
				q.setDescription(rs.getString("description"));
				q.setViewCount(rs.getInt("views"));
				return q;
			}
		});
	}

	@Override
	public List<Question> getUserQuestions(int userId) 
	{
			return template.query("select * from question where user_id="+userId, new RowMapper<Question>() {
				@Override
					public Question mapRow(ResultSet rs, int arg1)
							throws SQLException {
					Question q = new Question();
					q.setQuestion_id(rs.getInt("question_id"));
					q.setTitle(rs.getString("title"));
					q.setDate(rs.getDate("date"));
					q.setDescription(rs.getString("description"));
					q.setViewCount(rs.getInt("views"));
					return q;
				}
			});
		}

	@Override
	public List<Answer> getUserAnswers(int userId) 
	{
			return template.query("select * from answer where user_id="+userId, new RowMapper<Answer>() {
				
				@Override
					public Answer mapRow(ResultSet rs, int arg1)
							throws SQLException {
					Answer q = new Answer();
					q.setAnswer(rs.getString("answer"));
					q.setAnswer_id(rs.getInt("answer_id"));
					q.setRating(rs.getInt("rating"));
					return q;
				}
			});
		}


		@Override
		public List<Question> getQuestionsByTags(String tagname) {
			
			int tagId = template.queryForInt("select tag_id from tags where tag_name='"+tagname.toUpperCase()+"'");
			return template.query("select * from question where QUESTION_ID in (select question_id from question_tags where tag_id='"+tagId+"')", new RowMapper<Question>() {

				
				@Override
				public Question mapRow(ResultSet rs, int arg1)
						throws SQLException {
					Question q = new Question();
					q.setQuestion_id(rs.getInt(1));
					q.setTitle(rs.getString(3));
					q.setDate(rs.getDate(5));
					q.setDescription(rs.getString(2));
					q.setViewCount(rs.getInt("views"));
					return q;
				}
				
			});
		}

		@Override
		public List<Tags> getAllTags() {
			List<Tags> allTags = new ArrayList<Tags>();
			allTags.addAll(getTags("technical"));
			allTags.addAll(getTags("hr"));
			allTags.addAll(getTags("admin"));
			return allTags;
		}
		
		@Override
		public List<Tags> getTags(String skills) {
			return template.query("select * from tags where tag_type='"+skills+"'", new RowMapper<Tags>() {

				
				@Override
				public Tags mapRow(ResultSet rs, int arg1)
						throws SQLException {
					Tags tag = new Tags();
					tag.setTag_id(rs.getInt("tag_id"));
					tag.setTag_name(rs.getString("tag_name"));
					tag.setTag_type(rs.getString("tag_type"));
					return tag;
				}
				
			});
		}
		
		
	}

