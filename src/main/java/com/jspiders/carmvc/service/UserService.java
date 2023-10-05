package com.jspiders.carmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.carmvc.pojo.UserPojo;
import com.jspiders.carmvc.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository repository;

	public UserPojo getAdmin() {
		UserPojo user = repository.getAdmin();
		return user;
	}

	public UserPojo createAccount(String username, String password) {
		if(password.length()>5) {
		UserPojo user = repository.createAccount(username, password);
		return user;
		}
		return null;
	}

	public UserPojo login(String username, String password) {
		UserPojo user = repository.login(username, password);
		return user;
	}

	
	
	

	

}