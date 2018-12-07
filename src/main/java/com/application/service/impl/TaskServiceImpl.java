package com.application.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.bean.Page;
import com.application.bean.Task;
import com.application.dao.TaskDAO;
import com.application.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService{

	@Autowired
	private TaskDAO taskDAO;
	@Override
	public Integer add(Task task) {
		return this.taskDAO.add(task);
	}
	@Override
	public Task currentTask(Task task) {
		return this.taskDAO.currentTask(task);
	}
	@Override
	public Integer appendTask(Task task) {
		return this.taskDAO.appendTask(task);
	}
	@Override
	public Integer updateProcess(Task task) {
		return this.taskDAO.updateProcess(task);
	}
	@Override
	public List<Task> getTaskList(String id, Page page) {
		return this.taskDAO.getTaskList(id, page);
	}
	@Override
	public Integer getTaskCount(String id) {
		return this.taskDAO.getTaskCount(id);
	}
	@Override
	public Task get(int id) {
		return this.taskDAO.get(id);
	}
	@Override
	public Integer getProcessByUserIdAndWorkId(String id, int workId) {
		return this.taskDAO.getProcessByUserIdAndWorkId(id, workId);
	}

	
}
