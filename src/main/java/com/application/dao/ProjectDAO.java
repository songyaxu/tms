package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.Page;
import com.application.bean.Project;
import com.application.param.ProjectParam;

public interface ProjectDAO {
	
	Integer add(@Param("project") Project project);
	
	List<Project> getList(@Param("param") ProjectParam param,@Param("page") Page page);
	
	List<Project> getListByKey(@Param("param") ProjectParam param,@Param("page") Page page);
	
	Integer getTotalCount();
	
	Integer getListCount(@Param("param") ProjectParam param);
	
	Project get(@Param("id") int id);
	
	List<Project> getUnionList(@Param("id") String id,@Param("page") Page page);
	
	Integer getUnionListCount(@Param("id") String id);
}
