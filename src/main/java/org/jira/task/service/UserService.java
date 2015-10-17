package org.jira.task.service;

import java.util.List;

import org.jira.task.table.User;

public interface UserService {

	User getUserDetails(String firstName, String lastName, String email, String userName,String password);
	
	boolean validateUser(String userName, String password);

	String registerUser(String firstName, String lastName, String email, String userName,String password,String userType);

	User getUser(String userName);
	
	List<String> getAllUserNames();

	List<User> getAllUser();

	User insertUser(User user);
}

