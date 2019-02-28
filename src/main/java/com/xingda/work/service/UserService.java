package com.xingda.work.service;

import com.xingda.work.domain.UserDetail;
import com.xingda.work.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService {

    @Resource
    public UserMapper userMapper;

    public UserDetail getUserById(String id){
        return userMapper.selectById(id);
    }

    public void insert(UserDetail userDetail){
        userMapper.insert(userDetail);
    }
}
