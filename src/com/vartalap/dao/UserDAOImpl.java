package com.vartalap.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;








import javax.persistence.Lob;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mysql.jdbc.PreparedStatement;
import com.vartalap.model.Answer;
import com.vartalap.model.Question;
import com.vartalap.model.Tags;
import com.vartalap.model.User;

public class UserDAOImpl implements IUserDAO {

	private JdbcTemplate template;
	
	
	@Override
	public void addUser(User user,String password) {
		// TODO Auto-generated method stub
		SimpleDateFormat sf=new SimpleDateFormat("yyyy/mm/dd");
		String birthday2=sf.format(user.getDOB());
		System.out.println("insert into user(first_name,middle_name,last_name,email,dob,gender,user_name,skills) values('"+user.getFirstName()+"','"+user.getMiddleName()+"','"+user.getLastName()+"','"+user.getEmail()+"','"+birthday2+"','"+user.getGender()+"','"+user.getUserName()+"','"+user.getSkills()+"')");
		template.execute("insert into user(first_name,middle_name,last_name,email,dob,gender,user_name,skills) values('"+user.getFirstName()+"','"+user.getMiddleName()+"','"+user.getLastName()+"','"+user.getEmail()+"','"+birthday2+"','"+user.getGender()+"','"+user.getUserName()+"','"+user.getSkills()+"')");
		
		
		System.out.println("insert into login(userName,password) values('"+user.getUserName()+"','"+password+"')");
		template.execute("insert into login(userName,password) values('"+user.getUserName()+"','"+password+"')");
		
	}

	@Override
	public void postQuestion(Question questions,int id) {
		// TODO Auto-generated method stub
		
		questions.setDescription(questions.getDescription().replaceAll("\r\n", " ").replaceAll("'", "\\'"));
		
		////String arr[]=;
		//arr[0]=questions.getDescription();
		//String title=template.queryforS
		System.out.println("insert into question(title,description,type,user_id,date) values('"+questions.getTitle().trim()+"',quote("+questions.getDescription().trim()+"),'"+questions.getType().trim()+"','"+id+"','"+new Timestamp(System.currentTimeMillis())+"')");
		
		System.out.println("select question_id from question where title='"+questions.getTitle()+"' and user_id="+id);
		try{
			template.execute("insert into question(title,description,type,user_id,date) values('"+questions.getTitle().trim()+"','"+questions.getDescription().trim()+"','"+questions.getType().trim()+"','"+id+"','"+new Timestamp(System.currentTimeMillis())+"')");
			int qid = template.queryForInt("select question_id from question where title='"+questions.getTitle()+"' and user_id="+id);
		
			for (Tags tag : questions.getTagList()) {
				int tagId=0;
				try {
					 tagId = template.queryForInt("select tag_id from tags where tag_name='"+tag.getTag_name().toUpperCase()+"'");
				}catch(EmptyResultDataAccessException e){
					//tagId=0;
					System.out.println("insert into tags (tag_name,tag_type) values('"+tag.getTag_name()+"','"+questions.getType()+"')");
					template.execute("insert into tags (tag_name,tag_type) values('"+tag.getTag_name()+"','"+questions.getType()+"')");
					System.out.println("Tag not present");
					System.out.println("select tag_id from tags where tag_name='"+tag.getTag_name().toUpperCase()+"'");
					tagId = template.queryForInt("select tag_id from tags where tag_name='"+tag.getTag_name().toUpperCase()+"'");
				}
				
				template.execute("insert into question_tags (question_id, tag_id) values("+qid+","+tagId+")");
					//System.out.println("insert into question_tags (question_id, tag_id)values("+qid+","+tagId+")");
			}
		}catch(IncorrectResultSizeDataAccessException e){
			
		}
		catch(DuplicateKeyException e){
			
		}
		
	}
	
	@Override
	public void postAnswer(Answer answers,int question_id, int user_id) {
		try{
			String ans = answers.getAnswer().replace("'", "\\'");
			answers.setAnswer(ans);
			String sql = "insert into answer(answer_id, rating, date, answer,user_id,question_id) values('"+answers.getAnswer_id()+"','"+answers.getRating()+"','"+new Timestamp(System.currentTimeMillis())+"','"+answers.getAnswer().trim()+"','"+user_id+"','"+question_id+"')";
			System.out.println(sql);
			template.execute(sql);
		}catch(DuplicateKeyException e){
			
		}
		
	}

	@Override
	public void addTag(Tags tags) {
		// TODO Auto-generated method stub

	}

	@Override
	public void rateAnswer(int rating, int ans_id) {
		// TODO Auto-generated method stub
		String sql2="select rating from answer where answer_id="+ans_id+"";
		int avgrate=template.queryForInt(sql2);
		avgrate=(rating+avgrate)/2;
		String sql = "update answer set rating="+avgrate+" where answer_id="+ans_id+"";
		System.out.println(sql);
		template.execute(sql);
	}
	
	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int getUserId(String userName) {
		// TODO Auto-generated method stub
		String sql="select user_id from user where user_name='"+userName.trim()+"'";
		System.out.println(sql);
		List<Integer> s=template.query("select user_id from user where user_name='"+userName.trim()+"'",new RowMapper<Integer>(){
		int id=0;
			@Override
			public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				System.out.println(rs.getInt(1));
				id=rs.getInt(1);
						
				return id;
			}
			
		});
		int id=s.get(0);
		return id;
	}

	@Override
	public User getUserDetails(int question_id) {
		// TODO Auto-generated method stub
		String sql="select user_id from question where question_id='"+question_id+"'";
		int id=template.queryForInt(sql);
				
		System.out.println("user Id:"+id);
		return getUserById(id);
	}
	@Override
	public  List<Answer> getAnswers(int question_id) {
		return template.query("select * from answer where question_id='"+question_id+"'", new RowMapper<Answer>() {

			
			@Override
			public Answer mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Answer ans=new Answer();
				///ans.setAnswer_id(rs.getString(1));
						
				ans.setAnswer(rs.getString("answer"));
				ans.setDate(rs.getDate("date"));
				ans.setRating(rs.getInt("rating"));
				ans.setAnswer_id(rs.getInt("answer_id"));
				ans.setUser_id(rs.getInt("user_id"));
				return ans;
			}
			
		});
		
	}
	
	@Override
	public User getUserProfile(String userName) {
		//User u=new User();
		
	
				
		System.out.println("in dao user name:"+userName);
		String sql = "select * from user where user_name like'"+userName+"'";
		System.out.println(sql);
		User user=template.queryForObject(sql, new RowMapper<User>(){

			@Override
			public User mapRow(ResultSet rs, int arg1) throws SQLException {
			
				User u =new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setFirstName(rs.getString("first_name").toUpperCase());
				u.setMiddleName(rs.getString("middle_name"));
				u.setLastName(rs.getString("last_name").toUpperCase());
				u.setEmail(rs.getString("email"));
				u.setSkills(rs.getString("skills").toUpperCase());
				u.setDOB(rs.getDate("dob"));
				u.setGender(rs.getString("gender"));
				
			return u;
		
			}
		});
		System.out.println(user);
		return user;
}

public User getUserById(int user_id){
	String sql = "select * from user where user_id="+user_id;
	User user=template.queryForObject(sql, new RowMapper<User>(){

		@Override
		public User mapRow(ResultSet rs, int arg1) throws SQLException {
		
			User u =new User();
			u.setUser_id(rs.getInt("user_id"));
			u.setFirstName(rs.getString("first_name"));
			u.setMiddleName(rs.getString("middle_name"));
			u.setLastName(rs.getString("last_name"));
			u.setEmail(rs.getString("email"));
			
			u.setDOB(rs.getDate("dob"));
			u.setGender(rs.getString("gender"));
			
			return u;
		}
		
	});
	System.out.println(user);
	return user;
}
}
