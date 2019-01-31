package com.xingda.xingdaspringboot;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xingda.maintenance.domain.PurchaseInfo;
import com.xingda.maintenance.mapper.PurchaseInfoMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SampleTest {

    @Resource
    PurchaseInfoMapper purchaseInfoMapper;


    @Test
    public void test2(){
        String remark = "";
        List<PurchaseInfo> purchaseInfoList = purchaseInfoMapper.selectList(new LambdaQueryWrapper<PurchaseInfo>().like(PurchaseInfo::getName,remark).or()
                .like(PurchaseInfo::getProject,remark).or().like(PurchaseInfo::getProduct,remark).orderByDesc(PurchaseInfo::getId));
        purchaseInfoList.forEach(System.out::println);

    }



    @Test
    public void test3(){
        String remark = "";
        int num = purchaseInfoMapper.selectCount(new LambdaQueryWrapper<PurchaseInfo>().like(PurchaseInfo::getName,remark).or()
                .like(PurchaseInfo::getProject,remark).or().like(PurchaseInfo::getProduct,remark));
        System.out.println(num);

    }

    @Test
    public void test4(){
        String remark = "";
        PurchaseInfo purchaseInfo = purchaseInfoMapper.selectOneInfo(new LambdaQueryWrapper<PurchaseInfo>().like(PurchaseInfo::getName,remark).or()
                .like(PurchaseInfo::getProject,remark).or().like(PurchaseInfo::getProduct,remark).orderByDesc(PurchaseInfo::getId));
        System.out.println(purchaseInfo.toString());

    }
}