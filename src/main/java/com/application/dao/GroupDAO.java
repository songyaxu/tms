package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.Group;

public interface GroupDAO {
	
	Integer add(@Param("g") Group group);
	
	List<Group> getGroupByProjectId(int id);
	
	int getProjectGroupOrder(int id);
	
	String getWorkGroupMasterByWorkId(@Param("id")int id,@Param("currentId") String currentId);
	
	Group getGroupByProIdUserId(@Param("proId") int projectId,@Param("userId") String userId);
	
	int getGroupIdByWorkId(@Param("id")int id,@Param("userId") String userId);
}
