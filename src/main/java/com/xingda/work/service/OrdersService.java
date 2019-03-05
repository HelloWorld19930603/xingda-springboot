package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xingda.work.domain.Orders;
import com.xingda.work.mapper.OrdersMapper;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {
    @Resource
    OrdersMapper ordersMapper;

    public OrdersService() {
    }

    public int insert(Orders orders) {
        return this.ordersMapper.insert(orders);
    }

    public List<Orders> selectAll(int workId) {
        return this.ordersMapper.selectList((Wrapper)(new QueryWrapper<Orders>()).lambda().eq(Orders::getWorkId, workId));
    }

    public void update(Orders orders) {
        this.ordersMapper.updateById(orders);
    }

    public Orders selectByStatus(int workId, byte status) {
        List<Orders> list = this.ordersMapper.selectList((new QueryWrapper<Orders>().lambda().eq(Orders::getWorkId, workId)).eq(Orders::getStatus, status));
        return list != null && list.size() != 0 ? list.get(list.size() - 1) : null;
    }

    public List<Orders> selectPage(String customerName, int index, int pageSize) {
        return this.ordersMapper.selectPage(new Page(index, pageSize), new QueryWrapper<Orders>().lambda().eq(Orders::getCustomerName, customerName)).getRecords();
    }

    public Orders selectById(int id) {
        return this.ordersMapper.selectById(id);
    }

    public List<Orders> selectForTime(String customerName) {
        return this.ordersMapper.selectList(new QueryWrapper<Orders>().lambda().eq(Orders::getCustomerName, customerName).isNotNull(Orders::getTimeDiff));
    }
}
