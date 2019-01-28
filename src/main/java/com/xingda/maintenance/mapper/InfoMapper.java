package com.xingda.maintenance.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.xingda.maintenance.domain.Info;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface InfoMapper extends BaseMapper<Info> {

    @Select("select top 1 * from info ${ew.customSqlSegment}")
    public Info selectOneInfo(@Param(Constants.WRAPPER) Wrapper wrapper);
}
