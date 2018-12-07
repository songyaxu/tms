package com.application.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.application.bean.Page;
import com.application.bean.Project;
import com.application.bean.User;
import com.application.dao.ProjectDAO;
import com.application.dto.Result;
import com.application.enums.UserType;
import com.application.param.ProjectParam;
import com.application.service.ProjectService;
import com.application.util.TimeUtil;
@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDAO projectDAO;

	protected HttpServletRequest getServletRequest() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
	
	protected HttpSession getSession() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
    }
	
	@Override
	public Result publish(Project project) {
		User user = (User) getSession().getAttribute("user");
		project.setUserId(user.getId());
		project.setUserName(user.getName());
		project.setTime(TimeUtil.currentTime());
		int res = projectDAO.add(project);
		if(res>=1)
			return Result.success("发布成功");
		return Result.failure("发布失败");
	}

	/**
	 * ID is the userid who login.
	 * this method can get the list who have the project or who is the project member.
	 */
	@Override
	public List<Project> getList(ProjectParam param, Page page) {
		User user  = (User) getSession().getAttribute("user");
		if(user.getType()==UserType.TEACHER.getCode()) {
			return projectDAO.getList(param, page);
		}else {
			return projectDAO.getList(param, page);
		}
	}

	@Override
	public Integer getListCount(ProjectParam param) {
		return projectDAO.getListCount(param);
	}

	@Override
	public Project get(int id) {
		return projectDAO.get(id);
	}

	@Override
	public List<Project> getListByKey(ProjectParam param, Page page) {
		return projectDAO.getListByKey(param, page);
	}

	@Override
	public List<Project> getUnionList(String id, Page page) {
		return projectDAO.getUnionList(id, page);
	}

	@Override
	public Integer getUnionListCount(String id) {
		return projectDAO.getUnionListCount(id);
	}
	
	
	
}
