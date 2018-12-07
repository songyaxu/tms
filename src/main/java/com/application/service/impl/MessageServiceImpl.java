package com.application.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.application.bean.Message;
import com.application.bean.Page;
import com.application.bean.User;
import com.application.dao.MessageDAO;
import com.application.param.MessageParam;
import com.application.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDAO messageDAO;
	
	@Override
	public int add(Message msg) {
		return messageDAO.add(msg);
	}
	
	protected HttpServletRequest getServletRequest() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
	
	protected HttpSession getSession() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
    }
	
	@Override
	public List<Message> get(MessageParam param) {
		return messageDAO.get(param);
	}

	@Override
	public int getMessageCount(MessageParam param) {
		return messageDAO.getMessageCount(param);
	}

	@Override
	public int getUnreadCount() {
		User user = (User) getSession().getAttribute("user");
		MessageParam param = new MessageParam();
		param.setState("0");
		param.setReceiveId(user.getId());
		return messageDAO.getMessageCount(param);
	}

	@Override
	public List<Message> getByPage(MessageParam param, Page page) {
		return messageDAO.getByPage(param, page);
	}

	@Override
	public Message getById(int id) {
		return messageDAO.getById(id);
	}

	@Override
	public int update(Message msg) {
		return messageDAO.update(msg);
	}
	
}
