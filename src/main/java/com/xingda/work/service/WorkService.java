package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xingda.utils.StringUtil;
import com.xingda.work.domain.Work;
import com.xingda.work.mapper.WorkMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WorkService {

    @Resource
    WorkMapper workMapper;

    public int insert(Work work){
       return workMapper.insert(work);
    }

    public void update(Work work) {
        workMapper.updateById(work);
    }

    public void updateStatus(int status,int id) {
        workMapper.updateStatus(status,id);
    }

    public List selectAll(Integer userId, String userName) {
        return workMapper.selectList(new QueryWrapper<Work>().lambda().eq(StringUtil.isNotEmpty(userId),Work::getUserId, userId).like(StringUtil.isNotEmpty(userName), Work::getUserName, userName));
    }

    public Work selectById(Integer id) {
        return workMapper.selectById(id);
    }
}
