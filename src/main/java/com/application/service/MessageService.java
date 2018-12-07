package com.application.service;

import java.util.List;

import com.application.bean.Message;
import com.application.bean.Page;
import com.application.param.MessageParam;

public interface MessageService {
	
	int add(Message msg);
	
	List<Message> get(MessageParam param);
	
	List<Message> getByPage(MessageParam param,Page page);
	
	int getMessageCount(MessageParam param);
	
	int getUnreadCount();
	
	Message getById(int id);
	
	int update(Message msg);
}
