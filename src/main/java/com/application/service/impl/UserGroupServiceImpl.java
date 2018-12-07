package com.application.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.bean.UserGroup;
import com.application.dao.UserGroupDAO;
import com.application.service.UserGroupService;

@Service
public class UserGroupServiceImpl implements UserGroupService{

	@Autowired
	private UserGroupDAO userGroupDAO;
	
	@Override
	public Integer add(UserGroup ug) {
		return this.userGroupDAO.add(ug);
	}

	@Override
	public List<String> getGroupUser(int groupId) {
		return this.userGroupDAO.getGroupUser(groupId);
	}

	@Override
	public Integer getGroupCount(int groupId) {
		return this.userGroupDAO.getGroupCount(groupId);
	}

	@Override
	public UserGroup getUser(UserGroup ug) {
		return this.userGroupDAO.getUser(ug);
	}

	
	
}
