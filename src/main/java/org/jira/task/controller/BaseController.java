package org.jira.task.controller;

import org.jira.task.config.constants;
import org.jira.task.service.TaskService;
import org.jira.task.service.UserService;
import org.jira.task.table.Task;
import org.jira.task.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskService taskService;
	
	public Task createTaskModel(String title, String description, String assignee, String issueType, String componentType, String priorityType, String comment, String reporter) {
		Task task = new Task();
		task.setTitle(title);
		task.setDescription(description);
		task.setAssignee(assignee);
		task.setComponentType(componentType);
		task.setPriority(priorityType);
		task.setIssueType(issueType);
		task.setComment(comment);
		task.setReporter(reporter);
		return task;
	}
	
	public ModelAndView prepareHomePageModel(String userName) {
		ModelAndView model = new ModelAndView("home");
		model.addObject("user", userService.getUser(userName));
		model.addObject("taskList", taskService.getTaskByAssignee(userName));
		return model;
	}

	public ModelAndView prepareLoginPageModel(String message) {
		ModelAndView model = new ModelAndView("loginNew");
		model.addObject("message", message);
		return model;
	}
		
	public ModelAndView prepareTaskView(String userName) {
		ModelAndView model = new ModelAndView("task");
		model.addObject("taskList", taskService.getTaskByAssignee(userName));
		model.addObject("userNames", userService.getAllUserNames());
		model.addObject("issueTypes", constants.issueTypes);
		model.addObject("componentTypes", constants.componentTypes);
		model.addObject("priorityTypes", constants.priorityTypes);
		model.addObject("user", userService.getUser(userName));
		return model;
	}

	public ModelAndView prepareTaskPageModel(String userName, String key) {
		ModelAndView model = new ModelAndView("task");
		if(key.equalsIgnoreCase("ALL")) {
			model.addObject("taskList", taskService.getAllTask());
		} else if(key.equalsIgnoreCase("ASSIGNTOME")) {
			model.addObject("taskList", taskService.getTaskByAssignee(userName));
		} else if(key.equalsIgnoreCase("REPORTEDBYME")) {
			model.addObject("taskList", taskService.getTaskReportedByMe(userName));
		}
		model.addObject("userNames", userService.getAllUserNames());
		model.addObject("issueTypes", constants.issueTypes);
		model.addObject("componentTypes", constants.componentTypes);
		model.addObject("priorityTypes", constants.priorityTypes);
		model.addObject("user", userService.getUser(userName));
		return model;
	}
	
	public ModelAndView prepareUserView(String userName) {
		ModelAndView model = new ModelAndView("user");
		model.addObject("userList", userService.getAllUser());
		model.addObject("user", userService.getUser(userName));
		model.addObject("userTypes",constants.userTypes);
		return model;
	}
	
	public User createUserModel(String firstName, String lastName, String email, String userName, String password, String userType) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(password);
		user.setUserType(userType);
		return user;
	}
	
	public ModelAndView getIntoTaskView(String userName, int taskId) {
		ModelAndView model = new ModelAndView("viewTask");
		model.addObject("user", userService.getUser(userName));
		model.addObject("task", taskService.getTask(taskId));
		model.addObject("userNames", userService.getAllUserNames());
		model.addObject("issueTypes", constants.issueTypes);
		model.addObject("componentTypes", constants.componentTypes);
		model.addObject("priorityTypes", constants.priorityTypes);
		return model;
	}
}
