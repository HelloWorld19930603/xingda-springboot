package com.xingda.work.service;

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
        return workOrderMapper.selectList(null);
    }
}
