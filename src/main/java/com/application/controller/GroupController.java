package com.application.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Group;
import com.application.bean.Message;
import com.application.bean.Project;
import com.application.bean.User;
import com.application.bean.UserGroup;
import com.application.dto.Result;
import com.application.param.MessageParam;
import com.application.service.GroupService;
import com.application.service.MessageService;
import com.application.service.ProjectService;
import com.application.service.UserGroupService;
import com.application.service.UserService;
import com.application.util.TimeUtil;

@Controller
@RequestMapping("group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("join/{projectId}/{id}")
	@ResponseBody
	public Result join(@PathVariable("id") int id,@PathVariable("projectId") int projectId,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Project project = projectService.get(projectId);
		int count = userGroupService.getGroupCount(id);
		if(count>=project.getGroupMaxMember())
		{
			return Result.failure("该小组已经达到最大组员数!");
		}
		UserGroup ug = new UserGroup();
		ug.setGroupId(id);
		ug.setProjectId(projectId);
		ug.setUserId(user.getId());
		UserGroup ug2=userGroupService.getUser(ug);
		if(ug2!=null)
			return Result.failure("您已经是该项目的成员!");
		MessageParam param = new MessageParam();
		param.setProjectId(projectId);
		param.setSendId(user.getId());
		List<Message> msgList = messageService.get(param);
		String preStr = "";
		if(msgList!=null&&msgList.size()>0)
		{
			for (Message message : msgList) {
				message.setAction(1);
				message.setResult("系统自动拒绝");
				message.setActionTime(TimeUtil.currentTime());
				messageService.update(message);
			}
			preStr="已自动拒绝您的组长申请，并将您加入该小组";
		}
		userGroupService.add(ug);
		return Result.success(preStr.equals("")?"加入成功":preStr);
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") int id,HttpSession session) {
		List<Group> groupList = groupService.getGroupByProjectId(id);
		for (Group group : groupList) {
			List<String> idList = userGroupService.getGroupUser(group.getId());
			List<User> userList = new ArrayList<User>();
			for (String uId : idList) {
				userList.add(userService.getUserInfo(uId));
			}
			group.setUserList(userList);
		}
		session.setAttribute("group", groupList);
		return "public/groupdetail";
	}
	
	@ResponseBody
	@RequestMapping("approval/{id}")
	public Result accept(@PathVariable("id") int id,@RequestParam(value="type" ,required =false,defaultValue="0") int type) {
		Message message = messageService.getById(id);
		if(type==0) {
			message.setAction(1);
			message.setResult("审核未通过");
			message.setActionTime(TimeUtil.currentTime());
			messageService.update(message);
			return Result.success("审批成功");
		}
		Group group = new Group();
		group.setMasterId(message.getSendId());
		group.setProjectId(message.getProjectId());
		int order = groupService.getProjectGroupOrder(message.getProjectId());
		group.setOrder(order+1);
		Project project = projectService.get(message.getProjectId());
		group.setTitle(project.getTitle()+"-第"+(order+1)+"组");
		int res = groupService.add(group);
		if(res>=1)
		{
			UserGroup ug = new UserGroup();
			ug.setGroupId(group.getId());
			ug.setIsMaster(1);
			ug.setUserId(message.getSendId());
			ug.setProjectId(project.getId());
			userGroupService.add(ug);
			message.setAction(1);
			message.setResult("审核通过");
			message.setActionTime(TimeUtil.currentTime());
			messageService.update(message);
			return Result.success("审批成功");
		}
		return Result.failure("审核失败");
	}
	
	@RequestMapping("member/{id}")
	public String member(@PathVariable("id") int id,HttpServletRequest req) {
		List<User> uList = userService.getGroupUserList(id);
		req.setAttribute("uList", uList);
		return "public/member";
	}
	
}
