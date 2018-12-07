package com.application.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.bean.Group;
import com.application.dao.GroupDAO;
import com.application.service.GroupService;
@Service
public class GroupServiceImpl implements GroupService{

	@Autowired
	private GroupDAO groupDAO;
	
	@Override
	public Integer add(Group group) {
		return groupDAO.add(group);
	}

	@Override
	public List<Group> getGroupByProjectId(int id) {
		return groupDAO.getGroupByProjectId(id);
	}

	@Override
	public int getProjectGroupOrder(int id) {
		return groupDAO.getProjectGroupOrder(id);
	}

	@Override
	public String getWorkGroupMasterByWorkId(int id,String userId) {
		return groupDAO.getWorkGroupMasterByWorkId(id,userId);
	}

	@Override
	public Group getGroupByProIdUserId(int projectId, String userId) {
		return this.groupDAO.getGroupByProIdUserId(projectId, userId);
	}

	@Override
	public int getGroupIdByWorkId(int id,String userId) {
		return this.groupDAO.getGroupIdByWorkId(id,userId);
	}
	
	
}
