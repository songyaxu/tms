package com.application.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.bean.GroupWork;
import com.application.dao.GroupWorkDAO;
import com.application.service.GroupWorkService;

@Service
public class GroupWorkServiceImpl implements GroupWorkService{

	@Autowired
	private GroupWorkDAO groupWorkDAO;
	
	@Override
	public Integer add(GroupWork groupWork) {
		return this.groupWorkDAO.add(groupWork);
	}

	@Override
	public GroupWork get(int id) {
		return this.groupWorkDAO.get(id);
	}

	@Override
	public GroupWork getByWorkIdAndMasterId(int workId, String masterId) {
		return this.groupWorkDAO.getByWorkIdAndMasterId(workId, masterId);
	}

	@Override
	public void updateLog(GroupWork groupWork) {
		this.groupWorkDAO.updateLog(groupWork);
	}

	@Override
	public void score(GroupWork groupWork) {
		this.groupWorkDAO.score(groupWork);
	}

	@Override
	public void update(int id, String attachment) {
		this.groupWorkDAO.update(id, attachment);
	}

	@Override
	public GroupWork getMyWorkDetail(GroupWork groupWork) {
		return this.groupWorkDAO.getMyWorkDetail(groupWork);
	}

	@Override
	public List<GroupWork> getWorkGroupList(int id) {
		return this.groupWorkDAO.getWorkGroupList(id);
	}

	
	
}
