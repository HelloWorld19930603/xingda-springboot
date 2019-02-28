package com.xingda.work.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xingda.work.domain.OrderImg;
import com.xingda.work.mapper.OrderImgMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderImgService {

    @Resource
    OrderImgMapper orderImgMapper;

    public void insert(OrderImg orderImg){
        orderImgMapper.insert(orderImg);
    }

    public List selectAll(int orderId){
        return orderImgMapper.selectList(new QueryWrapper<OrderImg>().lambda().eq(OrderImg::getOrderId,orderId));
    }
}
