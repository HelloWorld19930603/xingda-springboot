package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xingda.utils.StringUtil;
import com.xingda.work.domain.WorkOrder;
import com.xingda.work.mapper.WorkOrderMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WorkOrderService {

    @Resource
    WorkOrderMapper workOrderMapper;

    public int insert(WorkOrder workOrder){
       return workOrderMapper.insert(workOrder);
    }

    public void update(WorkOrder workOrder) {
        workOrderMapper.updateById(workOrder);
    }

    public List selectAll(Integer userId, String customer) {
        return workOrderMapper.selectList(new QueryWrapper<WorkOrder>().lambda().eq(StringUtil.isNotEmpty(userId),WorkOrder::getUserId, userId).like(StringUtil.isNotEmpty(customer),WorkOrder::getCustomer, customer));
    }
}
