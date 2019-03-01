package com.xingda.work.controller;

import com.xingda.work.domain.UserDetail;
import com.xingda.work.service.UserService;
import com.xingda.work.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/genergy")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    WorkService workService;

    @RequestMapping(value = "/userDetail", method = RequestMethod.GET)
    public String showUser(String userId, Model model){

        UserDetail userDetail = userService.getUserById(userId);
        model.addAttribute("userDetail", userDetail);
        List list = workService.countWorks(userId);
        Map map = new HashMap<String,Integer>();
        map.put("w1",list.get(0));
        map.put("w2",list.get(1));
        map.put("w3",list.get(2));
        map.put("w4",list.get(3));
        model.addAttribute("works",map);
        List page = workService.selectPage(userId,null,1,4);
        model.addAttribute("page",page);
        return "userDetail";
    }


}
