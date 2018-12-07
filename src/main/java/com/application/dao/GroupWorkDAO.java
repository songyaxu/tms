package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.GroupWork;

public interface GroupWorkDAO {
	
	Integer add(@Param("gw") GroupWork groupWork);
	
	GroupWork get(int id);
	
	GroupWork getByWorkIdAndMasterId(@Param("workId") int workId,@Param("masterId") String masterId);
	
	void updateLog(@Param("gw") GroupWork groupWork);
	
	void score(@Param("gw") GroupWork groupWork);
	
	void update(@Param("id") int id,@Param("attachment") String attachment);
	
	GroupWork getMyWorkDetail(@Param("gw") GroupWork groupWork);
	
	List<GroupWork> getWorkGroupList(int id);
}
