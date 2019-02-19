package com.xingda.maintenance.controller;

import com.alibaba.fastjson.JSONObject;
import com.taobao.api.ApiException;
import com.xingda.maintenance.domain.PurchaseInfo;
import com.xingda.maintenance.service.PurchaseInfoService;
import com.xingda.utils.DingTalkUtil;
import com.xingda.utils.KdniaoTrackQueryAPI;
import com.xingda.utils.SqlUtils;
import com.xingda.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PurchaseController {

    @Autowired
    SqlUtils sqlUtils;
    @Autowired
    PurchaseInfoService purchaseInfoService;

    @RequestMapping(value = "input",method = RequestMethod.GET)
    public String input(){
        return "input";
    }
    @RequestMapping(value = "input",method = RequestMethod.POST)
    @ResponseBody
    public Object input(PurchaseInfo purchaseInfo,String code,Model model) throws ApiException {
        purchaseInfoService.insertOne(purchaseInfo);
        System.out.println(code+"--"+ DingTalkUtil.getUserId(code));
        model.addAttribute("code",code);
        return 0;
    }

    @RequestMapping(value = "output",method = RequestMethod.GET)
    public String output(String mark, Model model){
        PurchaseInfo purchaseInfo = purchaseInfoService.selectOne(mark);
        String com = purchaseInfo.getCom().toUpperCase();
        String no = purchaseInfo.getNo();
        if(StringUtil.notNull(com) && StringUtil.notNull(no)){
            JSONObject logistics = KdniaoTrackQueryAPI.getLogistics(com,no);
            model.addAttribute("logistics",logistics);
        }
        model.addAttribute("purchaseInfo", purchaseInfo);
        return "output";
    }
    @RequestMapping(value = "output",method = RequestMethod.POST)
    @ResponseBody
    public Object output(String mark){
        if (mark == null) {
            mark = "";
        }
        int num = purchaseInfoService.selectCount(mark);
        if (num == 0) {
            return 0;
        } else {
            return 1;
        }
    }
    @RequestMapping(value = "search",method = RequestMethod.GET)
    public String search(){
        return "search";
    }
    @RequestMapping(value = "search.jsp",method = RequestMethod.GET)
    public String search2(){
        return "search";
    }
}
