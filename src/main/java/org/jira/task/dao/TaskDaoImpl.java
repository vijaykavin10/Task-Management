package org.jira.task.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.jira.task.table.Comment;
import org.jira.task.table.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDaoImpl implements TaskDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveTask(Task task) {
		sessionFactory.getCurrentSession().saveOrUpdate(task);
	}
	
	public void saveComment(Comment comment) {
		sessionFactory.getCurrentSession().save(comment);
	}

	@SuppressWarnings("unchecked")
	public List<Task> getAllTasks() {
		String sql = "FROM Task ORDER BY id DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Task> getTaskByAssignee(String assignee) {
		String sql = "FROM Task WHERE assignee = :assignee ORDER BY id DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("assignee", assignee);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Task> getTaskReportedByMe(String reporter) {
		String sql = "FROM Task WHERE reporter = :reporter ORDER BY id DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("reporter", reporter);
		return query.list();
	}
	
	public Task getTask(Integer taskId) {
		String sql = "FROM Task WHERE id = :taskId";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("taskId", taskId);
		Task task = null;
		if(query.list().size() > 0) {
			task = (Task) query.list().get(0);
		}
		return task;
	}
	
	@SuppressWarnings("unchecked")
	public Comment getComment(int commentId) {
		String sql = "FROM Comment WHERE commentId = :commentId";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("commentId", commentId);
		Comment comment = null;
		List<Comment> commentList = query.list();
		if(commentList.size() > 0) {
			comment = commentList.get(0);
		}
		return comment;
	}
	
	public void deleteComment(Comment comment) {
		sessionFactory.getCurrentSession().delete(comment);		
	}
		
}
