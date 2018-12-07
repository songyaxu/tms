package com.application.bean;

import java.sql.Timestamp;

public class Project {
	
	private int id;
	private String title;
	private String description;
	private int groupProject;
	private String attachment;
	private int maxGroup;
	private int groupMaxMember;
	private String groupMaster;
	private String userId;
	private String userName;
	private Timestamp time;
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
	public int getGroupProject() {
		return groupProject;
	}
	public void setGroupProject(int groupProject) {
		this.groupProject = groupProject;
	}
	public String getGroupMaster() {
		return groupMaster;
	}
	public void setGroupMaster(String groupMaster) {
		this.groupMaster = groupMaster;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public int getMaxGroup() {
		return maxGroup;
	}
	public void setMaxGroup(int maxGroup) {
		this.maxGroup = maxGroup;
	}
	public int getGroupMaxMember() {
		return groupMaxMember;
	}
	public void setGroupMaxMember(int groupMaxMember) {
		this.groupMaxMember = groupMaxMember;
	}
	
	
}
