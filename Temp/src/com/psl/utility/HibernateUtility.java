package com.psl.utility;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtility {
	static SessionFactory sessionFactory=null;
	
	public static SessionFactory getSessionFactory(){
		Configuration config=new Configuration();
		config.configure();
		
		//generated for per database and it is very heavy object
		//session factory object are not thread safe objects
		sessionFactory = config.buildSessionFactory();
		
		//create small session
		return sessionFactory;
		
	}
}