package com.application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.bean.Group;
import com.application.bean.Page;
import com.application.bean.Task;
import com.application.bean.User;
import com.application.bean.Work;
import com.application.constant.Constant;
import com.application.dto.Result;
import com.application.service.GroupService;
import com.application.service.TaskService;
import com.application.service.UserGroupService;
import com.application.service.UserService;
import com.application.service.WorkService;
import com.application.util.PageUtil;
import com.application.util.TimeUtil;

@Controller
@RequestMapping("task")
public class TaskController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private TaskService taskService;
	
	@Autowired
	private WorkService workService;
	
	@ResponseBody
	@RequestMapping("process/{id}")
	public Result process(@PathVariable("id") int id,int process) {
		if(process<0||process>100)
			return Result.failure("更新失败，请输入0-100的数字");
		Task task=taskService.get(id);
		task.setProcess(process);
		int res= taskService.updateProcess(task);
		if(res>=1)
			return Result.success("更新成功");
		return Result.failure("更新失败");
	}
	
	@RequestMapping("distribute/{id}/{workid}")
	public String distribute(@PathVariable("id") int projectId,@PathVariable("workid") int workId,HttpSession session) {
		User user = (User)session.getAttribute("user");
		Group group=groupService.getGroupByProIdUserId(projectId, user.getId());
		Task task = new Task();
		if(group==null) {
			session.getServletContext().setAttribute("userList", null);
			return "student/distributetask";
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
		return "student/distributetask";
	}
	
	@ResponseBody
	@RequestMapping("assgin")
	public Result assgin(Task task) {
		task.setTime(TimeUtil.currentTime());
		Task t = taskService.currentTask(task);
		if(t!=null)
		{
			task.setContent(t.getContent()+task.getContent());
			taskService.appendTask(task);
			return Result.success("追加任务成功");
		}
		int res = taskService.add(task);
		if(res>=1) {
			return Result.success("分配成功");
		}
		return Result.failure("分配失败");
	}
	
	@RequestMapping("mytask")
	public String myTask(@RequestParam(value="page",required = false ,defaultValue="0")int pageNo,HttpSession session) {
		User user=(User) session.getAttribute("user");
		int total = taskService.getTaskCount(user.getId());
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Task> myTaskList = taskService.getTaskList(user.getId(), page);
		for (Task task : myTaskList) {
			Work work = workService.getWorkById(task.getWorkId());
			task.setWork(work);
		}
		session.setAttribute("myTaskList", myTaskList);
		session.setAttribute("myTaskPage", page);
		return "student/mytask";
	}
}
