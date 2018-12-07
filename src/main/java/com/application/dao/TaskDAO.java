package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.Page;
import com.application.bean.Task;

public interface TaskDAO {
	
	Integer add(@Param("task")Task task);
	
	Task currentTask(@Param("task")Task task);
	
	Integer appendTask(@Param("task")Task task);
	
	Integer updateProcess(@Param("task")Task task);
	
	List<Task> getTaskList(@Param("id") String id,@Param("page") Page page);
	
	Integer getTaskCount(String id);
	
	Task get(int id);
	
	Integer getProcessByUserIdAndWorkId(@Param("id") String id,@Param("workId") int workId);
}
