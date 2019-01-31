package com.xingda.maintenance.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xingda.maintenance.domain.PurchaseInfo;
import com.xingda.maintenance.mapper.PurchaseInfoMapper;
import com.xingda.maintenance.service.PurchaseInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PurchaseInfoServiceImpl implements PurchaseInfoService {

    @Resource
    PurchaseInfoMapper purchaseInfoMapper;

    @Override
    public PurchaseInfo selectOne(String mark) {
        PurchaseInfo purchaseInfo = purchaseInfoMapper.selectOneInfo(new LambdaQueryWrapper<PurchaseInfo>().like(PurchaseInfo::getName,mark).or()
                .like(PurchaseInfo::getProject,mark).or().like(PurchaseInfo::getProduct,mark).orderByDesc(PurchaseInfo::getId));;
        return purchaseInfo;
    }

    @Override
    public void insertOne(PurchaseInfo purchaseInfo) {
        purchaseInfoMapper.insert(purchaseInfo);
    }

    @Override
    public int selectCount(String mark) {
        return purchaseInfoMapper.selectCount(new LambdaQueryWrapper<PurchaseInfo>().like(PurchaseInfo::getName,mark).or()
                .like(PurchaseInfo::getProject,mark).or().like(PurchaseInfo::getProduct,mark));
    }
}
