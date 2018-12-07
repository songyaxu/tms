package com.application.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.application.bean.User;
import com.application.dao.MessageDAO;
import com.application.dao.UserDAO;
import com.application.dto.Result;
import com.application.service.UserService;
import com.application.util.MD5Util;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private MessageDAO messageDAO;
	
	protected HttpServletRequest getServletRequest() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
	
	protected HttpSession getSession() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
    }
	
	@Override
	public Result login(User user) {
		User u = userDAO.get(user.getId());
		if(u==null)
			return Result.failure("用户不存在，请检查用户名");
		if(u.getPwd().equals(MD5Util.md5(user.getPwd())))
		{
			getSession().setAttribute("user", u);
			getSession().setAttribute("unreadCount", messageDAO.getUserUnreadCount(u.getId()));
			return Result.success("登录成功，跳转到主页...");
		}
		return Result.failure("密码不正确");
	}

	@Override
	public User getUserInfo(String id) {
		return userDAO.get(id);
	}

	@Override
	public Result update(User user, String oldpwd) {
		String pwd=user.getPwd();
		user.setPwd("");
		User currentUser = (User) getSession().getAttribute("user");
		if(oldpwd!=null&&!"".equals(oldpwd)) {
			if(currentUser.getPwd().equals(MD5Util.md5(oldpwd))) {
				user.setPwd(MD5Util.md5(pwd));
				userDAO.update(user);
				getSession().setAttribute("user", userDAO.get(user.getId()));
				return Result.success("更新资料和密码成功");
			}
			else {
				return Result.failure("原密码不正确");
			}
		}
		userDAO.update(user);
		getSession().setAttribute("user", userDAO.get(user.getId()));
		return Result.success("更新资料成功");
	}

	@Override
	public Result getUser(String id) {
		User user = userDAO.get(id);
		if(user==null)
			return Result.failure("用户不存在，请核实用户ID");
		return Result.success("存在用户");
	}

	@Override
	public List<User> getGroupUserList(int id) {
		return this.userDAO.getGroupUserList(id);
	}

	
	
}
