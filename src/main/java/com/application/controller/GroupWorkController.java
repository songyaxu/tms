package com.application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Group;
import com.application.bean.GroupWork;
import com.application.bean.Task;
import com.application.bean.User;
import com.application.dto.Result;
import com.application.service.GroupService;
import com.application.service.GroupWorkService;
import com.application.service.TaskService;
import com.application.service.UserGroupService;
import com.application.service.UserService;
import com.application.service.WorkService;

@Controller
@RequestMapping("groupwork")
public class GroupWorkController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private GroupWorkService groupWorkService;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private WorkService workService;
	
	@RequestMapping("letlog/{id}/{workid}")
	public String letLog(@PathVariable("id") int projectId,@PathVariable("workid") int workId,HttpSession session) {
		User user = (User)session.getAttribute("user");
		Group group=groupService.getGroupByProIdUserId(projectId, user.getId());
		GroupWork groupWork= groupWorkService.getByWorkIdAndMasterId(workId, user.getId());
		String log = "";
		if(groupWork!=null)
			log = groupWork.getLog();
		Task task = new Task();
		if(group==null) {
			session.getServletContext().setAttribute("userList", null);
			session.getServletContext().setAttribute("log", log);
			return "student/log";
		}
		List<String> uIdList = userGroupService.getGroupUser(group.getId());
		List<User> uList = new  ArrayList<User>();
		if(uIdList!=null&&uIdList.size()!=0)
			for (String id : uIdList) {
				User u = userService.getUserInfo(id);
				Task temp = new Task();
				temp.setUserId(id);
				temp.setGroupId(group.getId());
				Task t = taskService.currentTask(temp);
				u.setTask(t);
				uList.add(u);
			}
		task.setGroupId(group.getId());
		task.setProjectId(projectId);
		task.setWorkId(workId);
		session.getServletContext().setAttribute("userList", uList);
		session.getServletContext().setAttribute("task", task);
		session.getServletContext().setAttribute("log", log);
		return "student/log";
	}
	
	@ResponseBody
	@RequestMapping("logit")
	public Result logIt(String desc,String time,String name,GroupWork groupWork,HttpSession session) {
		User user = (User) session.getAttribute("user");
		groupWork.setMasterId(user.getId());
		GroupWork gw = groupWorkService.getByWorkIdAndMasterId(groupWork.getWorkId(), user.getId());
		if(gw!=null)
		{
			String log1 = "<br><span class=\"am-text-success\">["+time.toString()+"]"+"</span>"+"<span class=\"am-text-primary\">["+
					 name+"]</span>: "+desc;
			gw.setLog(gw.getLog()+log1);
			groupWorkService.updateLog(gw);
			return Result.success("追加记录成功");
		}
		String log = "<span class=\"am-text-success\">["+time.toString()+"]"+"</span>"+"<span class=\"am-text-primary\">["+
					 name+"]</span>: "+desc;
		groupWork.setLog(log);
		int res=groupWorkService.add(groupWork);
		if(res>=1)
			return Result.success("记录成功");
		return Result.failure("记录失败");
	}
	
	@RequestMapping("submit/{id}/{workid}")
	public String submit(@PathVariable("id") int projectId,@PathVariable("workid") int workId,HttpSession session) {
		User user =(User)session.getAttribute("user");
		GroupWork groupWork= groupWorkService.getByWorkIdAndMasterId(workId, user.getId());
		if(groupWork!=null)
			session.getServletContext().setAttribute("groupWork", groupWork);
		else
			session.getServletContext().setAttribute("groupWork", null);
		return "student/submitjob";
	}
	
	@ResponseBody
	@RequestMapping("update/{id}")
	public Result update(@PathVariable("id") int id,String attachment) {
		GroupWork groupWork = groupWorkService.get(id);
		groupWork.setAttachment(attachment);
		groupWorkService.update(id, attachment);
		return Result.success("提交成功");
	}
	
	@RequestMapping("detailmy/{id}/{workid}")
	public String detailMy(@PathVariable("id") int id,@PathVariable("workid") int workId,HttpSession session) {
		User user = (User) session.getAttribute("user");
		GroupWork groupWork = new GroupWork();
		groupWork.setMasterId(user.getId());
		groupWork.setWorkId(workId);
		GroupWork gw = groupWorkService.getMyWorkDetail(groupWork);
		session.getServletContext().setAttribute("gw", gw);
		return "student/logmy";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(@PathVariable("id") int id,HttpSession session) {
		GroupWork gw = groupWorkService.get(id);
		session.getServletContext().setAttribute("gw", gw);
		return "teacher/log";
	}
	
	@RequestMapping("list/{id}")
	public String list(@PathVariable("id") int id,HttpSession session) {
		List<GroupWork> gwList = groupWorkService.getWorkGroupList(id);
		if(gwList==null||gwList.size()==0)
			return "teacher/groupworklist";
		for (GroupWork groupWork : gwList) {
			List<String> userIdList=workService.getUserIdListByWorkId(id,groupWork.getMasterId());
			int process = 0;
			int size= 0;
			if(userIdList!=null&&userIdList.size()>0) {
				for (String string : userIdList) {
					process+=(taskService.getProcessByUserIdAndWorkId(string, id))==null?0:(taskService.getProcessByUserIdAndWorkId(string, id));
				}
				size = userIdList.size();
				process=process/size;
			}
			groupWork.setProcess(process);
			groupWork.setMaster(userService.getUserInfo(groupWork.getMasterId()));
			String userId= workService.getProjectOwner(groupWork.getWorkId());
			if(userId.equals(((User)session.getAttribute("user")).getId()))
				groupWork.setEnable(1);
			else
				groupWork.setEnable(0);
		}
		session.getServletContext().setAttribute("gwList", gwList);
		return "teacher/groupworklist";
	}
	
	@RequestMapping("scoreinit/{id}")
	public String scoreinit(@PathVariable("id") int id,HttpServletRequest request) {
		GroupWork gw = groupWorkService.get(id);
		request.setAttribute("id", id);
		if(gw!=null&&gw.getScore()!=0)
			return "redirect:/groupwork/detail/"+id;
		return "teacher/score";
	}
	
	@ResponseBody
	@RequestMapping("score/{id}")
	public Result score(@PathVariable("id") int id,String comment,int score) {
		GroupWork gw = new GroupWork();
		gw.setId(id);
		gw.setComment(comment);
		gw.setScore(score);
		groupWorkService.score(gw);
		return Result.success("审批成功");
	}
	
}
