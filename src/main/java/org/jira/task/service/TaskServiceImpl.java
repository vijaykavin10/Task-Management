package org.jira.task.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.jira.task.dao.TaskDao;
import org.jira.task.table.Comment;
import org.jira.task.table.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskDao taskDao;
	
	public void saveTask(Task task) {
		taskDao.saveTask(task);
	}
	
	public List<Task> getAllTask() {
		return taskDao.getAllTasks();
	}
	
	public List<Task> getTaskByAssignee(String assignee) {
		return taskDao.getTaskByAssignee(assignee);
	}
	
	public List<Task> getTaskReportedByMe(String reporter) {
		return taskDao.getTaskReportedByMe(reporter);
	}
	
	public Task getTask(Integer taskId) {
		return taskDao.getTask(taskId);
	}
	
	public void createTask(String title, String description, String assignee, String issueType, String componentType, String priorityType, String comment, String reporter) {
		Task task = new Task(title, description, assignee, issueType, componentType, priorityType, reporter);
		taskDao.saveTask(task);
		if(comment != null && !comment.isEmpty()) {
			Comment commentModel = new Comment(comment, reporter, task);
			taskDao.saveComment(commentModel);
		}
	}
	
	public void createComment(int taskId, String comment, String createdUser) {
		Task task = taskDao.getTask(taskId);
		Comment commentModel = new Comment(comment, createdUser, task);
		taskDao.saveComment(commentModel);
	}
	
	public void updateComment(int commentId, String data) {
		Comment comment = taskDao.getComment(commentId);
		comment.setComment(data);
		taskDao.saveComment(comment);
	}
	
	@Override
	public void updateTask(int taskId, String title, String description, String assignee, String issueType, String componentType, String priorityType) {
		Task task = taskDao.getTask(taskId);
		task.setTitle(title);
		task.setDescription(description);
		task.setAssignee(assignee);
		task.setIssueType(issueType);
		task.setComponentType(componentType);
		task.setPriority(priorityType);
		task.setLastModified(new Date());
		taskDao.saveTask(task);
	}
	
	@Override
	public void updateTaskStatus(int taskId, String status) {
		Task task = taskDao.getTask(taskId);
		task.setStatus(status);
		task.setLastModified(new Date());
		taskDao.saveTask(task);
	}
	
	@Override
	public void updateTaskResolution(int taskId, String resolution) {
		Task task = taskDao.getTask(taskId);
		if(resolution.equalsIgnoreCase("fixed")) {
			task.setStatus("RESOLVED");
			task.setResolution("FIXED");
		}
		if(resolution.equalsIgnoreCase("REOPEN")) {
			task.setStatus("REOPENED");
			task.setResolution("UNRESOLVED");
		}
		task.setLastModified(new Date());
		taskDao.saveTask(task);
	}
	
	public void deleteComment(int commentId) {
		Comment comment = taskDao.getComment(commentId);
		taskDao.deleteComment(comment);
	}
}
