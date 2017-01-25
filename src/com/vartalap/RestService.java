package com.vartalap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.vartalap.model.Question;
import com.vartalap.model.Tags;
@Path("/resource")
public class RestService {
	static Connection conn = null;
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connecting to database...");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vartalap_db","root","root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*@Autowired
	private VartalapService service;*/
	@GET
	public String hello(){
		return "Hello world";
	}
	
	
	@POST
	@Path("/login")
	public String loginRegistration(){
		return "Hello world";
	}
	
	@GET
	@Path("/11")
	public Response example11(@QueryParam("search") String search){
		//Tags product =new Tags();
		System.out.println("searching:"+search);
		Tags product =new Tags();
		product.setTag_id(1);
		return Response
				.ok()
				.entity(product.toString())
				.type("text/plain")
				.build();
		
	}
	
	@GET
	@Path("/10")
	public Response exampl10(){
		
		//Response API provides more control over what we want to send in the respond
		ResponseBuilder rBuilder=Response.ok();//status code
		
		rBuilder.header("content-type", "text/html");//any inbuilt custom header
		rBuilder.entity("<h1>Response from example 10</h1>");//entity comprises of response body
		//rBuilder.cookie(new NewCookie("username", "Rohit"));//setting cookies and sending the cookies
		
		return rBuilder.build();
	}
	@POST
	@Path("/12")
	public Response example111(@FormParam("keyword") String keyword) throws SQLException{
		//Tags product =new Tags();
		//product.setTag_id(1);
		//product.setTag_name("Hello");
		//System.out.println("In service");
		/*
		Map<Data,Value> bean = new HashMap<Data, Value>();
		bean.put(new Data("check"), new Value("How to check ?"));
		bean.put(new Data("look"), new Value("How to look?"));*/
		System.out.println(keyword);
		List<Question> list = null;
			
		    Statement stmt = conn.createStatement();
		    String sql = "select * from question where title like '%"+keyword+"%' ORDER BY views DESC LIMIT 0,5";
		    list= new ArrayList<Question>();
		    ResultSet rs = stmt.executeQuery(sql);
		    while(rs.next()){
		    	Question q = new Question();
		    	q.setQuestion_id(rs.getInt("question_id"));
		    	q.setTitle(rs.getString("title"));
		    	q.setDate(rs.getDate("date"));
		    	list.add(q);
		    }
		
	      /*System.out.println(list);*/
		
		String link="";
		for (Question question : list) {
			link+= "<a href='viewanswer?question_id="+question.getQuestion_id()+"'>"+question.getTitle()+"</a><br>";
			
		}
		System.out.println(link);
		
		System.out.println("in Service");
		return Response
				.ok()
				.entity(link)
				.type("text/html")
				.build();
	}

}
