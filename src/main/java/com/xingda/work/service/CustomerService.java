package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xingda.utils.StringUtil;
import com.xingda.work.domain.Customer;
import com.xingda.work.mapper.CustomerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerService {

    @Resource
    CustomerMapper customerMapper;

    public List selectByName(String name){
        return customerMapper.selectList(new QueryWrapper<Customer>().lambda().like(StringUtil.isNotEmpty(name),Customer::getName,name));
    }

    public int insert(Customer customer) {
        return customerMapper.insert(customer);
    }
}
