package com.application.service;

import java.util.List;

import com.application.bean.Page;
import com.application.bean.Task;

public interface TaskService {
	
	Integer add(Task task);
	
	Task currentTask(Task task);
	
	Integer appendTask(Task task);
	
	Integer updateProcess(Task task);
	
	List<Task> getTaskList(String id,Page page);
	
	Integer getTaskCount(String id);
	
	Task get(int id);
	
	Integer getProcessByUserIdAndWorkId(String id,int workId);
}
