package com.application.service;

import java.util.List;

import com.application.bean.Page;
import com.application.bean.Work;
import com.application.dto.Result;

public interface WorkService {
	
	List<Work> getWorkByProjectId(int id);
	
	Result publish(Work work);
	
	void getWorkListByProjectId(int id);
	
	List<Work> getMyWorkList(String id,Page page);
	
	Integer getMyWorkCount(String id);
	
	Work getWorkById(int id);
	
	List<String> getUserIdListByWorkId(int id,String masterId);
	
	String getProjectOwner(int id);
}
