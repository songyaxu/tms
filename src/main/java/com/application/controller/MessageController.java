package com.application.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Message;
import com.application.bean.Page;
import com.application.bean.Project;
import com.application.bean.User;
import com.application.bean.UserGroup;
import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.enums.UserType;
import com.application.param.MessageParam;
import com.application.service.GroupService;
import com.application.service.MessageService;
import com.application.service.ProjectService;
import com.application.service.UserGroupService;
import com.application.util.PageUtil;
import com.application.util.TimeUtil;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@RequestMapping("init")
	public String init() {
		return "public/messageinit";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") int id,HttpSession session) {
		Message msg=messageService.getById(id);
		User user = (User) session.getAttribute("user");
		if(msg.getState()==0&&user.getId().equals(msg.getReceiveId())){
			msg.setState(1);
			messageService.update(msg);
			session.setAttribute("unreadCount", messageService.getUnreadCount());
		}
		msg=messageService.getById(id);
		session.setAttribute("msg", msg);
		return "public/messagedetail";
	}
	@RequestMapping("send")
	@ResponseBody
	public Result send(Message message,HttpSession session) {
		User user = (User) session.getAttribute("user");
		message.setSendId(user.getId());
		message.setState(0);
		message.setType(0);
		message.setSendTime(TimeUtil.currentTime());
		int res=messageService.add(message);
		if(res>=1)
			return Result.success("发送成功");
		return Result.failure("发生失败");
	}
	
	@RequestMapping("myreceiver/{page}")
	public String myReceiver(@PathVariable("page") int pageNo,HttpSession session){
		User user = (User) session.getAttribute("user");
		MessageParam param = new MessageParam();
		param.setReceiveId(user.getId());
		int total = messageService.getMessageCount(param);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Message> msgList = messageService.getByPage(param, page);
		session.setAttribute("receiveList", msgList);
		session.setAttribute("receivePage", page);
		return "public/myreceivemessages";
		
	}
	
	@RequestMapping("mysend/{page}")
	public String mySend(@PathVariable("page") int pageNo,HttpSession session){
		User user = (User) session.getAttribute("user");
		MessageParam param = new MessageParam();
		param.setSendId(user.getId());
		int total = messageService.getMessageCount(param);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Message> msgList = messageService.getByPage(param, page);
		session.setAttribute("sendList", msgList);
		session.setAttribute("sendPage", page);
		return "public/mysendmessages";
		
	}
	
	@ResponseBody
	@RequestMapping("master/{id}")
	public Result groupMaster(@PathVariable("id") int id,HttpSession session) {
		Message msg= new  Message();
		Project project=projectService.get(id);
		int count=groupService.getGroupByProjectId(id).size();
		if(count>=project.getMaxGroup())
		{
			return Result.failure("组数已经超过最大组数限制");
		}
		User user=(User)session.getAttribute("user");
		if(user.getType()==UserType.TEACHER.getCode())
			return Result.failure("组长必须为学生");
		UserGroup ug = new UserGroup();
		ug.setProjectId(id);
		ug.setUserId(user.getId());
		UserGroup ug2=userGroupService.getUser(ug);
		if(ug2!=null)
			return Result.failure("您已经是该项目的成员!");
		MessageParam param = new MessageParam();
		param.setProjectId(project.getId());
		param.setSendId(user.getId());
		List<Message> msgList = messageService.get(param);
		for (Message message : msgList) {
			if(message.getProjectId()==project.getId()&&message.getSendId().equals(user.getId()))
				return Result.failure("您已申请或已经是该项目小组组长！");
		}
		msg.setType(2);
		msg.setContent(user.getName()+"("+user.getId()+")申请成为《"+project.getTitle()+"》的组长，是否批准？");
		msg.setSendId(user.getId());
		msg.setProjectId(project.getId());
		msg.setReceiveId(project.getUserId());
		msg.setSendTime(TimeUtil.currentTime());
		int res = messageService.add(msg);
		if(res>=1)
			return Result.success("申请成功");
		return Result.failure("未知错误，请重新提交申请");
	}
}
