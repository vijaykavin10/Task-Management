package org.jira.task.config;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

@Component
public class constants {

	public static List<String> issueTypes;
	
	public static List<String> priorityTypes;
	
	public static List<String> componentTypes;
	
	public static List<String> userTypes;
	
	public static final String INVALID_MESSAGE = "InValid Credential!";
	
	@PostConstruct
	public void init() {
		setIssueTypes();
		setPriorityTypes();
		setComponentTypes();
		setUserTypes();
	}
	
	private void setIssueTypes() {
		issueTypes = new ArrayList<String>();
		issueTypes.add("Task");
		issueTypes.add("Bug");
	}
	
	private void setPriorityTypes() {
		priorityTypes = new ArrayList<String>();
		priorityTypes.add("None");
		priorityTypes.add("Minor");
		priorityTypes.add("Major");
		priorityTypes.add("Citical");
		priorityTypes.add("Blocker");
	}
	
	private void setComponentTypes() {
		componentTypes = new ArrayList<String>();
		componentTypes.add("API");
		componentTypes.add("Admin");
	}

	private void setUserTypes(){
		userTypes=new ArrayList<String>();
		userTypes.add("Admin");
		userTypes.add("User");
		
	}
}
