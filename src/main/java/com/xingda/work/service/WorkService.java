package com.xingda.work.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    public List selectAll(String userId, String userName) {
        return workMapper.selectList(new QueryWrapper<Work>().lambda().eq(StringUtil.isNotEmpty(userId),Work::getUserId, userId).like(StringUtil.isNotEmpty(userName), Work::getUserName, userName));
    }

    public IPage<Work> selectPage(String userId, String userName, int index, int pageSize) {
        Page<Work> page = new Page<>(index,pageSize);
        return workMapper.selectPage(page,new QueryWrapper<Work>().lambda().eq(StringUtil.isNotEmpty(userId),Work::getUserId, userId).like(StringUtil.isNotEmpty(userName), Work::getUserName, userName).orderByDesc(Work::getCreateTime));
    }

    public Work selectById(Integer id) {
        return workMapper.selectById(id);
    }

    public List countWorks(String userId){
        return workMapper.countWorks(userId);
    }
}
