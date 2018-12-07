package com.application.service;

import java.util.List;

import com.application.bean.GroupWork;

public interface GroupWorkService {

	Integer add(GroupWork groupWork);
	
	GroupWork get(int id);
	
	GroupWork getByWorkIdAndMasterId(int workId,String masterId);
	
	void updateLog(GroupWork groupWork);
	
	void score(GroupWork groupWork);
	
	void update(int id,String attachment);
	
	GroupWork getMyWorkDetail(GroupWork groupWork);
	
	List<GroupWork> getWorkGroupList(int id);
}
