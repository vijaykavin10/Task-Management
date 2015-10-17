package org.jira.task.table;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="task")
public class Task {

	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="description")
	private String description;
	
	@Column(name="assignee")
	private String assignee;
	
	@Column(name="issue_type")
	private String issueType;
	
	@Column(name="component_type")
	private String componentType;
	
	@Column(name="priority")
	private String priority;
	
	@Column(name="comment")
	private String comment;
	
	@Column(name="reporter")
	private String reporter;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="last_modified")
	private Date lastModified;
	
	@Column(name="status")
	private String status;
	
	@Column(name="resolution")
	private String resolution;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "task")
	private List<Comment> comments = new ArrayList<Comment>(0);
	
	public Task(String title, String description, String assignee, String issueType, String componentType, String priorityType, String reporter) {
		this.title = title;
		this.description = description;
		this.assignee = assignee;
		this.issueType = issueType;
		this.componentType = componentType;
		this.priority = priorityType;
		this.reporter = reporter;
		this.createdOn = new Date();
		this.lastModified = new Date();
		this.status = "OPEN";
		this.resolution = "UNRESOLVED";
	}
	
	public Task() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String getComponentType() {
		return componentType;
	}

	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	
}
