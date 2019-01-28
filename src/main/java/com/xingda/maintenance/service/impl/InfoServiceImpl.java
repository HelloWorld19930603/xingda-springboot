package com.xingda.maintenance.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xingda.maintenance.domain.Info;
import com.xingda.maintenance.mapper.InfoMapper;
import com.xingda.maintenance.service.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class InfoServiceImpl implements InfoService {

    @Resource
    InfoMapper infoMapper;

    @Override
    public Info selectOne(String mark) {
        Info info = infoMapper.selectOneInfo(new LambdaQueryWrapper<Info>().like(Info::getName,mark).or()
                .like(Info::getProject,mark).or().like(Info::getProduct,mark).orderByDesc(Info::getId));;
        return info;
    }

    @Override
    public void insertOne(Info info) {
        infoMapper.insert(info);
    }

    @Override
    public int selectCount(String mark) {
        return infoMapper.selectCount(new LambdaQueryWrapper<Info>().like(Info::getName,mark).or()
                .like(Info::getProject,mark).or().like(Info::getProduct,mark));
    }
}
