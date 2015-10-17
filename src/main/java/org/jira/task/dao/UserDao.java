package org.jira.task.dao;

import java.util.List;

import org.jira.task.table.User;

public interface UserDao {

	User getUser(String userName);

	User getUserDetail(String firstName,String lastName,String email,String userName,String password);

	User insertUser(User user);

	List<String> getAllUserNames();

	List<User> getAllUser();
}
