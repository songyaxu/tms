package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.UserGroup;

public interface UserGroupDAO {
	Integer add(@Param("ug") UserGroup ug);
	
	List<String> getGroupUser(@Param("id")int groupId); 
	
	Integer getGroupCount(@Param("id")int groupId);
	
	UserGroup getUser(@Param("ug") UserGroup ug);
}
