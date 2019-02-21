package com.xingda.work.controller;

import com.taobao.api.ApiException;
import com.xingda.utils.DingTalkUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DingDingController {

    @RequestMapping("getConfig")
    @ResponseBody
    public Object getConfig(HttpServletRequest request) throws ApiException {

        return DingTalkUtil.getConfig(request);
    }
}
