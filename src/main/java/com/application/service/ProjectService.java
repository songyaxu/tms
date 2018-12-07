package com.application.service;

import java.util.List;

import com.application.bean.Page;
import com.application.bean.Project;
import com.application.dto.Result;
import com.application.param.ProjectParam;

public interface ProjectService {
	
	Result publish(Project project);
	
	List<Project> getList(ProjectParam param,Page page);
	
	List<Project> getListByKey(ProjectParam param,Page page);
	
	Integer getListCount(ProjectParam param);
	
	Project get(int id);
	
	List<Project> getUnionList(String id,Page page);
	
	Integer getUnionListCount(String id);
}
