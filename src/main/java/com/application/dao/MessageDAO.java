package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.Message;
import com.application.bean.Page;
import com.application.param.MessageParam;

public interface MessageDAO {
	
	Integer getUserUnreadCount(String id);
	
	Message getById(int id);
	
	Integer add(@Param("msg") Message msg);
	
	List<Message> get(@Param("param")MessageParam param);
	
	List<Message> getByPage(@Param("param")MessageParam param,@Param("page") Page page);
	
	Integer getMessageCount(@Param("param")MessageParam param);
	
	Integer update(@Param("msg") Message msg); 
}
