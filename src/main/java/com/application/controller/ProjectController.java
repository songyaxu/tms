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
import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.enums.UserType;
import com.application.param.ProjectParam;
import com.application.service.ProjectService;
import com.application.util.PageUtil;
@Controller
@RequestMapping("project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("publish/init")
	public String publishInit() {
		return "teacher/publish_pro";
	}
	
	@RequestMapping("publish")
	@ResponseBody
	public Result publish(Project project) {
		return projectService.publish(project); 
	}
	
	@RequestMapping("myproject")
	public String myProject(HttpSession session,@RequestParam(value="page",required = false ,defaultValue="0")int pageNo) {
		User user=(User) session.getAttribute("user");
		if(user.getType()==UserType.STUDENT.getCode()){
			ProjectParam param = new ProjectParam();
			param.setUserId(user.getId());
			int total = projectService.getUnionListCount(user.getId());
			Page page = new Page();
			page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
			List<Project> myProjectList = projectService.getUnionList(user.getId(), page);
			session.setAttribute("myProjectList", myProjectList);
			session.setAttribute("myProjectPage", page);
			return "student/myproject";
		}
		if(user.getType()==UserType.TEACHER.getCode()) {
			ProjectParam param = new ProjectParam();
			param.setUserId(user.getId());
			int total = projectService.getListCount(param);
			Page page = new Page();
			page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
			List<Project> myProjectList = projectService.getList(param, page);
			session.setAttribute("myProjectList", myProjectList);
			session.setAttribute("myProjectPage", page);
			return "teacher/myproject";
		}
		return "404";
	}
	@RequestMapping("check/project")
	public String checkProject(HttpSession session,@RequestParam(value="page",required = false ,defaultValue="0")int pageNo,
			@RequestParam(value="key",required = false ,defaultValue="")String key) {
		ProjectParam param = new ProjectParam();
		param.setKey(key);
		int total = projectService.getListCount(param);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Project> myProjectList = projectService.getListByKey(param, page);
		session.setAttribute("checkProjectList", myProjectList);
		session.setAttribute("checkProjectPage", page);
		session.setAttribute("projectKey", key);
		return "public/project";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") int id,HttpServletRequest request) {
		Project project  = projectService.get(id);
		request.setAttribute("project", project);
		return "public/projectdetail";
	}
}
