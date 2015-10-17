package org.jira.task.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jira.task.service.TaskService;
import org.jira.task.service.UserService;
import org.jira.task.table.Comment;
import org.jira.task.table.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/task")
public class TaskController extends BaseController {

	@Autowired
	private TaskService taskService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value = "/{userName}/create", method = RequestMethod.POST)
	public ModelAndView createTask(
			HttpServletRequest request,
			@PathVariable(value = "userName") String userName,
			@RequestParam(value = "title", required = true) String title,
			@RequestParam(value = "description", required = true) String description,
			@RequestParam(value = "assignee", required = true) String assignee,
			@RequestParam(value = "issueType", required = true) String issueType,
			@RequestParam(value = "componentType", required = true) String componentType,
			@RequestParam(value = "priorityType", required = true) String priorityType,
			@RequestParam(value = "comment", required = true) String comment,
			HttpServletResponse response) {
		taskService.createTask(title, description, assignee, issueType, componentType, priorityType, comment, userName);
		return prepareTaskView(userName);
	}
	
	@RequestMapping(value = "/{userName}/{taskId}/update", method = RequestMethod.POST)
	public ModelAndView updateTask(
			HttpServletRequest request,
			@PathVariable(value = "userName") String userName,
			@PathVariable(value = "taskId") int taskId,
			@RequestParam(value = "title", required = true) String title,
			@RequestParam(value = "description", required = true) String description,
			@RequestParam(value = "assignee", required = true) String assignee,
			@RequestParam(value = "issueType", required = true) String issueType,
			@RequestParam(value = "componentType", required = true) String componentType,
			@RequestParam(value = "priorityType", required = true) String priorityType,
			HttpServletResponse response) {
		taskService.updateTask(taskId, title, description, assignee, issueType, componentType, priorityType);
		return getIntoTaskView(userName, taskId);
	}

	@RequestMapping(value="/{userName}/getView", method = RequestMethod.GET)
	public ModelAndView getToTaskView(HttpServletRequest request, @PathVariable(value = "userName") String userName, HttpServletResponse response) {
		return prepareTaskView(userName);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/print", method = RequestMethod.GET)
	public ModelAndView printTableRowId(HttpServletRequest request, @PathVariable(value = "taskId") String taskId, HttpServletResponse response) {
		return prepareTaskView(taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}", method = RequestMethod.GET)
	public ModelAndView getTask(HttpServletRequest request, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value = "userName") String userName, HttpServletResponse response) {
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/addComment", method = RequestMethod.POST)
	public ModelAndView createComment(HttpServletRequest request, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value = "userName") String userName, @RequestParam(value="comment", required = true) String comment, HttpServletResponse response) {
		taskService.createComment(taskId, comment, userName);
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/{commentId}/updateComment", method = RequestMethod.POST)
	public ModelAndView updateComment(HttpServletRequest request, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value = "commentId") Integer commentId, @PathVariable(value = "userName") String userName, @RequestParam(value="comment", required=true) String comment, HttpServletResponse response) {
		taskService.updateComment(commentId, comment);
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/{status}/updateStatus", method = RequestMethod.GET)
	public ModelAndView updateTaskStatus(HttpServletRequest request, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value = "userName") String userName, @PathVariable(value = "status") String status, HttpServletResponse response) {
		taskService.updateTaskStatus(taskId, status);
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/{resolution}/updateResolution", method = RequestMethod.GET)
	public ModelAndView updateTaskResolution(HttpServletRequest request, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value = "userName") String userName, @PathVariable(value = "resolution") String resolution, HttpServletResponse response) {
		taskService.updateTaskResolution(taskId, resolution);
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/{userName}/{taskId}/{commentId}/delete", method = RequestMethod.GET)
	public ModelAndView updateTaskResolution(HttpServletRequest request, @PathVariable(value = "userName") String userName, @PathVariable(value = "taskId") Integer taskId, @PathVariable(value="commentId") int commentId, HttpServletResponse response) {
		taskService.deleteComment(commentId);
		return getIntoTaskView(userName, taskId);
	}
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("model");
		Session session = sessionFactory.openSession();
		Task task = new Task();
		task.setTitle("Test");
		task.setReporter("Mani");
		task.setAssignee("Mani");
		task.setDescription("test");
		
		session.save(task);
		
		Comment comment1 = new Comment();
		comment1.setComment("Test comment 1");
		comment1.setTask(task);
		task.getComments().add(comment1);
		session.save(comment1);
		
		Comment comment2 = new Comment();
		comment2.setComment("Test comment 2");
		comment2.setTask(task);
		task.getComments().add(comment2);
		session.save(comment2);
		
		Comment comment3 = new Comment();
		comment3.setComment("Test comment 3");
		comment3.setTask(task);
		task.getComments().add(comment3);
		session.save(comment3);
		
		System.out.println("Done");
		
		return model;
	}
}
