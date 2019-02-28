package com.xingda.work.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xingda.work.domain.Work;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface WorkMapper extends BaseMapper<Work> {

    @Update("update work set status = ${status} where id = ${id}")
    void updateStatus(int status,int id);

    @ResultType(Integer.class)
    @Select("select count(*) from work " +
            "WHERE datediff(day,create_time,getdate())=0 " +
            "and status = 3 " +
            "and user_id = #{userId} " +
            "union all " +
            "select count(*) from work " +
            "WHERE (DATEPART(yy, create_time) = DATEPART(yy, GETDATE())) " +
            "AND (DATEPART(mm, create_time) = DATEPART(mm, GETDATE())) " +
            "and status = 3 " +
            "and user_id = #{userId} " +
            "union all " +
            "select count(*) from work " +
            "WHERE (DATEPART(yy, create_time) = DATEPART(yy, GETDATE())) " +
            "AND (DATEPART(mm, create_time) = DATEPART(mm, GETDATE())-1) " +
            "and status = 3 " +
            "and user_id = #{userId} " +
            "union all " +
            "select count(*) from work " +
            "WHERE (DATEPART(yy, create_time) = DATEPART(yy, GETDATE())) " +
            "AND (DATEPART(mm, create_time) = DATEPART(mm, GETDATE())-1) " +
            "and status != 3 " +
            "and user_id = #{userId} "  )
    List<Integer> countWorks(@Param("userId") String userId);
}
