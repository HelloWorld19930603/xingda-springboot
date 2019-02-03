package com.xingda.xingdaspringboot;

import com.taobao.api.ApiException;
import com.xingda.utils.DingTalkUtil;
import org.junit.Test;

public class DemoTest {

    @Test
    public void test1() throws ApiException {
        System.out.println(DingTalkUtil.getKey());
    }
}
