package com.application.service;

import java.util.List;

import com.application.bean.UserGroup;

public interface UserGroupService {
	
	Integer add(UserGroup ug);
	
	List<String> getGroupUser(int groupId); 
	
	Integer getGroupCount(int groupId);
	
	UserGroup getUser(UserGroup ug);
}
