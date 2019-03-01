package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    public List selectByName(String name,String userName,String userId){
        return customerMapper.selectList(new QueryWrapper<Customer>().lambda()
                .like(StringUtil.isNotEmpty(name),Customer::getName,name)
                .eq(StringUtil.isNotEmpty(userId),Customer::getUserId,userId)
                .like(StringUtil.isNotEmpty(userName),Customer::getUserName,userName ));
    }

    public Customer selectOne(String name){
        return customerMapper.selectOne(new QueryWrapper<Customer>().lambda().eq(Customer::getName,name));
    }

    public int insert(Customer customer) {
        return customerMapper.insert(customer);
    }

    public void updateByName(Customer customer){
        customerMapper.update(customer,new UpdateWrapper<Customer>().lambda().eq(Customer::getName,customer.getName()));
    }

    public void update(Customer customer){
        customerMapper.updateById(customer);
    }

    public List selectPage(String name, String userName, String userId, int index, int pageSize) {
        return customerMapper.selectPage(new Page<>(index,pageSize),new QueryWrapper<Customer>().lambda()
                .like(StringUtil.isNotEmpty(name),Customer::getName,name)
                .eq(StringUtil.isNotEmpty(userId),Customer::getUserId,userId)
                .like(StringUtil.isNotEmpty(userName),Customer::getUserName,userName )).getRecords();
    }
}
