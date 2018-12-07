package com.application.bean;

import java.sql.Timestamp;

public class Task {
	
	private int id;
	private String userId;
	private int workId;
	private int projectId;
	private int groupId;
	private String content;
	private int process;
	private Timestamp time;
	
	private Work work;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getWorkId() {
		return workId;
	}
	public void setWorkId(int workId) {
		this.workId = workId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getProcess() {
		return process;
	}
	public void setProcess(int process) {
		this.process = process;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public Work getWork() {
		return work;
	}
	public void setWork(Work work) {
		this.work = work;
	}
	
	
}
