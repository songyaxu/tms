package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.Page;
import com.application.bean.Work;

public interface WorkDAO {
	
	Integer getTotalCount();
	
	Work get(int id);
	
	List<Work> getWorkByProjectId(int id);
	
	Integer add(@Param("work") Work work);
	
	List<Work> getMyWorkList(@Param("id") String id,@Param("page") Page page);
	
	Integer getMyWorkCount(String id);
	
	Work getWorkById(int id);
	
	List<String> getUserIdListByWorkId(@Param("id") int id,@Param("masterId") String masterId);
	
	String getProjectOwner(int id);
}
