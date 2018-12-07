package com.application.service;

import java.util.List;

import com.application.bean.Group;

public interface GroupService {
	Integer add(Group group);
	
	List<Group> getGroupByProjectId(int id);
	
	int getProjectGroupOrder(int id);
	
	String getWorkGroupMasterByWorkId(int id,String UserId);
	
	Group getGroupByProIdUserId(int projectId,String userId);

	int getGroupIdByWorkId(int id,String userId);
}
