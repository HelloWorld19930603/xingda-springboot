package com.xingda.work.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xingda.work.domain.Work;
import org.apache.ibatis.annotations.Update;

public interface WorkMapper extends BaseMapper<Work> {

    @Update("update work set status = ${status} where id = ${id}")
    public void updateStatus(int status,int id);
}
