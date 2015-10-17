package org.jira.task.service;

import java.util.List;

import javax.transaction.Transactional;

import org.jira.task.dao.UserDao;
import org.jira.task.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	public User getUserDetails(String firstName, String lastName, String email, String userName,String password) {
		User userDetails= userDao.getUserDetail(firstName, lastName, email, userName, password);
		return userDetails;
	}
	
	public boolean validateUser(String userName, String password) {
		User user = userDao.getUser(userName);
		boolean status = false;
		if(user != null && password != null && password.equals(user.getPassword())) {
			status = true;
		}
		return status;
	}
	
	public User getUser(String userName) {
		return userDao.getUser(userName);
	}
	
	public String registerUser(String firstName, String lastName, String email, String userName,String password,String userType) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setUserName(userName);
		user.setPassword(password);
		user.setUserType("user");
		userDao.insertUser(user);
		String status="Enter correct information";
		if(user !=null && firstName!=null && lastName !=null && email !=null && userName!=null && password !=null && userType!=null)
		{
			status=userName +", Congratulation ! You are SignUp Successfully...!";
		}
			return status;
	}
	
	@Override
	public List<String> getAllUserNames() {
		return userDao.getAllUserNames();	
	}
	
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	public User insertUser(User user) {
		return userDao.insertUser(user);
	}
}
