package com.application.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Page;
import com.application.bean.User;
import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.enums.UserType;
import com.application.manager.PublicManager;
import com.application.param.ProjectParam;
import com.application.service.MessageService;
import com.application.service.ProjectService;
import com.application.service.TaskService;
import com.application.service.UserService;
import com.application.service.WorkService;
import com.application.util.PageUtil;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Resource
	private PublicManager publicManager;
	
	@Resource
	private MessageService messageService;
	
	@Resource
	private WorkService workService;
	
	@Resource
	private TaskService taskService;
	
	@ResponseBody
	@RequestMapping("login")
	public Result login(User user,HttpSession session) {
		return userService.login(user);
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("unreadCount");
		session.removeAttribute("indexProjectList");
		return "redirect:/";
	}
	
	@RequestMapping("index")
	public String index(HttpSession session) {
		Page page=PageUtil.createPage(Constant.PAGE_SIZE, 8, 0);
		ProjectParam param = new ProjectParam();
		param.setSortColumn("time");
		User u = (User) session.getAttribute("user");
		param.setUserId(u.getId());
		if(u.getType()==UserType.STUDENT.getCode()) {
			session.setAttribute("myProjectCount", projectService.getUnionListCount(u.getId()));
			session.setAttribute("myWorkCount", workService.getMyWorkCount(u.getId()));
			session.setAttribute("indexProjectList", projectService.getUnionList(u.getId(), page));
			session.setAttribute("myTaskCount", taskService.getTaskCount(u.getId()));
		}else {
			session.setAttribute("myProjectCount", projectService.getListCount(param));
			session.setAttribute("indexProjectList", projectService.getList(param, page));
		}
		session.setAttribute("count", publicManager.getTotalCount());
		session.setAttribute("unreadCount", messageService.getUnreadCount());
		return "index";
	}
	
	@RequestMapping("info")
	public String getMyInfo(HttpSession session) {
		User user=(User)session.getAttribute("user");
		if(user.getType()==0)
			return "student/info";
		if(user.getType()==1)
			return "teacher/info";
		return "404";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Result update(User user,String oldpwd) {
		return userService.update(user,oldpwd);
	}
	
	@RequestMapping("checkExist/{id}")
	@ResponseBody
	public Result checkExist(@PathVariable("id") String id) {
		return userService.getUser(id);
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") String id,HttpServletRequest request) {
		User user = userService.getUserInfo(id);
		request.setAttribute("targetUser", user);
		return "public/userinfo";
	}
}
