package org.jira.task.service;

import java.util.List;

import org.jira.task.table.Task;

public interface TaskService {

	void saveTask(Task task);

	List<Task> getAllTask();

	Task getTask(Integer taskId);

	void createTask(String title, String description, String assignee,
			String issueType, String componentType, String priorityType,
			String comment, String reporter);

	void createComment(int taskId, String comment, String createdUser);

	void updateComment(int commentId, String data);

	void updateTask(int taskId, String title, String description,
			String assignee, String issueType, String componentType,
			String priorityType);

	void updateTaskStatus(int taskId, String status);

	void updateTaskResolution(int taskId, String resolution);

	void deleteComment(int commentId);

	List<Task> getTaskByAssignee(String assignee);

	List<Task> getTaskReportedByMe(String reporter);

}
