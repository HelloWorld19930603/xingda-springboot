package com.xingda.maintenance.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.xingda.maintenance.domain.PurchaseInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface PurchaseInfoMapper extends BaseMapper<PurchaseInfo> {

    @Select("select top 1 * from purchase_info ${ew.customSqlSegment}")
    PurchaseInfo selectOneInfo(@Param(Constants.WRAPPER) Wrapper wrapper);
}
