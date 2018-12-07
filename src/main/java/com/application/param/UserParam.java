package com.application.param;

/**
 * 
 * @description
 * type: 0  get the user type is student
 *	     1  get the user type is teacher
 *		 2  get all users
 */
public class UserParam {
	private int type;
	private int groupId;
	private int projectId;
	private int workId;
	private int taskId;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getWorkId() {
		return workId;
	}
	public void setWorkId(int workId) {
		this.workId = workId;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	
}
