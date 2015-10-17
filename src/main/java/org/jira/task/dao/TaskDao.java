package org.jira.task.dao;

import java.util.List;

import org.jira.task.table.Comment;
import org.jira.task.table.Task;

public interface TaskDao {

	void saveTask(Task task);

	List<Task> getAllTasks();

	Task getTask(Integer taskId);

	void saveComment(Comment comment);

	Comment getComment(int commentId);

	void deleteComment(Comment comment);

	List<Task> getTaskByAssignee(String assignee);

	List<Task> getTaskReportedByMe(String reporter);

}
