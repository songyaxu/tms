package com.application.service;

import java.util.List;

import com.application.bean.User;
import com.application.dto.Result;

public interface UserService {
	
    Result login(User user);
    
    User getUserInfo(String id);
    
    Result update(User user,String oldpwd);
    
    Result getUser(String id);
    
    List<User> getGroupUserList(int id);
}
