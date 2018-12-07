package com.application.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Page;
import com.application.bean.Project;
import com.application.bean.User;
import com.application.bean.Work;
import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.service.GroupService;
import com.application.service.ProjectService;
import com.application.service.TaskService;
import com.application.service.UserService;
import com.application.service.WorkService;
import com.application.util.PageUtil;

@Controller
@RequestMapping("work")
public class WorkController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private WorkService workService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("publish/init/{id}")
	public String publish(@PathVariable("id") int id,HttpSession session) {
		Project project = projectService.get(id);
		List<Work> workList = workService.getWorkByProjectId(id);
		if(workList==null||workList.size()==0) {
			session.setAttribute("work", null);
			session.setAttribute("workFlag", 0);
		}else {
			session.setAttribute("work", workList.get(workList.size()-1));
			session.setAttribute("workFlag", workList.size());
		}
		session.setAttribute("project", project);
		return "teacher/publish_work";
	}
	@RequestMapping("publish")
	@ResponseBody
	public Result publish(Work work) {
		return workService.publish(work); 
	}
	@RequestMapping("check/worklist/{projectid}")
	public String checkWork(@PathVariable("projectid") int id) {
		workService.getWorkListByProjectId(id);
		return "public/work";
	}
	@RequestMapping("mywork")
	public String myWork(@RequestParam(value="page",required = false ,defaultValue="0")int pageNo,HttpSession session) {
		User user=(User) session.getAttribute("user");
		int total = workService.getMyWorkCount(user.getId());
		Page page = new Page(); 
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Work> myWorkList = workService.getMyWorkList(user.getId(), page);
		for (Work work : myWorkList) {
			String masterId = groupService.getWorkGroupMasterByWorkId(work.getId(),user.getId());
			List<String> userIdList=workService.getUserIdListByWorkId(work.getId(),masterId);
			int process = 0;
			int size= 0;
			if(userIdList!=null&&userIdList.size()>0) {
				for (String string : userIdList) {
					process+=(taskService.getProcessByUserIdAndWorkId(string, work.getId()))==null?0:(taskService.getProcessByUserIdAndWorkId(string, work.getId()));
				}
				size = userIdList.size();
				process=process/size;
			}
			int groupId=groupService.getGroupIdByWorkId(work.getId(),user.getId());
			work.setProcess(process);
			work.setMasterId(masterId);
			work.setMaster(userService.getUserInfo(masterId));
			work.setGroupId(groupId);
		}
		session.setAttribute("myWorkList", myWorkList);
		session.setAttribute("myWorkPage", page);
		return "student/mywork";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") int id,HttpServletRequest request) {
		Work work  = workService.getWorkById(id);
		request.setAttribute("work", work);
		return "public/workdetail";
	}
	
}
