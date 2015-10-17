package org.jira.task.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.jira.task.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User getUser(String userName) {
		String sql = "FROM User WHERE username=:userName";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("userName", userName);
		List<User> userList = query.list();
		User user = null;
		if (userList != null && userList.size() > 0) {
			user = (User) userList.get(0);
		}
		return user;
	}

		
	public User getUserDetail(String firstName, String lastName, String email,
			String userName, String password) {
		String sql = "Select * FROM User WHERE username=:userName";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.executeUpdate();
		User user = (User) query.list();
		return user;
	}

	public User insertUser(User user) {
		sessionFactory.getCurrentSession().save(user);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getAllUserNames() {
		String sql = "SELECT username FROM user";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<String> usernames = query.list();
		return usernames;
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllUser() {
		String sql = "FROM User ORDER BY id DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		List<User> userList = query.list();
		return userList;
	}
	
}
