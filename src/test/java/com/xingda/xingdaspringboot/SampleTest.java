package com.xingda.xingdaspringboot;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xingda.maintenance.domain.User1;
import com.xingda.maintenance.domain.Info;
import com.xingda.maintenance.mapper.InfoMapper;
import com.xingda.maintenance.mapper.UserMapper;
import org.junit.Assert;
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
    private UserMapper userMapper;
    @Resource
    InfoMapper infoMapper;
    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<User1> user1List = userMapper.selectList(null);
        Assert.assertEquals(5, user1List.size());
        user1List.forEach(System.out::println);
    }

    @Test
    public void test1(){
        List<User1> user1List = userMapper.selectList(new LambdaQueryWrapper<User1>().like(User1::getName, "c"));
        user1List.forEach(System.out::println);

    }

    @Test
    public void test2(){
        String remark = "";
        List<Info> infoList = infoMapper.selectList(new LambdaQueryWrapper<Info>().like(Info::getName,remark).or()
                .like(Info::getProject,remark).or().like(Info::getProduct,remark).orderByDesc(Info::getId));
        infoList.forEach(System.out::println);

    }



    @Test
    public void test3(){
        String remark = "";
        int num = infoMapper.selectCount(new LambdaQueryWrapper<Info>().like(Info::getName,remark).or()
                .like(Info::getProject,remark).or().like(Info::getProduct,remark));
        System.out.println(num);

    }

    @Test
    public void test4(){
        String remark = "";
        Info info = infoMapper.selectOneInfo(new LambdaQueryWrapper<Info>().like(Info::getName,remark).or()
                .like(Info::getProject,remark).or().like(Info::getProduct,remark).orderByDesc(Info::getId));
        System.out.println(info.toString());

    }
}