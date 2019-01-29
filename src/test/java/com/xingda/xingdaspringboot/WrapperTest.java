package com.xingda.xingdaspringboot;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author miemie
 * @since 2018-08-10
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class WrapperTest {

    @Resource
    private UserMapper User1Mapper;


    @Test
    public void tests() {
        System.out.println("----- 普通查询 ------");
        List<User1> plainUser1s = User1Mapper.selectList(new QueryWrapper<User1>().eq("id", 2L));
        List<User1> lambdaUser1s = User1Mapper.selectList(new QueryWrapper<User1>().lambda().eq(User1::getId, 2L));
        Assert.assertEquals(plainUser1s.size(), lambdaUser1s.size());
        print(plainUser1s);

        System.out.println("----- 带子查询(sql注入) ------");
        List<User1> plainUser1s2 = User1Mapper.selectList(new QueryWrapper<User1>()
                .inSql("id", "select id from user1 where id = 2"));
        List<User1> lambdaUser1s2 = User1Mapper.selectList(new QueryWrapper<User1>().lambda()
                .inSql(User1::getId, "select id from user1 where id = 2"));
        Assert.assertEquals(plainUser1s2.size(), lambdaUser1s2.size());
        print(plainUser1s2);

        System.out.println("----- 带嵌套查询 ------");
        List<User1> plainUser1s3 = User1Mapper.selectList(new QueryWrapper<User1>()
                .nested(i -> i.eq("id", 2L).or().eq("id", 3L))
                .and(i -> i.ge("age", 20)));
        List<User1> lambdaUser1s3 = User1Mapper.selectList(new QueryWrapper<User1>().lambda()
                .nested(i -> i.eq(User1::getId, 2L).or().eq(User1::getId, 3L))
                .and(i -> i.ge(User1::getAge, 20)));
        Assert.assertEquals(plainUser1s3.size(), lambdaUser1s3.size());
        print(plainUser1s3);

        System.out.println("----- 自定义(sql注入) ------");
        List<User1> plainUser1s4 = User1Mapper.selectList(new QueryWrapper<User1>()
                .apply("id = 2"));
        print(plainUser1s4);

        UpdateWrapper<User1> uw = new UpdateWrapper<>();
        uw.set("email", null);
        uw.eq("id",4);
        User1Mapper.update(new User1(), uw);
        User1 u4 = User1Mapper.selectById(4);
        Assert.assertNull(u4.getEmail());


    }

    @Test
    public void lambdaQueryWrapper(){
        System.out.println("----- 普通查询 ------");
        List<User1> plainUser1s = User1Mapper.selectList(new LambdaQueryWrapper<User1>().eq(User1::getId, 2L));
        List<User1> lambdaUser1s = User1Mapper.selectList(new QueryWrapper<User1>().lambda().eq(User1::getId, 2L));
        Assert.assertEquals(plainUser1s.size(), lambdaUser1s.size());
        print(plainUser1s);

        System.out.println("----- 带子查询(sql注入) ------");
        List<User1> plainUser1s2 = User1Mapper.selectList(new LambdaQueryWrapper<User1>()
                .inSql(User1::getId, "select id from user1 where id = 2"));
        List<User1> lambdaUser1s2 = User1Mapper.selectList(new QueryWrapper<User1>().lambda()
                .inSql(User1::getId, "select id from user1 where id = 2"));
        Assert.assertEquals(plainUser1s2.size(), lambdaUser1s2.size());
        print(plainUser1s2);

        System.out.println("----- 带嵌套查询 ------");
        List<User1> plainUser1s3 = User1Mapper.selectList(new LambdaQueryWrapper<User1>()
                .nested(i -> i.eq(User1::getId, 2L).or().eq(User1::getId, 3L))
                .and(i -> i.ge(User1::getAge, 20)));
        List<User1> lambdaUser1s3 = User1Mapper.selectList(new QueryWrapper<User1>().lambda()
                .nested(i -> i.eq(User1::getId, 2L).or().eq(User1::getId, 3L))
                .and(i -> i.ge(User1::getAge, 20)));
        Assert.assertEquals(plainUser1s3.size(), lambdaUser1s3.size());
        print(plainUser1s3);

        System.out.println("----- 自定义(sql注入) ------");
        List<User1> plainUser1s4 = User1Mapper.selectList(new QueryWrapper<User1>()
                .apply("id = 2"));
        print(plainUser1s4);

        UpdateWrapper<User1> uw = new UpdateWrapper<>();
        uw.set("email", null);
        uw.eq("id",4);
        User1Mapper.update(new User1(), uw);
        User1 u4 = User1Mapper.selectById(4);
        Assert.assertNull(u4.getEmail());
    }

    private <T> void print(List<T> list) {
        if (!CollectionUtils.isEmpty(list)) {
            list.forEach(System.out::println);
        }
    }
}
