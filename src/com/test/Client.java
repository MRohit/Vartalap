package com.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.vartalap.model.Question;
import com.vartalap.model.Tags;
import com.vartalap.model.User;

public class Client {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		User user=new User(0, "Gokul", "M", "Bargaje", "gb@gmail.com", 9421991682L, new Date(System.currentTimeMillis()));
		Question question = new Question(0, "Webrelated", "WHow to configure web.xml file?", "Web tyoe", new java.util.Date());
		user.setUserName("gokul123");
		user.setGender("Male");
		user.setSkills("technical");
		Tags tags=new Tags(100, "PHP", "technical");
		Set<Tags> list=new HashSet<Tags>();
		list.add(tags);
		list.add(new Tags(102, "HTM", "Admin"));
		question.setTagList(list);
		Configuration config=new Configuration();
		config.configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session=sessionFactory.openSession();
		try{
			session.beginTransaction();
			session.save(user);
			session.save(question);
			
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error");
		}
		session.close();
	}

}
