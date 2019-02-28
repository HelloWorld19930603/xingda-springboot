package com.xingda.maintenance.controller;

import com.taobao.api.ApiException;
import com.xingda.utils.DingTalkUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class DataController {

    @RequestMapping(value = "demo", method = RequestMethod.GET)
    public String demo(Model model, HttpServletRequest request) throws ApiException {
        model.addAttribute("config",DingTalkUtil.getConfig(request));
        return "demo";
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) throws ApiException {
        model.addAttribute("config",DingTalkUtil.getConfig(request));
        return "index";
    }

    @RequestMapping("getAccessToken")
    @ResponseBody
    public Map getAccessToken()  {
        try {
            Map map = new HashMap<String,String>();
            map.put("token", DingTalkUtil.getAccessToken());
            return map;
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("getUserId")
    @ResponseBody
    public Map getUserId(String code) {
        try {
            Map map = new HashMap<String,String>();
            map.put("userId", DingTalkUtil.getUserId(code));
            return map;
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("getUser")
    @ResponseBody
    public Map getUser(String code) {
        try {
            Map map = new HashMap<String,String>();
            map.put("user", DingTalkUtil.getUser(code));
            return map;
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return null;
    }
}
