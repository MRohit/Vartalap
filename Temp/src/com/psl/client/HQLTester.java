package com.psl.client;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.psl.beans.User;
import com.psl.utility.HibernateUtility;

public class HQLTester {
	public static void main(String[] args) {
		Session session=HibernateUtility.getSessionFactory().openSession();
		Query query = session.createQuery("from User");
		List<User> userList=query.list();
		for(User u:userList){
			System.out.println(u.getUserId());
			System.out.println(u.getUserName());
			System.out.println(u.getUserId());
			System.out.println(u.getUserId());
		}
	}
}
