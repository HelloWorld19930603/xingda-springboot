package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xingda.work.domain.Orders;
import com.xingda.work.mapper.OrdersMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdersService {

    @Resource
    OrdersMapper ordersMapper;

    public int insert(Orders orders){
        return ordersMapper.insert(orders);
    }

    public List selectAll(int workId) {
        return ordersMapper.selectList(new QueryWrapper<Orders>().lambda().eq(Orders::getWorkId, workId));
    }
}
