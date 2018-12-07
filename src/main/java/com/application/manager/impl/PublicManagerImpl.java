package com.application.manager.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.bean.Count;
import com.application.dao.ProjectDAO;
import com.application.dao.UserDAO;
import com.application.dao.WorkDAO;
import com.application.manager.PublicManager;
import com.application.param.UserParam;

@Service
public class PublicManagerImpl implements PublicManager{

	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private WorkDAO workDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public Count getTotalCount() {
		Count count = new Count();
		count.setProject(projectDAO.getTotalCount());
		count.setWork(workDAO.getTotalCount());
		UserParam param = new UserParam();
		param.setType(0);
		count.setStudent(userDAO.getTotalCount(param));
		param.setType(1);
		count.setTeacher(userDAO.getTotalCount(param));
		return count;
	}
	
}
