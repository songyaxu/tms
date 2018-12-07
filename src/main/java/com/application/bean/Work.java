package com.application.bean;

import java.sql.Timestamp;

public class Work {
	
	private int id;
	private int projectId;
	private String title;
	private String content;
	private String attachment;		
	private String description;
	private Timestamp createTime;
	private Timestamp commitTime;
	private Timestamp finishTime;
	
	private int groupId;
	
	private int process;
	
	private String masterId;
	private User master;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getCommitTime() {
		return commitTime;
	}
	public void setCommitTime(Timestamp commitTime) {
		this.commitTime = commitTime;
	}
	public Timestamp getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getMasterId() {
		return masterId;
	}
	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}
	public User getMaster() {
		return master;
	}
	public void setMaster(User master) {
		this.master = master;
	}
	public int getProcess() {
		return process;
	}
	public void setProcess(int process) {
		this.process = process;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	
	
}
