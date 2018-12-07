package com.application.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.application.bean.User;
import com.application.param.UserParam;

public interface UserDAO {
	
    Integer update(@Param("u") User user);
    
    User get(String id);
    
    Integer add(@Param("u") User user);
    
    Integer getTotalCount(@Param("param") UserParam param);
    
    List<User> getGroupUserList(int id);
}
