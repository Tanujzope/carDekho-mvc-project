package com.jspiders.carmvc.repository;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspiders.carmvc.pojo.UserPojo;

@Repository
public class UserRepository {
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private  static Query query;
	
	private static void openConnection() {
		factory = Persistence.createEntityManagerFactory("carmvc");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}
	
	private static void closeConnection() {
		if (factory!= null) {
			factory.close();
		}
		
		if (manager!= null) {
			manager.close();
		}
		if (transaction!= null) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
		}
	

	}

	public UserPojo getAdmin() {
		openConnection();
		transaction.begin();
		
		String jpql = "from UserPojo";;
		query = manager.createQuery(jpql);
		
		List<UserPojo> users = query.getResultList();
		if (!users.isEmpty()) {
			for(UserPojo user :users) {
				transaction.commit();
				closeConnection();
				return user;
			}
		}
		
		transaction.commit();
		closeConnection();
		return null;
	}

	public UserPojo createAccount(String username, String password) {
		openConnection();
		transaction.begin();
		
		UserPojo user = new UserPojo();
		user.setUsername(username);
		user.setPassword(password);
		manager.persist(user);
		
		transaction.commit();
		closeConnection();
		return user;
	}

	public UserPojo login(String username, String password) {
		openConnection();
		transaction.begin();
		
		String jpql = "select u from UserPojo u where u.username = '"+username +"' and u.password = '"+password+"'";
		query = manager.createQuery(jpql);
		
		List<UserPojo> users = query.getResultList();
		
		if (!users.isEmpty()) {
			for(UserPojo user :users) {
				transaction.commit();
				closeConnection();
				return user;
			}
		}
		transaction.commit();
		closeConnection();
		return null;
		
	}
	

	
}