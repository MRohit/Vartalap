package com.psl.client;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.psl.beans.*;
import com.psl.utility.HibernateUtility;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Vehicle v1=new Vehicle(112,"Honda");
		User user1=new User(101,"TOM");
		Set<Vehicle> vehicleSet=new HashSet<Vehicle>();
		vehicleSet.add(v1);
		
		user1.setVehicle(vehicleSet);
		
		Set<User> userSet=new HashSet<User>();
		userSet.add(user1);
		v1.setUsers(userSet);
		
		
		
		
		
		
		//Vehicle v1=new Vehicle(1, "2123", user);
		
		
		
		//Vehicle v2=new Vehicle(2,"Maruti");
		
		
		
		
		/*
		//User user2=new User(102,"TOM");
		v1.setUsers(userSet);
		user1.setVehicle(vehicleSet);
		vehicleSet.add(v1);
		//vehicleSet.add(v2);
		userSet.add(user1);
		//userSet.add(user2);
		user1.setVehicle(vehicleSet);
		//user2.setVehicle(vehicleSet);
		
		v1.setUsers(userSet);
		//v2.setUsers(userSet);
*/		
		
		
		
		
		SessionFactory sf=HibernateUtility.getSessionFactory();
		Session session=sf.openSession();
		try{
			session.beginTransaction();
			//session.save(vehicle);
			session.save(user1);
			//session.save(user2);
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error");
		}
		session.close();
		/*try{
		Session session1=sf.openSession();
		session1.beginTransaction();
		Integer i=new Integer(101);
		User u=(User)session1.get(User.class, i);
		System.out.println(u.getUserId());
		System.out.println(u.getUserName());
		System.out.println(u.getVehicle());
		}catch(Exception e){
			System.out.println("Error");
		}*/
	}

}
