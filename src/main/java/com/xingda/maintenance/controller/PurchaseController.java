package com.xingda.maintenance.controller;

import com.alibaba.fastjson.JSONObject;
import com.xingda.maintenance.domain.Info;
import com.xingda.maintenance.service.InfoService;
import com.xingda.utils.KdniaoTrackQueryAPI;
import com.xingda.utils.SqlUtils;
import com.xingda.utils.StringUtils;
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
    InfoService infoService;

    @RequestMapping(value = "input",method = RequestMethod.GET)
    public String input(){
        return "input";
    }
    @RequestMapping(value = "input",method = RequestMethod.POST)
    @ResponseBody
    public Object input(Info info){
        infoService.insertOne(info);
        return 0;
    }

    @RequestMapping(value = "output",method = RequestMethod.GET)
    public String output(String mark, Model model){
        Info info = infoService.selectOne(mark);
        String com = info.getCom().toUpperCase();
        String no = info.getNo();
        if(StringUtils.notNull(com) && StringUtils.notNull(no)){
            JSONObject logistics = KdniaoTrackQueryAPI.getLogistics(com,no);
            model.addAttribute("logistics",logistics);
        }
        model.addAttribute("info", info);
        return "output";
    }
    @RequestMapping(value = "output",method = RequestMethod.POST)
    @ResponseBody
    public Object output(String mark){
        if (mark == null) {
            mark = "";
        }
        int num = infoService.selectCount(mark);
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
