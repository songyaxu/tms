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
import com.application.bean.Work;
import com.application.dao.GroupDAO;
import com.application.dao.TaskDAO;
import com.application.dao.UserDAO;
import com.application.dao.WorkDAO;
import com.application.dto.Result;
import com.application.service.WorkService;
import com.application.util.TimeUtil;

@Service
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDAO workDAO;
	
	@Autowired
	private GroupDAO groupDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TaskDAO taskDAO;
	
	protected HttpServletRequest getServletRequest() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
	
	protected HttpSession getSession() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
    }
	
	@Override
	public List<Work> getWorkByProjectId(int id) {
		return workDAO.getWorkByProjectId(id);
	}
	@Override
	public Result publish(Work work) {
		HttpSession session =  getSession();
		Project project = (Project) session.getAttribute("project");
		work.setProjectId(project.getId());
		work.setCreateTime(TimeUtil.currentTime());
		workDAO.add(work);
		return Result.success("布置成功");
	}
	
	public void getWorkListByProjectId(int id) {
		List<Work> workList = workDAO.getWorkByProjectId(id);
		for (Work work : workList) {
			String masterId = groupDAO.getWorkGroupMasterByWorkId(work.getId(),((User)getSession().getAttribute("user")).getId());
			List<String> userIdList=workDAO.getUserIdListByWorkId(work.getId(),masterId);
			int process = 0;
			int size=0;
			if(userIdList!=null&&userIdList.size()>0) {
				for (String string : userIdList) {
					process+=(taskDAO.getProcessByUserIdAndWorkId(string, work.getId()))==null?0:(taskDAO.getProcessByUserIdAndWorkId(string, work.getId()));
				}
				size = userIdList.size();
				process=process/size;
			}
			work.setProcess(process);
			work.setMasterId(masterId);
			work.setMaster(userDAO.get(masterId));
		}
		getSession().setAttribute("workList", workList);
	}

	@Override
	public List<Work> getMyWorkList(String id, Page page) {
		return this.workDAO.getMyWorkList(id, page);
	}

	@Override
	public Integer getMyWorkCount(String id) {
		return this.workDAO.getMyWorkCount(id);
	}

	@Override
	public Work getWorkById(int id) {
		return this.workDAO.getWorkById(id);
	}

	@Override
	public List<String> getUserIdListByWorkId(int id,String masterId) {
		return this.workDAO.getUserIdListByWorkId(id,masterId);
	}

	@Override
	public String getProjectOwner(int id) {
		return this.workDAO.getProjectOwner(id);
	}

	
	
}
